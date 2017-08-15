Class RDW.DataFiler extends %RegisteredObject {

ClassMethod FileClass(ListOfIds As %Library.ArrayOfObjects) {
	Set count=0
	Set errors=0
	Set startTime=$ZDateTime($H,3)
	Set id=ListOfIds.GetAt(1)
	Set ^zmlb(id)=startTime
	Set JournalFile=##class(RDW.DataFilerQueue).%OpenId(id).JournalFile
	Set VistaSite=##class(RDW.DataFilerQueue).%OpenId(id).VistaSite
	For i=1:1:ListOfIds.Count() {
		Set id=ListOfIds.GetAt(i)
		Set oDFQ=##class(RDW.DataFilerQueue).%OpenId(id,4,.sc)
		If (sc=1) {
			Set className=oDFQ.ClassName
			Set type=oDFQ.OperationType
			Set primaryKeys=oDFQ.PrimaryKeys
			If type="S" {
				Set Status=$CLASSMETHOD(className,"UpdateObject",VistaSite,primaryKeys)
			} Else {
				Set Status=$CLASSMETHOD(className,"RemoveObject",VistaSite,primaryKeys)
			}
			If (Status=1) {
				Do ##class(RDW.DataFilerQueue).%DeleteId(id,4)
				Set count=count+1
			} Else {
				Set errors=errors+1
			}
		}
	}
	Set DFH=##class(RDW.DataFilerHistory).%New()
	Set DFH.JournalFile=JournalFile
	Set DFH.VistaSite=VistaSite
	Set DFH.ClassName=className
	Set DFH.StartDateTime=startTime
	Set DFH.NumberOfRecordsChecked=count
	Set DFH.NumberOfErrors=errors
	Set DFH.EndDateTime=$ZDateTime($H,3)
	Do DFH.%Save()

}

}