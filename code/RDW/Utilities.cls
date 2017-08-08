Class RDW.Utilities Extends %RegisteredObject
{

ClassMethod Initialize()
{
}

ClassMethod ExportRoutines(NS As %String)
{
	Set OldNS=$NAMESPACE
	ZN NS
	Set tStatement=##class(%SQL.Statement).%New()
	Set status=tStatement.%PrepareClassQuery("%Library.Routine","RoutineList")
	Set rSet=tStatement.%Execute("*.INT")
	While rSet.%Next() {
		If (rSet.%Get("Name")'["xobw.")&(rSet.%Get("Name")'["HS.")&(rSet.%Get("Name")'["Ens")&(rSet.%Get("Name")'["gov.")  {
			Set:$Length(rSet.%Get("Name"))<16 routine(rSet.%Get("Name"))=""
		}
	}
	Do $system.OBJ.Export(.routine,"/scripts/"_NS_"-Routines.xml")
	ZN OldNS
}

ClassMethod ExportMgrRoutines(NS As %String)
{
	Set OldNS=$NAMESPACE
	ZN NS
	Set tStatement=##class(%SQL.Statement).%New()
	Set status=tStatement.%PrepareClassQuery("%Library.Routine","RoutineList")
	Set rSet=tStatement.%Execute("%DT*.INT,%RCR.INT,%XU*.INT,%ZIS*.INT,%ZO*.INT,%ZT*.INT")
	While rSet.%Next() {
		Set routine(rSet.%Get("Name"))=""
	}
	Do $system.OBJ.Export(.routine,"/scripts/MGR-Routines.xml")
	ZN OldNS
}

ClassMethod ImportGlobals(NS As %String)
{
	Set OldNS=$NAMESPACE
	ZN NS
	Set Dir="/rdwClient/globals/"
	For G=65:1:90 {
		Set fName=Dir_$C(G)_"Globals.gof"
		Do:##class(%File).Exists(fName) ##class(%Global).Import(NS,"*",fName,7,1)
	}
	Set fName=Dir_"%ZGlobals.gof"
	Do:##class(%File).Exists(fName) ##class(%Global).Import(NS,"*",fName,7,1)
	ZN OldNS
}

ClassMethod ImportRoutines(NS As %String)
{
	Set OldNS=$NAMESPACE
	ZN NS
	Set Dir="/rdwClient/routines/"
	Set fName=Dir_"vehu-Routines.xml"
	Do $system.OBJ.Load(fName,"ck")
	Set fName=Dir_"mgr-Routines.xml"
	Do $system.OBJ.Load(fName,"ck")
	ZN OldNS
}

ClassMethod PatientToXML(ptId As %String)
{
	Set pt=##class(PAMPI.PatientInfo).%OpenId(ptId)
	Set Writer=##class(%XML.Writer).%New()
	Set filename="/rdwClient/PatientInfo_"_ptId_".xml"
	Do Writer.OutputToFile(filename)
	Set Writer.Indent=2
	Do Writer.RootObject(pt)
}

ClassMethod UpdatePatient(NS As %String="bay")  [ PublicList= DUZ ]
{
	//First import Routines
	Set oldNS=$NAMESPACE
	Write "Do you need to import Routines? "
	Read Ans
	Do:$ZCONVERT(Ans,"U")["Y" ##class(RDW.Utilities).ImportRoutines(NS)
	//Close Journal File...
	Do ##class(RDW.JournalFile).CloseCurrentFile()
	ZN NS
	Set DUZ=1
	D P^DI
	ZN oldNS
	Do ##class(RDW.JournalFile).CloseCurrentFile()
}

ClassMethod CreateManifestForInstance(Server As %Integer)
{
	Set sql="SELECT s.VistaSiteNamespace,d.CacheDatabaseName,d.CacheDatabaseDirectory "_
	"FROM RDW.VistaSite s "_
	"JOIN RDW.VistaSiteDatabase d "_
	"ON s.Sta3n=d.VistaSite "_
	"WHERE s.Server="_Server_" "_
	"ORDER BY s.VistaSiteNamespace,d.CacheDatabaseName"
	Set tStatement=##class(%SQL.Statement).%New()
	Set Status=tStatement.%Prepare(sql)
	Set rSet=tStatement.%Execute()
	Set NS=""
	Write !,"XData SimpleManifest [ XMLNamespace = INSTALLER ]",!,"{",!,"<Manifest>",!!
	While rSet.%Next() {
		If (NS'=rSet.VistaSiteNamespace) {
			If NS'="" {
				Set gmap="SELECT GlobalName,DatabaseName FROM RDW.GlobalMapping WHERE VistaSite->VistaSiteNamespace='"_NS_"'"
				Set tState=##class(%SQL.Statement).%New()
				Set Status=tState.%Prepare(gmap)
				Set gmSet=tState.%Execute()
				While gmSet.%Next() {
					Write "      <GlobalMapping Global="""_gmSet.GlobalName_""" From="""_gmSet.DatabaseName_""" />",!
				}
				Write "    </Configuration>",!,"  </Namespace>",!!
			}
			Set NS=rSet.VistaSiteNamespace
			Write "  <Namespace Name="""_NS_""" Create=""yes"" Code="""_NS_"-rou"" Data="""_NS_"-rou"">",!
			Write "    <Configuration>",!
		}
		Write "      <Database Name="""_rSet.CacheDatabaseName_""" Create=""yes"" Dir="""_rSet.CacheDatabaseDirectory_"""/>",!
	}
	Set gmap="SELECT GlobalName,DatabaseName FROM RDW.GlobalMapping WHERE VistaSite->VistaSiteNamespace='"_NS_"'"
	Set tState=##class(%SQL.Statement).%New()
	Set Status=tState.%Prepare(gmap)
	Set gmSet=tState.%Execute()
	While gmSet.%Next() {
		Write "      <GlobalMapping Global="""_gmSet.GlobalName_""" From="""_gmSet.DatabaseName_""" />",!
	}
	Write "    </Configuration>",!,"  </Namespace>",!!,"</Manifest>",!,"}"	
}


}
