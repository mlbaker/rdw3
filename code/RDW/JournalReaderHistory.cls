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
	Set sql="SELECT ID,FileClosed FROM RDW.JournalFile WHERE CacheInstance="_insId_" "_
	"AND CurrentlyReadingFile IS NULL AND EntireFileRead IS NULL "_
	"ORDER BY FileClosed DESC, ID "
	Set Status=tStatement.%Prepare(sql)
	Quit:'+Status
	Set rSet=tStatement.%Execute()
	
	While rSet.%Next() {
		Quit:##class(RDW.JournalReaderStatus).GetStatus()'="R"
		Set StartOffset=0
		Set jFileId=rSet.ID
		&sql(SELECT TOP 1 EndOffSet INTO :StartOffset FROM RDW.JournalReaderHistory WHERE JournalFile=:jFileId ORDER BY EndTime DESC)		
		Write jFileId," ",StartOffset,!
		Set jFile=##class(RDW.JournalFile).%OpenId(jFileId,4,.sc)
		If $IsObject(jFile) {
			Set jFile.CurrentlyReadingFile=1
			Do jFile.%Save()
			Set oJFH=..%New()
			Set oJFH.JournalFile=jFile
			Set oJFH.StartOffset=StartOffset
			Set oJFH.StartTime=$ZDateTime($H,3)
			Set Status=oJFH.%Save()
			Kill jFile
			If +Status {
				Set jr=##class(RDW.JournalReader).New(oJFH)
				If $IsObject(jr) {
					Do jr.ReadFile()
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
