Class RDW.DataFilerQueue extends %Persistent {
	
	Property ClassName As %String (COLLATION="EXACT");

	Property VistaSite As RDW.VistaSite;

	Property PrimaryKeys AS %String(COLLATION="EXACT");

	Property OperationType As %String(COLLATION="EXACT");

	Property JournalFile As RDW.JournalFile;

	Property CacheInstance As RDW.CacheInstance;

Index MainIndex On (CacheInstance,OperationType,JournalFile,ClassName,VistaSite,PrimaryKeys) [PrimaryKey, IdKey, Unique];

ClassMethod AddEntry(CacheInstance As RDW.CacheInstance,OperationType As %String,JournalFile As RDW.JournalFile,ClassName As %String,VistaSite As RDW.VistaSite,PrimaryKeys As %String) As %String  {
	Quit:$Data(^RDW.DataFilerQueueD(CacheInstance.CacheInstanceID,OperationType,JournalFile.%Id(),ClassName,VistaSite.Sta3n,PrimaryKeys)) "1^Already in Queue"
	Set oDFQ=..%New()
	Set oDFQ.CacheInstance=CacheInstance
	Set oDFQ.OperationType=OperationType
	Set oDFQ.JournalFile=JournalFile
	Set oDFQ.ClassName=ClassName
	Set oDFQ.VistaSite=VistaSite
	Set oDFQ.PrimaryKeys=PrimaryKeys
	Set Status=oDFQ.%Save()
	Quit Status
}
Storage Default
{
<Data name="DataFilerQueueDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^RDW.DataFilerQueueD</DataLocation>
<DefaultData>DataFilerQueueDefaultData</DefaultData>
<IdLocation>^RDW.DataFilerQueueD</IdLocation>
<IndexLocation>^RDW.DataFilerQueueI</IndexLocation>
<StreamLocation>^RDW.DataFilerQueueS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}