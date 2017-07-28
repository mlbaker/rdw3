Class RDW.Installer Extends %Persistent
{

Property ObjectToLoad As %String;

ClassMethod Initialize()
{
	// Add VistaSite as an object to load.
	Do ..%KillExtent()
		
	Set oref=..%New()
	Set oref.ObjectToLoad="RDW.Server"
	Do oref.%Save()
	
	Set oref=..%New()
	Set oref.ObjectToLoad="RDW.CacheInstance"
	Do oref.%Save()
	
	Set oref=..%New()
	Set oref.ObjectToLoad="RDW.VistaSite"
	Do oref.%Save()
	
	Set oref=..%New()
	Set oref.ObjectToLoad="RDW.VistaSiteDatabase"
	Do oref.%Save()
	
	Set oref=..%New()
	Set oref.ObjectToLoad="RDW.RoutineMapping"
	Do oref.%Save()
	
	Set oref=..%New()
	Set oref.ObjectToLoad="RDW.GlobalMapping"
	Do oref.%Save()
	
	Set oref=..%New()
	Set oref.ObjectToLoad="RDW.JournalFile"
	Do oref.%Save()
	
	Set oref=..%New()
	Set oref.ObjectToLoad="RDW.GlobalsToWatch"
	Do oref.%Save()
	
	Set oref=..%New()
	Set oref.ObjectToLoad="RDW.JournalReaderHistory"
	Do oref.%Save()
	
	Set oref=..%New()
	Set oref.ObjectToLoad="RDW.JournalReaderStatus"
	Do oref.%Save()
	
	Set oref=..%New()
	Set oref.ObjectToLoad="RDW.JournalReader"
	Do oref.%Save()
	
	Set oref=..%New()
	Set oref.ObjectToLoad="Dim.VistaFilev001"
	Do oref.%Save()
	
	Set oref=..%New()
	Set oref.ObjectToLoad="Dim.VistaFieldv001"
	Do oref.%Save()
	
	Set oref=..%New()
	Set oref.ObjectToLoad="SPatient.SPatient2v001"
	Do oref.%Save()
	
	Set oref=..%New()
	Set oref.ObjectToLoad="RDW.Utilities"
	Do oref.%Save()
	
	Set oref=..%New()
	Set oref.ObjectToLoad="Apex.VistaDDBrowser"
	Do oref.%Save()
	
	Set oref=..%New()
	Set oref.ObjectToLoad="Allergy.Allergy1208v001"
	Do oref.%Save()
	
	Set oref=..%New()
	Set oref.ObjectToLoad="Dim.LocalDrug50v001"
	Do oref.%Save()
	
	Set oref=..%New()
	Set oref.ObjectToLoad="Dim.NationalDrugFile506v001"
	Do oref.%Save()
	
	Set oref=..%New()
	Set oref.ObjectToLoad="RxOut.RxOutpatOriginalFill52v001"
	Do oref.%Save()
	
	Set oref=..%New()
	Set oref.ObjectToLoad="RxOut.RxOutpatReFill521v001"
	Do oref.%Save()
	
	Set oref=..%New()
	Set oref.ObjectToLoad="RxOut.RxOutpatPartialFill522v001"
	Do oref.%Save()
	
	Set oref=..%New()
	Set oref.ObjectToLoad="PAMPI.PatientInfo"
	Do oref.%Save()	

	Do ..SetupServer()
}

ClassMethod SetupServer()
{
	Do ..InstallAndInitializeClasses()
	Do ..SetupServerECP()
	Do ..SetupServerCSP()
}

ClassMethod InstallAndInitializeClasses()
{
    Set codeDir="/rdwCode/"
    Set id=$Order(^RDW.InstallerD(0))
    While +id {
    	Set objectToLoad=..%OpenId(id).ObjectToLoad
    	Do $system.OBJ.Load(codeDir_$Piece(objectToLoad,".",1)_"/"_$Piece(objectToLoad,".",2)_".cls","ck")
    	Do $CLASSMETHOD(objectToLoad,"Initialize")
    	Set id=$Order(^RDW.InstallerD(id))
    }
}

ClassMethod SetupServerECP()
{
	Set NS=$NAMESPACE
	ZN "%SYS"
	Set ecp=##class(Security.Services).%OpenId("%service_ecp")
	If $IsObject(ecp) {
		Set ecp.Enabled=1
		Do ecp.%Save()
	}
	ZN NS
}

ClassMethod SetupServerCSP()
{
	Set NS=$NAMESPACE
	ZN "%SYS"
	Set csp=##class(Security.Applications).%New()
	Set csp.Name="/csp/rdw",csp.NameSpace="rdw",csp.AutoCompile=1,csp.AutheEnabled=96,csp.CSPZENEnabled=1,csp.Description="RDW Namespace Application"
	Set csp.Enabled=1,csp.Path="/opt/hs2017/csp/rdw",csp.IsNameSpaceDefault=1,csp.IsNameSpaceDefault=1,csp.MatchRoles=":%DB_USER",csp.ServeFiles=1
	Set Status=csp.%Save()
	Write Status,!
	ZN NS
}

ClassMethod SetupClient()
{
	Set cName=$Piece($SYSTEM,":",1)
	Set file=##class(%File).%New("/rdwClient/SeverSetup_"_cName_".txt")
	Do file.Open("NWS")
	Do file.WriteLine($ZDateTime($H))
	Do file.WriteLine("SetupClientDatabases")
	Do ..SetupClientDatabases()
	Do file.WriteLine($ZDateTime($H))
	Do file.WriteLine("SetupClientGlobalMapping")
	Do ..SetupClientGlobalMapping()
	Do file.WriteLine($ZDateTime($H))
	Do file.WriteLine("SetupClientRoutineMapping")
	Do ..SetupClientRoutineMapping()
	Do file.WriteLine($ZDateTime($H))
	Do file.WriteLine("SetupClientJournalDirectory")
	Do ..SetupClientJournalDirectory()
	Do file.WriteLine($ZDateTime($H))
	Do file.WriteLine("Add Journal File Task")
	Do ..AddJFileTask()
	Do file.WriteLine($ZDateTime($H))
	Do file.WriteLine("Loading VISTA Globals...")
	Do ..LoadGlobals()
	Do file.WriteLine($ZDateTime($H))
	Do file.WriteLine("Populating Data Warehouse...")
	Job ..PopulateDW()
	Do file.WriteLine($ZDateTime($H))
	Do file.Close()
	//Do ##class(%File).Delete("/rdwClient/SeverSetup_"_cName_".txt")
}

ClassMethod SetupClientDatabases()
{
	Set NS=$NAMESPACE
	Set tStatement=##class(%SQL.Statement).%New()
	Set cName=$Piece($SYSTEM,":",1)
	Set sql="SELECT  CacheDatabaseDirectory, CacheDatabaseName, "_
		"CacheInstance->InstanceName, VistaSite->Server->ServerName, "_
		"VistaSite->VistaSiteNamespace FROM RDW.VistaSiteDatabase "_
		"WHERE VistaSite->Server->serverName ='"_cName_"' "_
		"AND VistaSite->Active=1"
	Set Status=tStatement.%Prepare(sql)
	Set rSet=tStatement.%Execute()
	While rSet.%Next() {
		Set dbName=rSet.CacheDatabaseName
		Set dbDir=rSet.CacheDatabaseDirectory
		Set nmSp=rSet.VistaSiteNamespace
		ZN "%SYS"
		If ('##class(%File).Exists(dbDir_"/CACHE.DAT")) {
			Set db=##Class(SYS.Database).%New(),db.Directory=dbDir,Status=db.%Save()
		}
		// add database to server.
		Set vista=##Class(Config.Databases).%New(),vista.Name=dbName,vista.Directory=dbDir Do vista.%Save()
		// add namespace to server to access new database
		If dbDir["rou" {
			Set ns=##class(Config.Namespaces).%New(),ns.Name=nmSp,ns.Globals=dbName,ns.Routines=dbName Do ns.%Save()
		}
		ZN NS
	}
	Do rSet.%Close()
}

ClassMethod SetupClientECP()
{
	Set NS=$NAMESPACE
	Set client=##class(%ListOfDataTypes).%New()
	Do client.Insert("rdw")
	ZN "%SYS"
	Set config=##Class(Config.config).Open()
	Do config.%Save()
	Set ecp=##class(Security.Services).%OpenId("%service_ecp")
	If $IsObject(ecp) {
		Set ecp.Enabled=1
		Set ecp.ClientSystems=client
		Do ecp.%Save()
	}
	ZN NS
}

ClassMethod SetupClientGlobalMapping()
{
	Set NS=$NAMESPACE
	Set tStatement=##class(%SQL.Statement).%New()
	Set cName=$Piece($SYSTEM,":",1)
	Set sql="SELECT  VistaSite->VistaSiteNamespace,GlobalName,DatabaseName "_
		"FROM RDW.GlobalMapping "_
		"WHERE VistaSite->Server->ServerName ='"_cName_"' "_
		"AND VistaSite->Active=1"
	Set Status=tStatement.%Prepare(sql)
	Set rSet=tStatement.%Execute()
	While rSet.%Next() {
		Set dbName=rSet.DatabaseName
		Set global=rSet.GlobalName
		Set nmSp=rSet.VistaSiteNamespace
		ZN "%SYS"
		Set map=##Class(Config.MapGlobals).%New(),map.Name=global,map.Namespace=nmSp,map.Database=dbName Do map.%Save()
		ZN NS
	}
	Do rSet.%Close()
}

ClassMethod SetupClientRoutineMapping()
{
	Set NS=$NAMESPACE
	Set tStatement=##class(%SQL.Statement).%New()
	Set cName=$Piece($SYSTEM,":",1)
	Set sql="SELECT  VistaSite->VistaSiteNamespace,RoutineName,VistaSiteDatabase->CacheDatabaseName "_
		"FROM RDW.RoutineMapping "_
		"WHERE VistaSite->Server->ServerName ='"_cName_"' "_
		"AND VistaSite->Active=1"
	Set Status=tStatement.%Prepare(sql)
	Set rSet=tStatement.%Execute()
	While rSet.%Next() {
		Set dbName=rSet.CacheDatabaseName
		Set routine=rSet.RoutineName
		Set nmSp=rSet.VistaSiteNamespace
		ZN "%SYS"
		Set map=##Class(Config.MapRoutines).%New(),map.Name=routine,map.Namespace=nmSp,map.Database=dbName Do map.%Save()
		ZN NS
	}
	Do rSet.%Close()
}

ClassMethod PopulateDW()
{
	Kill Site
	Set tStatement=##class(%SQL.Statement).%New()
	Set cName=$Piece($SYSTEM,":",1)
	Set sql="SELECT  Sta3n "_
		"FROM RDW.VistaSite "_
		"WHERE Server->ServerName ='"_cName_"' "_
		"AND Active=1 AND PopulateDW=1"
	Set Status=tStatement.%Prepare(sql)
	Set rSet=tStatement.%Execute()
	While rSet.%Next() {
		Set Site(rSet.Sta3n)=""
	}
	Do rSet.%Close()
	Set Sta3n=$Order(Site(0))
	While +Sta3n {
		Set oSite=##class(RDW.VistaSite).%OpenId(Sta3n)
		Set statusFile=##class(%File).%New("/rdwClient/RDW_Site_"_oSite.Sta3n_".txt")
		Do statusFile.Open("NWS")
		If $IsObject(oSite) {
			Do statusFile.WriteLine($ZDateTime($H))
			Do statusFile.WriteLine("SPatient.SPatient2v001")
			Do ##class(SPatient.SPatient2v001).BuildSite(oSite)
			Do statusFile.WriteLine($ZDateTime($H))
			Do statusFile.WriteLine("Dim.VistaFilev001")
			Do ##class(Dim.VistaFilev001).BuildSite(oSite)
			Do statusFile.WriteLine($ZDateTime($H))
			Do statusFile.WriteLine("Dim.VistaFieldv0011")
			Do ##class(Dim.VistaFieldv001).BuildSite(oSite)
			Do statusFile.WriteLine($ZDateTime($H))
			Do statusFile.WriteLine("Dim.LocalDrug50v001")
			Do ##class(Dim.LocalDrug50v001).BuildSite(oSite)
			Do statusFile.WriteLine($ZDateTime($H))
			Do statusFile.WriteLine("Dim.NationalDrugFile506v001")
			Do ##class(Dim.NationalDrugFile506v001).BuildSite(oSite)
			Do statusFile.WriteLine($ZDateTime($H))
			Do statusFile.WriteLine("Allergy.Allergy1208v001")
			Do ##class(Allergy.Allergy1208v001).BuildSite(oSite)
			Do statusFile.WriteLine($ZDateTime($H))
			Do statusFile.WriteLine("RxOut.RxOutpatOriginalFill52v001")
			Do ##class(RxOut.RxOutpatOriginalFill52v001).BuildSite(oSite)
			Do statusFile.WriteLine($ZDateTime($H))
			Do statusFile.WriteLine("RxOut.RxOutpatReFill521v001")
			Do ##class(RxOut.RxOutpatReFill521v001).BuildSite(oSite)
			Do statusFile.WriteLine($ZDateTime($H))
			Do statusFile.WriteLine("RxOut.RxOutpatPartialFill522v001")
			Do ##class(RxOut.RxOutpatPartialFill522v001).BuildSite(oSite)
			Do statusFile.WriteLine($ZDateTime($H))
			Do statusFile.WriteLine("Done.")
		}
		Do statusFile.Close()
		Set Sta3n=$Order(Site(Sta3n))
	}
}

ClassMethod SetupClientJournalDirectory()
{
	Set NS=$NAMESPACE
	Set cName=$Piece($SYSTEM,":",1)
	Set jDirectory="/cachejrn/v"_$Piece($ZCONVERT(cName,"U"),"V",2)_"/jrn/"
	ZN "%SYS"
	Set Status=##Class(Config.Journal).Get(.Properties)
	Set Properties("CurrentDirectory")=jDirectory
	Set Status=##Class(Config.Journal).Modify(.Properties)
	ZN NS
}

ClassMethod LoadGlobals()
{
	Kill Site
	Set tStatement=##class(%SQL.Statement).%New()
	Set cName=$Piece($SYSTEM,":",1)
	Set sql="SELECT  Sta3n "_
		"FROM RDW.VistaSite "_
		"WHERE Server->ServerName ='"_cName_"' "_
		"AND Active=1 AND LoadGlobals=1"
	Set Status=tStatement.%Prepare(sql)
	Set rSet=tStatement.%Execute()
	While rSet.%Next() {
		Set Site(rSet.Sta3n)=""
	}
	Do rSet.%Close()
	Set Sta3n=$Order(Site(0))
	While +Sta3n {
		Set oSite=##class(RDW.VistaSite).%OpenId(Sta3n)
		If $IsObject(oSite) {
			Do ##class(RDW.Utilities).ImportGlobals(oSite.VistaSiteNamespace)
		}
		Set Sta3n=$Order(Site(Sta3n))
	}
}

ClassMethod AddJFileTask() As %String
{
	Set task=##Class(%SYS.Task).%New()
	Set task.Name="AddJournalFiles"
	Set task.Description="Add New Journal Files to list"
	Set task.NameSpace="RDW"  // Namespace the task will run in
	Set task.DailyFrequency=task.DailyFrequencyDisplayToLogical("Several")
	Set task.DailyFrequencyTime=0 //minutes
	Set task.DailyIncrement=10  // (every 1 hour or minutes depending on DailyFrequencyTime)
	Set task.DailyStartTime=0
	Set task.DailyEndTime=0
	Set task.Expires=0
	Set task.TaskClass="%SYS.Task.RunLegacyTask"
	Set task.Settings=$lb("ExecuteCode","Do ##class(RDW.JournalFile).AddNewFiles()")
	Set task.StartDate=+$H
	Set task.RunAsUser="_SYSTEM"
	Quit task.%Save()
}

Storage Default
{
<Data name="InstallerDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ObjectToLoad</Value>
</Value>
</Data>
<DataLocation>^RDW.InstallerD</DataLocation>
<DefaultData>InstallerDefaultData</DefaultData>
<IdLocation>^RDW.InstallerD</IdLocation>
<IndexLocation>^RDW.InstallerI</IndexLocation>
<StreamLocation>^RDW.InstallerS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
