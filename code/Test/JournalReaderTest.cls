Class Test.JournalReaderTest extends %UnitTest.TestCase
{

Method TestAddNewFiles()
{
	Set oldCount=##class(RDW.JournalFile).GetJournalFileCount()
	Do ##class(RDW.JournalFile).CloseCurrentFile()
	Do ##class(RDW.JournalFile).AddNewFiles()
	Set newCount=##class(RDW.JournalFile).GetJournalFileCount()
	Do $$$AssertEquals(oldCount+1,newCount, "CloseCurrentFile creates new JournalFile object")
}

Method TestJournalFileStatus()
{
	Set LastJournalFile=##class(RDW.JournalFileStatus).GetStatusOfLastJournalFile()
	Set LastFileClosed=$Piece(LastJournalFile,"^",2),LastEntireFileRead=$Piece(LastJournalFile,"^",3)
	Set LastJournalFileId=$Piece(LastJournalFile,"^",4)
	Set NTLJournalFile=##class(RDW.JournalFileStatus).GetStatusOfNextToLastJournalFile($Piece(LastJournalFile,"^",2))
	Set NTLFileClosed=$Piece(NTLJournalFile,"^",2),NTLEntireFileRead=$Piece(NTLJournalFile,"^",3)
	Do $$$AssertEquals(LastFileClosed,"", "Last JournalFile is open for writes")
	Do $$$AssertEquals(LastEntireFileRead,"", "Last JournalFile has NOT been read completely.")
	Do $$$AssertEquals(NTLFileClosed,1, "Next To Last JournalFile is NOT open for write.")
	Do $$$AssertEquals(##class(RDW.JournalFileStatus).CreateStatus(LastJournalFileId+1),1, "Add New Journal File to Status")
	Do $$$AssertEquals(+##class(RDW.JournalFileStatus).CreateStatus(LastJournalFileId),0, "Cannot add A JournalFile that exists already.")
	Do $$$AssertEquals(##class(RDW.JournalFileStatus).SetFileClosed(LastJournalFileId+1),1, "Update File closed status")
	Do $$$AssertEquals(##class(RDW.JournalFileStatus).SetEntireFileRead(LastJournalFileId+1),1, "Update File read status")
	Do $$$AssertEquals(##class(RDW.JournalFileStatus).SetCurrentlyReadingFile(LastJournalFileId+1),1, " File being read status")
	Do $$$AssertEquals(##class(RDW.JournalFileStatus).ClearCurrentlyReadingFile(LastJournalFileId+1),1, "Clear File being read status")
	Do $$$AssertEquals(+##class(RDW.JournalFileStatus).%DeleteId(LastJournalFileId+1),1, "Delete Test Entry")
}

Method TestJournalReaderStatus()
{
	Do $$$AssertNotEquals(+##class(RDW.JournalReaderStatus).GetStatus(),"", "Get Journal Reader Status")
	Do $$$AssertEquals(##class(RDW.JournalReaderStatus).SetJournalReaderToStop(),"S", "Set Journal Reader Status to STOP")
	Set NumberAfterStop=##class(RDW.JournalReaderHistory).GetNumberOfObjects()
	Do ##class(RDW.JournalReaderHistory).StartJournalReader()
	Set NumberAfterJRStart=##class(RDW.JournalReaderHistory).GetNumberOfObjects()
	Do $$$AssertEquals(NumberAfterStop,NumberAfterJRStart, "JournalReader will not start when Status set to STOP")
	Do $$$AssertEquals(##class(RDW.JournalReaderStatus).SetJournalReaderToRun(),"R", "Set Journal Reader Status to RUN")
	Do ##class(RDW.JournalReaderHistory).StartJournalReader()
	Set NumberAfterJRStart=##class(RDW.JournalReaderHistory).GetNumberOfObjects()
	Do $$$AssertNotEquals(NumberAfterStop,NumberAfterJRStart, "JournalReader will start when Status set to RUN")
}

Method TestJournalReader()
{
	Do ##class(RDW.JournalReaderStatus).SetJournalReaderToRun()
	Do ##class(RDW.Utilities).AddDatav6()
	Do ##class(RDW.JournalFile).CloseCurrentFile()
	Do ##class(RDW.JournalFile).AddNewFiles()
	Do ##class(RDW.JournalReaderHistory).StartJournalReader()
	Set NumberOfRecordsAddedToDFQ=##class(RDW.JournalReaderHistory).GetNumberOfRecordsFound()
	Do $$$AssertEquals(NumberOfRecordsAddedToDFQ,16, "JournalReader Found All valid records")
}
}