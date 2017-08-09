Class RDW.DataFilerHistory extends %Persistent {
	
	Property JournalFile As RDW.JournalFile;

	Property ClassName As %String;

	Property NumberOfRecordsChecked As %Integer;

	Property StartDateTime As %TimeStamp;

	Property EndDateTime As %TimeStamp;

ClassMethod StartDataFiler() {
	Set tStatement=##class(%SQL.Statement).%New()
	Set insId=##class(RDW.CacheInstance).GetInstanceId()
	Set sql="SELECT ID,JournalFile,JournalFileOffset,ClassName,VistaSite,PrimaryKeys,OperationType "_
	"FROM RDW.DataFilerQueue WHERE CacheInstance="_insId_" "_
	"ORDER BY JournalFile,JournalFileOffset"
	Set Status=tStatement.%Prepare(sql)
	Quit:'+Status
	Set rSet=tStatement.%Execute()
	While rSet.%Next() {
		Set VistaSite=##class(RDW.VistaSite).%OpenId(rSet.VistaSite)
		If rSet.OperationType="S" {	
			Set Status=$CLASSMETHOD(rSet.ClassName,"UpdateObject",VistaSite,rSet.PrimaryKeys)
		} Else {
			Set Status=$CLASSMETHOD(rSet.ClassName,"RemoveObject",VistaSite,rSet.PrimaryKeys)
		}
		If $$$ISOK(Status)
		{
			Set Status=##class(RDW.DataFilerQueue).%DeleteId(rSet.ID,4)
			Write $System.Status.GetOneStatusText(Status),!
		} 
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
<Value>ClassName</Value>
</Value>
<Value name="4">
<Value>NumberOfRecordsChecked</Value>
</Value>
<Value name="5">
<Value>StartDateTime</Value>
</Value>
<Value name="6">
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