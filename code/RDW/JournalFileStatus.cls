Class RDW.JournalFileStatus Extends %Persistent
{
	Property JournalFileId As %Integer;
	
	Property FileClosed As %Boolean;

	Property EntireFileRead As %Boolean;

	Property CurrentlyReadingFile As %Boolean;

	Index MainIndex on JournalFileId [PrimaryKey, IdKey, Unique];


ClassMethod CreateStatus(journalFileId As %Integer) As %String
{
	Set oRef=..%New()
	Set oRef.JournalFileId=journalFileId
	Set Status=oRef.%Save()
	Quit Status
}

ClassMethod SetFileClosed(journalFileId As %Integer) As %String
{
	Set oRef=..%OpenId(journalFileId,4,.sc)
	Quit:(+sc'=1) sc
	Set oRef.FileClosed=1
	Set Status=oRef.%Save()
	Quit Status
}

ClassMethod SetEntireFileRead(journalFileId As %Integer) As %String
{
	Set oRef=..%OpenId(journalFileId,4,.sc)
	Quit:(+sc'=1) sc
	Set oRef.EntireFileRead=1
	Set Status=oRef.%Save()
	Quit Status
}

ClassMethod SetCurrentlyReadingFile(journalFileId As %Integer) As %String
{
	Set oRef=..%OpenId(journalFileId,4,.sc)
	Quit:(+sc'=1) sc
	Set oRef.CurrentlyReadingFile=1
	Set Status=oRef.%Save()
	Quit Status
}

ClassMethod ClearCurrentlyReadingFile(journalFileId As %Integer) As %String
{
	Set oRef=..%OpenId(journalFileId,4,.sc)
	Quit:(+sc'=1) sc
	Set oRef.CurrentlyReadingFile=""
	Set Status=oRef.%Save()
	Quit Status
}


ClassMethod GetStatusOfLastJournalFile() As %String {
	Set CacheInstanceId=##class(RDW.CacheInstance).GetInstanceId()
	Set FileClosed="1",EntireFileRead="1",JournalFileName="",JournalFileId=""
	&sql(SELECT TOP 1 FileClosed,EntireFileRead,JournalFileName,JournalFileId 
	INTO :FileClosed,:EntireFileRead,:JournalFileName,:JournalFileId 
	FROM RDW.JournalFileStatus jfs
	JOIN RDW.JournalFile jf 
	ON jfs.JournalFileId=jf.ID 
	WHERE jf.CacheInstance=:CacheInstanceId 
	ORDER BY jfs.ID DESC)
	Quit JournalFileName_"^"_FileClosed_"^"_EntireFileRead_"^"_JournalFileId
}

ClassMethod GetStatusOfNextToLastJournalFile(LastJournalFileName As %String) As %String {
	Set CacheInstanceId=##class(RDW.CacheInstance).GetInstanceId()
	Set FileClosed="1",EntireFileRead="1",JournalFileName=""
	&sql(SELECT TOP 1 FileClosed,EntireFileRead,JournalFileName 
	INTO :FileClosed,:EntireFileRead,:JournalFileName 
	FROM RDW.JournalFileStatus jfs
	JOIN RDW.JournalFile jf 
	ON jfs.JournalFileId=jf.ID 
	WHERE jf.CacheInstance=:CacheInstanceId 
	AND jf.JournalFileName<>:LastJournalFileName
	ORDER BY jfs.ID DESC)
	Quit JournalFileName_"^"_FileClosed_"^"_EntireFileRead
}

Storage Default
{
<Data name="JournalFileStatusDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>FileClosed</Value>
</Value>
<Value name="3">
<Value>EntireFileRead</Value>
</Value>
<Value name="4">
<Value>CurrentlyReadingFile</Value>
</Value>
</Data>
<DataLocation>^RDW.JournalFileStatusD</DataLocation>
<DefaultData>JournalFileStatusDefaultData</DefaultData>
<IdLocation>^RDW.JournalFileStatusD</IdLocation>
<IndexLocation>^RDW.JournalFileStatusI</IndexLocation>
<StreamLocation>^RDW.JournalFileStatusS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}