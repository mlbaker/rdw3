Class RDW.JournalFile extends %Persistent {

Property JournalFileName As %String (COLLATION="EXACT");

Property CacheInstance As RDW.CacheInstance;

Property DirectoryName As %String (MAXLEN=200, COLLATION="EXACT");

Property EntireFileRead As %Boolean;

Property CurrentlyReadingFile As %Boolean;

Property FileClosed As %Boolean;

Index JournalFileNameIndex on (CacheInstance,JournalFileName);

ClassMethod Initialize() {
	
}

ClassMethod AddNewFiles() {
	Kill jFile
	Set rSet=##class(%ResultSet).%New("%SYS.Journal.File:ByTimeReverseOrder")
	Set Status=rSet.Execute()
	Set cnt=0
	While rSet.Next() {
		Set jFile=rSet.Data("Name")
		For ndx=2:1 {
			Quit:$Piece(jFile,"/",ndx)=""
		}
		Set jFile(cnt)=$Piece(jFile,"/",ndx-1)
		Set jDir(cnt)=$Piece(jFile,jFile(cnt),1)
		Set cnt=cnt+1
	}
	//Write "CurrentFile: ",jDir(0)_jFile(0),!
	For i=cnt-2:-1:1 {
		Set insId=##class(RDW.CacheInstance).GetInstanceId()
		Set file=jFile(i)
		Set id=""
		&sql(SELECT ID INTO :id FROM RDW.JournalFile WHERE CacheInstance=:insId AND JournalFileName=:file)
		If id="" {
			Set oJFile=..%New()
			Set oJFile.JournalFileName=jFile(i)
			Set oJFile.DirectoryName=jDir(i)
			Set oJFile.CacheInstance=##class(RDW.CacheInstance).%OpenId(insId)
			Set oJFile.FileClosed=1
			Set Status=oJFile.%Save()
			Kill oJFile
		}
	}
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