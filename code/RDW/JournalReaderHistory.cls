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

ClassMethod GetNumberOfObjects() As %Integer
{
	Set instId=##class(RDW.CacheInstance).GetInstanceId()
	Set count=0
	&sql(SELECT COUNT(*) INTO :count FROM RDW.JournalReaderHistory WHERE JournalFile->CacheInstance=:instId)
	Quit count
}

ClassMethod GetNumberOfRecordsFound() As %Integer
{
	Set instId=##class(RDW.CacheInstance).GetInstanceId()
	Set count=0
	&sql(SELECT Top 1 RecordsFound INTO :count 
	FROM RDW.JournalReaderHistory 
	WHERE JournalFile->CacheInstance=:instId 
	ORDER BY JournalFile DESC, StartTime DESC)
	Quit count
}

ClassMethod StartJournalReader()
{
	
	Set tStatement=##class(%SQL.Statement).%New()
	Set insId=##class(RDW.CacheInstance).GetInstanceId()
	Set sql="SELECT jf.ID,FileClosed FROM RDW.JournalFile jf "_
	"JOIN RDW.JournalFileStatus jfs "_
	"ON jf.ID=jfs.JournalFileId "_
	"WHERE jf.CacheInstance="_insId_" "_
	"AND jfs.CurrentlyReadingFile IS NULL "_
	"AND jfs.EntireFileRead IS NULL "_
	"ORDER BY jfs.FileClosed DESC, jf.ID "
	Set Status=tStatement.%Prepare(sql)
	Quit:'+Status
	Set rSet=tStatement.%Execute()
	
	While rSet.%Next() {
		Quit:##class(RDW.JournalReaderStatus).GetStatus()'="R"
		Set StartOffset=0
		Set jFileId=rSet.ID
		&sql(SELECT TOP 1 EndOffSet INTO :StartOffset FROM RDW.JournalReaderHistory WHERE JournalFile=:jFileId ORDER BY EndTime DESC)		
		Set jFile=##class(RDW.JournalFile).%OpenId(jFileId,4,.sc)
		Set jFileStatus=##class(RDW.JournalFileStatus).%OpenId(jFileId,4)
		If $IsObject(jFile) {
			Set jFileStatus.CurrentlyReadingFile=1
			Do jFileStatus.%Save()
			Do jFileStatus.%Close()
			Kill jFileStatus
			Set oJFH=..%New()
			Set oJFH.JournalFile=jFile
			Set oJFH.StartOffset=StartOffset
			Set oJFH.StartTime=$ZDateTime($H,3)
			Set Status=oJFH.%Save()
			Do jFile.%Close()
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
