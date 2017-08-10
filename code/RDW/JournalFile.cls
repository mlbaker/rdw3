Class RDW.JournalFile Extends %Persistent
{

Property JournalFileName As %String(COLLATION = "EXACT");

Property CacheInstance As RDW.CacheInstance;

Property DirectoryName As %String(COLLATION = "EXACT", MAXLEN = 200);

Property EntireFileRead As %Boolean;

Property CurrentlyReadingFile As %Boolean;

Property FileClosed As %Boolean;

Index JournalFileNameIndex On (CacheInstance, JournalFileName);

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
		&sql(SELECT ID INTO :id FROM RDW.JournalFile WHERE CacheInstance=:insId AND JournalFileName=:file)
		// If it is the first time we have seen this file.
		If id="" {
			Set oJFile=..%New()
			Set oJFile.JournalFileName=jFile(i)
			Set oJFile.DirectoryName=jDir(i)
			Set oJFile.CacheInstance=##class(RDW.CacheInstance).%OpenId(insId)
			Set:(i>1) oJFile.FileClosed=1
			Set Status=oJFile.%Save()
			Kill oJFile
		} Else {  // If it is NOT the first time we have seen this file.
			Set oFile=..%OpenId(id,4,.sc)
			Write id,"  ",sc,!
			// Able to open object for write with lock?
			If (sc=1) {
				// If it is not the current/last file.
				If (i>1) {
					// If the FileClosed flag is not yet set
					If ('oFile.FileClosed) {
						//Set it and save object
						Set oFile.FileClosed=1
						Set Status=oFile.%Save()
					} //If the FileClosed flag is not yet set
				} // If it is not the current/last file.
			} // Able to open object for write with lock?
		} // If it is the first time we have seen this file.
	} // For each file starting with oldest to newest...
}

ClassMethod CloseCurrentFile() {
	Set Status=##class(%SYS.Journal.System).SwitchFile()
}


Query LongRunningJournalReaders(Threshold As %Integer) As %SQLQuery  [SqlProc, SqlName=LongRunningJournalReaders]
{
SELECT jf.ID,jf.JournalFileName,jf.CacheInstance,jrh.StartTime, DATEDIFF(MINUTE,jrh.StartTime,GETDATE()) As ElapsedMinutes
 FROM RDW.JournalFile jf
 JOIN RDW.JournalReaderHistory jrh
 ON jf.ID=jrh.JournalFile
 WHERE jf.CurrentlyReadingFile=1 
 AND DATEDIFF(MINUTE,jrh.StartTime,GETDATE())>=:Threshold
 ORDER BY jf.CacheInstance,jrh.StartTime
} 


Storage Default
{
<Data name="JournalFileDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>JournalFileName</Value>
</Value>
<Value name="3">
<Value>DockerContainer</Value>
</Value>
<Value name="4">
<Value>DirectoryName</Value>
</Value>
<Value name="5">
<Value>EntireFileRead</Value>
</Value>
<Value name="6">
<Value>CurrentlyReadingFile</Value>
</Value>
<Value name="7">
<Value>FileClosed</Value>
</Value>
<Value name="8">
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
