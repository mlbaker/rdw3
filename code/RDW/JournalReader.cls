Class RDW.JournalReader Extends %RegisteredObject
{

Property JournalFile As RDW.JournalFile;

Property JournalOffset As %Integer;

Property StartTime As %TimeStamp;

Property EndTime As %TimeStamp;

Property SignaledToStop As %Boolean;

Property JournalReaderHistory As RDW.JournalReaderHistory;

ClassMethod Initialize()
{
}

ClassMethod New(oJFH As RDW.JournalReaderHistory) As RDW.JournalReader
{
	Set JR=..%New()
	Set JR.JournalFile=oJFH.JournalFile
	Set JR.JournalOffset=oJFH.StartOffset
	Set JR.StartTime=oJFH.StartTime
	Set JR.SignaledToStop=$Case(##class(RDW.JournalReaderStatus).GetStatus(),"R":0,:1)
	Set JR.JournalReaderHistory=oJFH
	Quit JR
}

ClassMethod ReadFile(jR As RDW.JournalReader)
{
	Set fileName=jR.JournalFile.DirectoryName_jR.JournalFile.JournalFileName
	Write fileName,!
	Set jFile=##class(%SYS.Journal.File).%OpenId(fileName)
	Write jFile,!
	Set NumRecs=0
	If $IsObject(jFile) {
		Set jRec=jFile.FirstRecordGet()
		If +jRec {
			// Are we at EOF?
			Set NextRec=jRec.NextGet()
			// While not EOF or AskedToStop
			While (+NextRec)&('jR.SignaledToStop) {
				// Get the type of operation.
				Set GlobalOp=jRec.TypeName
				// Only interested in KILLS or SETS to Globals.
				If "SET,KILL"[GlobalOp {
					// Get the global
					Set Global=$QSubscript(jRec.GlobalNode,0)
					//Write Global,!
					// Is this a global we watch?
					Set GTWId=$Order(^RDW.GlobalsToWatchI("GlobalNameIndex",Global,0))
					If +GTWId {
						// For each object in GlobalsToWatch for this global get the GlobalsToWatch object.
						Set GTW=##class(RDW.GlobalsToWatch).%OpenId(GTWId)
						// How many subscripts in the global SET OR KILL?
						Set GlobalNumSubs=$QLength(jRec.GlobalNode)
						// Get the VistaSite for this Record.
						Set Sta3a=$Piece(jRec.DatabaseName,"/",4)
						Set Sta3n=##class(RDW.VistaSite).GetSta3nFromSta3a(Sta3a)
						Set VistaSite=##class(RDW.VistaSite).%OpenId(Sta3n)
						// UPDATE Encountered?
						If GlobalOp="SET" {
							//Does it have the right number of subscripts?
							If GlobalNumSubs=GTW.NumberOfSubscripts {
								//Get The PrimaryKeys from the Global Subscripts...
								Set PKIEN=..GetPrimaryKeys(GTW,jRec)
								Set ClassName=GTW.ClassName
								Set Status=##class(RDW.DataFilerQueue).AddEntry(jR.JournalFile.CacheInstance,$Extract(GlobalOp,1,1),jR.JournalFile,ClassName,VistaSite,PKIEN)
							}
						} Else {
							// DELETE encountered.
							If (GlobalNumSubs=GTW.NumberOfSubscripts)!(GlobalNumSub=GTW.NumberOfSubscripts-1) {
								Set PKIEN=..GetPrimaryKeys(GTW,jRec)
								Set ClassName=GTW.ClassName
								Set Status=##class(RDW.DataFilerQueue).AddEntry(jR.JournalFile.CacheInstance,$Extract(GlobalOp,1,1),jR.JournalFile,ClassName,VistaSite,PKIEN)
							}
						}
						Set GTWId=$Order(^RDW.GlobalsToWatch("GlobalNameIndex",Global,GTWId))
					}
				}
				Set jRec=NextRec
				Set NextRec=jRec.NextGet()
				Set jR.JournalOffset=jRec.Address
				//Write jR.JournalOffset,!
				Set jR.SignaledToStop=$Case(##class(RDW.JournalReaderStatus).GetStatus(),"R":0,:1)
			}
			If '+NextRec {
				Set jR.EndTime=$ZDateTime($H,3)
				Set jR.JournalReaderHistory.EndTime=jR.EndTime
				Set jR.JournalReaderHistory.RecordsFound=NumRecs
				Set jR.JournalReaderHistory.EndOffset=jRec.Address
				Do jR.JournalReaderHistory.%Save()
				Set jR.JournalFile.EntireFileRead=1
				Set jR.JournalFile.CurrentlyReadingFile=""
				Do jR.JournalFile.%Save()
			}
		}
		
	}
}

ClassMethod GetPrimaryKeys(GTW As RDW.GlobalsToWatch, jRec As %SYS.Journal.SetKillRecord) As %String
{
	Set PKIEN=""
	Set PrimaryKeys=GTW.PrimaryKeys
	For i=1:1 { 
		Quit:$Piece(PrimaryKeys,",",i)=""
		Set PKIEN=PKIEN_$QSubscript(jRec.GlobalNode,$Piece(PrimaryKeys,",",i))_","
	}
	Quit PKIEN
}

}
