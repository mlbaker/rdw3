Class RDW.JournalReader Extends %RegisteredObject
{

Property JournalFile As RDW.JournalFile;

Property JournalOffset As %Integer;

Property StartTime As %TimeStamp;

Property EndTime As %TimeStamp;

Property SignaledToStop As %Boolean;

Property JournalReaderHistory As RDW.JournalReaderHistory;

Property EntireFileRead As %Boolean;

Property FileClosed As %Boolean;

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
	Set JR.FileClosed=oJFH.JournalFile.FileClosed
	Quit JR
}

Method ReadFile()
{
	Set fileName=..JournalFile.DirectoryName_..JournalFile.JournalFileName
	Set jFile=##class(%SYS.Journal.File).%OpenId(fileName)
	Set NumRecs=0
	// Is this a valid Journal File?
	If $IsObject(jFile) {
		If (..JournalOffset=0) {
			Set jRec=jFile.FirstRecordGet()
		} Else {
			Set jRec=jFile.GetRecordAt(..JournalOffset)
		}
		// While not EOF and not AskedToStop
		While (+jRec)&('..SignaledToStop) {
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
							If +PKIEN {
								Set ClassName=GTW.ClassName
								Set Status=##class(RDW.DataFilerQueue).AddEntry(..JournalFile.CacheInstance,$Extract(GlobalOp,1,1),..JournalFile,ClassName,VistaSite,PKIEN,jRec.Address)
								If '$$$ISOK(Status) {
									Do ##class(%SYS.System).WriteToConsoleLog(
									"Could NOT add entry to DFQ - ClassName: "_ClassName_" PrimaryKeys: "_PKIEN_" VistaSite: "_VistaSite.Sta3n_
									" JournalFile: "_..JournalFile.%Id()_" Journal File Offset: "_jRec.Address,1,2)
								} Else {
									Set NumRecs=NumRecs+1
								}
							} // Else something in PKIEN was not a positive number, Probably x-ref
						} // Else this is not for this class and GlobalsToWatch entry.
					} Else {
						// DELETE encountered.
						If (GlobalNumSubs=GTW.NumberOfSubscripts)!(GlobalNumSubs=(GTW.NumberOfSubscripts-1)) {
							Set PKIEN=..GetPrimaryKeys(GTW,jRec)
							If +PKIEN {
								Set ClassName=GTW.ClassName
								Set Status=##class(RDW.DataFilerQueue).AddEntry(..JournalFile.CacheInstance,$Extract(GlobalOp,1,1),..JournalFile,ClassName,VistaSite,PKIEN,jRec.Address)
								If '$$$ISOK(Status) {
									Do ##class(%SYS.System).WriteToConsoleLog(
									"Could NOT add entry to DFQ - ClassName: "_ClassName_" PrimaryKeys: "_PKIEN_" VistaSite: "_VistaSite.Sta3n_
									" JournalFile: "_..JournalFile.%Id()_" Journal File Offset: "_jRec.Address,1,2)
								} Else {
									Set NumRecs=NumRecs+1
								}
							} // Else something in PKIEN was not a positive number, Probably x-ref
						} // Else this is not for this class and GlobalsToWatch entry.
					}
					Set GTWId=$Order(^RDW.GlobalsToWatch("GlobalNameIndex",Global,GTWId))
				}
			}
			Set ..JournalOffset=jRec.Address
			Set jRec=jRec.NextGet()
			Set ..SignaledToStop=$Case(##class(RDW.JournalReaderStatus).GetStatus(),"R":0,:1)
		} // While not EOF and not AskedToStop
		If '+jRec {
			//If EOF then we are done with this Journal File for now.  
			If (..JournalOffset=jFile.LastRecord.Address)&(..FileClosed) {
				Set ..EntireFileRead=1
			}		
		} //If EOF then we are done with this Journal File for now.
		
	} // Is this a valid Journal File?
	Set ..EndTime=$ZDateTime($H,3)
	Set oJRH=##class(RDW.JournalReaderHistory).%OpenId(..JournalReaderHistory.%Id(),4,.sc)
	If (sc=1) {
		Set oJRH.EndTime=..EndTime
		Set oJRH.RecordsFound=NumRecs
		Set oJRH.EndOffset=..JournalOffset
		Do oJRH.%Save()
	} Else {
		Do ##class(%SYS.System).WriteToConsoleLog("Could not Open JournalReaderHistory object with id="_..JournalReaderHistory.%Id()_" with exclusive lock",1,2)
	}
	Set oJF=##class(RDW.JournalFile).%OpenId(..JournalFile.%Id(),4,.sc)
	If (sc=1) {
		Set oJF.CurrentlyReadingFile=""
		Set oJF.EntireFileRead=..EntireFileRead
		Do oJF.%Save()
	} Else {
		Do ##class(%SYS.System).WriteToConsoleLog("Could not Open JournalFile object with id="_..JournalFile.%Id()_" with exclusive lock",1,2)
	}
	Quit
}

ClassMethod GetPrimaryKeys(GTW As RDW.GlobalsToWatch, jRec As %SYS.Journal.SetKillRecord) As %String
{
	Set PKIEN=""
	Set PrimaryKeys=GTW.PrimaryKeys
	For i=1:1 { 
		Quit:$Piece(PrimaryKeys,",",i)=""
		If +$QSubscript(jRec.GlobalNode,$Piece(PrimaryKeys,",",i))>0 {
			//Is Subcript is a positive number then it can be an IEN
			Set PKIEN=PKIEN_$QSubscript(jRec.GlobalNode,$Piece(PrimaryKeys,",",i))_","
		} Else {
			//If Subscript is not a positive number then it is not an IEN
			Set PKIEN="0,"
			Quit PKIEN
		}
	}
	Quit PKIEN
}

}
