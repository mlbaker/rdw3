Class RDW.JournalFile Extends %Persistent
{

Property JournalFileName As %String(COLLATION = "EXACT");

Property CacheInstance As RDW.CacheInstance;

Property DirectoryName As %String(COLLATION = "EXACT", MAXLEN = 200);

Index MainIndex On (CacheInstance, JournalFileName);

ClassMethod Initialize()
{
	Do ..%KillExtent()
}

ClassMethod AddNewFiles()
{
	Kill jFile
	Set rSet=##class(%ResultSet).%New("%SYS.Journal.File:ByTimeReverseOrder")
	Set insId=##class(RDW.CacheInstance).GetInstanceId()
	Set Status=rSet.Execute()
	Set NumFiles=0
	// Loop through all files seperating file name from directory
	While rSet.Next() {
		Set NumFiles=NumFiles+1
		Set jFile=rSet.Data("Name")
		Set jFile(NumFiles)=##class(%File).GetFilename(jFile)
		Set jDir(NumFiles)=##class(%File).GetDirectory(jFile,1)	
	}
	// For each file starting with oldest to newest...
	For i=NumFiles:-1:1 {
		Set file=jFile(i)
		Set id=""
		// find out if it is already stored in JournalFiles
		&sql(SELECT f.ID INTO :id FROM RDW.JournalFile f WHERE CacheInstance=:insId AND JournalFileName=:file )
		// If it is the first time we have seen this file.
		If id="" {
			Set oJFile=..%New()
			Set oJFile.JournalFileName=jFile(i)
			Set oJFile.DirectoryName=jDir(i)
			Set oJFile.CacheInstance=##class(RDW.CacheInstance).%OpenId(insId)
			Set Status=oJFile.%Save()
			Set journalFileId=oJFile.%Id()
			Do ##class(RDW.JournalFileStatus).CreateStatus(journalFileId)
			If (i>1) Do ##class(RDW.JournalFileStatus).SetFileClosed(journalFileId)
			Kill oJFile
		} Else {  // If it is NOT the first time we have seen this file.
			If (i>1) { //File is not the newest file
				Do ##class(RDW.JournalFileStatus).SetFileClosed(id)
			}  //If File is not the newest file
		} // If it is the first time we have seen this file.
	} // For each file starting with oldest to newest...
}

ClassMethod CloseCurrentFile()
{
	Set Status=##class(%SYS.Journal.System).SwitchFile()
}

Query LongRunningJournalReaders(Threshold As %Integer) As %SQLQuery [ SqlName = LongRunningJournalReaders, SqlProc ]
{

SELECT jf.ID,jf.JournalFileName,jf.CacheInstance,jrh.StartTime, DATEDIFF(MINUTE,jrh.StartTime,GETDATE()) As ElapsedMinutes
 FROM RDW.JournalFile jf
 JOIN RDW.JournalReaderHistory jrh
 ON jf.ID=jrh.JournalFile
 JOIN RDW.JournalFileStatus jfs
 ON jf.ID=jfs.JournalFileId
 WHERE jfs.CurrentlyReadingFile=1 
 AND DATEDIFF(MINUTE,jrh.StartTime,GETDATE())>=:Threshold
 ORDER BY jf.CacheInstance,jrh.StartTime
}

ClassMethod GetJournalFileCount() As %Integer {
	Set CacheInstanceId=##class(RDW.CacheInstance).GetInstanceId()
	Set Count=0
	&sql(SELECT COUNT(*) INTO :Count FROM RDW.JournalFile WHERE CacheInstance=:CacheInstanceId)
	Quit Count
}

Storage Default
{
<Data name="JournalFileDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DirectoryName</Value>
</Value>
<Value name="3">
<Value>JournalFileName</Value>
</Value>
<Value name="4">
<Value>CacheInstance</Value>
</Value>
</Data>
<DataLocation>^RDW.JournalFileD</DataLocation>
<DefaultData>JournalFileDefaultData</DefaultData>
<IdLocation>^RDW.JournalFileD</IdLocation>
<IndexLocation>^RDW.JournalFileI</IndexLocation>
<StreamLocation>^RDW.JournalFileS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
