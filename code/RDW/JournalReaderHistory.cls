Class RDW.JournalReaderHistory Extends %Persistent
{

Property JournalFile As RDW.JournalFile;

Property StartOffset As %Integer;

Property EndOffset As %Integer;

Property StartTime As %TimeStamp;

Property EndTime As %TimeStamp;

Property RecordsFound As %Integer;

ClassMethod Initialize()
{
	Do ..%KillExtent()
}

ClassMethod StartJournalReader()
{
	
	Set tStatement=##class(%SQL.Statement).%New()
	Set insId=##class(RDW.CacheInstance).GetInstanceId()
	Set sql="SELECT ID,FileClosed FROM RDW.JournalFile WHERE CacheInstance="_insId_
	" AND FileClosed=1 AND CurrentlyReadingFile IS NULL AND EntireFileRead IS NULL"
	Set Status=tStatement.%Prepare(sql)
	Quit:'+Status
	Set rSet=tStatement.%Execute()
	While rSet.%Next() {
		Quit:##class(RDW.JournalReaderStatus).GetStatus()'="R"
		Set jFileId=rSet.ID
		Set jFile=##class(RDW.JournalFile).%OpenId(jFileId,4)
		If $IsObject(jFile) {
			Set oJFH=..%New()
			Set oJFH.JournalFile=jFile
			Set oJFH.StartOffset=0
			Set oJFH.StartTime=$ZDateTime($H,3)
			Set jFile.CurrentlyReadingFile=1
			Do jFile.%Save()
			Set Status=oJFH.%Save()
			If +Status {
				Set jr=##class(RDW.JournalReader).New(oJFH)
				If $IsObject(jr) {
					Do ##class(RDW.JournalReader).ReadFile(jr)
				}
			}
		}
	}
	Do tStatement.%Close()
	Do rSet.%Close()
}

Storage Default
{
<Data name="JournalReaderHistoryDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>JournalFile</Value>
</Value>
<Value name="3">
<Value>StartOffset</Value>
</Value>
<Value name="4">
<Value>EndOffset</Value>
</Value>
<Value name="5">
<Value>StartTime</Value>
</Value>
<Value name="6">
<Value>EndTime</Value>
</Value>
<Value name="7">
<Value>RecordsFound</Value>
</Value>
</Data>
<DataLocation>^RDW.JournalReaderHistoryD</DataLocation>
<DefaultData>JournalReaderHistoryDefaultData</DefaultData>
<IdLocation>^RDW.JournalReaderHistoryD</IdLocation>
<IndexLocation>^RDW.JournalReaderHistoryI</IndexLocation>
<StreamLocation>^RDW.JournalReaderHistoryS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
