Class RDW.Utilities extends %RegisteredObject {

ClassMethod Initialize() {

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
}