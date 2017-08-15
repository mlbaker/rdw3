Class RDW.DataFilerHistory extends %Persistent {
	
	Property JournalFile As RDW.JournalFile;

	Property VistaSite As RDW.VistaSite;

	Property ClassName As %String;

	Property NumberOfRecordsChecked As %Integer;
	
	Property NumberOfErrors As %Integer;

	Property StartDateTime As %TimeStamp;

	Property EndDateTime As %TimeStamp;


ClassMethod StartDataFiler()  {
	Set tStatement=##class(%SQL.Statement).%New()
	Set insId=##class(RDW.CacheInstance).GetInstanceId()
	Set sql="SELECT ID,JournalFile,ClassName,VistaSite "_
	"FROM RDW.DataFilerQueue WHERE CacheInstance="_insId_" "_
	"ORDER BY JournalFile,ClassName,VistaSite"
	Set Status=tStatement.%Prepare(sql)
	Quit:'+Status
	Set className=""
	Set rSet=tStatement.%Execute()
	While rSet.%Next() {
		Set VistaSite=##class(RDW.VistaSite).%OpenId(rSet.VistaSite)
		If (className'=rSet.ClassName) {
			If className]"" {
				//Switched className file last site entries from previous class and site.
				Do ##class(RDW.DataFiler).FileClass(ListOfIds)
			}
			Set className=rSet.ClassName
			Set site=""
		}
		If (site'=rSet.VistaSite) {
			If site]"" {
				//Swiched site file last site entries from previous class and site.
				Do ##class(RDW.DataFiler).FileClass(ListOfIds)
			}
			Set site=rSet.VistaSite
			Set ListOfIds=##class(%Library.ListOfDataTypes).%New()
		}
		Do ListOfIds.Insert(rSet.ID)
	}
	If className]"" {
		// File Last Set of data for class and site.
		Do ##class(RDW.DataFiler).FileClass(ListOfIds)
	}
	Do tStatement.%Close()
	Do rSet.%Close()
}


Storage Default
{
<Data name="DataFilerHistoryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>JournalFile</Value>
</Value>
<Value name="3">
<Value>VistaSite</Value>
</Value>
<Value name="4">
<Value>ClassName</Value>
</Value>
<Value name="5">
<Value>NumberOfRecordsChecked</Value>
</Value>
<Value name="6">
<Value>NumberOfErrors</Value>
</Value>
<Value name="7">
<Value>StartDateTime</Value>
</Value>
<Value name="8">
<Value>EndDateTime</Value>
</Value>
</Data>
<DataLocation>^RDW.DataFilerHistoryD</DataLocation>
<DefaultData>DataFilerHistoryDefaultData</DefaultData>
<IdLocation>^RDW.DataFilerHistoryD</IdLocation>
<IndexLocation>^RDW.DataFilerHistoryI</IndexLocation>
<StreamLocation>^RDW.DataFilerHistoryS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}