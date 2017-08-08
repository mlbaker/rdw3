Class RxOut.RxOutpatPartialFill522v001 extends  (%Persistent, %XML.Adaptor) [ SqlTableName = RxOutpatPartialFill_52_2_v001 ]
{

Property BingoWaitTime As %Numeric;

Property CheckingPharmacistStaffIEN As %String;

Property ClerkStaffIEN As %String;

Property DaysSupply As %Integer;

Property DispensedDate As %Date;

Property ExpirationDate As %Date;

Property FillDateTime As %TimeStamp;

Property FillRemarks As %String( MAXLEN = 100) ;

Property FilledByStaffIEN As %String;

Property IssueDate As %Date;

Property LocalDrugIEN As %String;

Property LocalDrug As Dim.LocalDrug50v001;

Property LoginDate As %Date;

Property LotNumber As %String(MAXLEN = 100);

Property MailWindow As %String( MAXLEN = 1) ;

Property Manufacturer As %String;

Property NDC As %String(MAXLEN = 100) ;

Property NationalDrugIEN As %String;

Property NationalDrug As Dim.NationalDrugFile506v001;

Property OpCode As %String( MAXLEN = 1) ;

Property PatientIEN As %String;

Property SPatient As SPatient.SPatient2v001;

Property PharmacistIEN As %String;

Property PharmacySiteIEN As %String;

Property PrescribingDivisionIEN As %String;

Property ProviderIEN As %String;

Property Qty As %String;

Property ReleaseDateTime As %TimeStamp;

Property ReturnedToStockDateTime As %TimeStamp;

Property RxOutpatIEN As %String;

Property RxOutpatPartialFillIEN As %String;

Property RxStatus As %String;

Property VistaSite As RDW.VistaSite;

Property UnitPrice As %Numeric;

Property VistaCreateDate As %TimeStamp;

Property VistaEditDate As %TimeStamp;

Index MainIndex On (VistaSite, RxOutpatIEN, RxOutpatPartialFillIEN) [ IdKey, PrimaryKey, Unique ];


ClassMethod Initialize()
{
}

ClassMethod BuildSite(VistaSite As RDW.VistaSite)
{
	Set RxOutpatIEN=$Order(^|VistaSite.VistaSiteNamespace|PSRX(0))
	While +RxOutpatIEN {
		Set RxOutpatPartialFillIEN=$Order(^|VistaSite.VistaSiteNamespace|PSRX(RxOutpatIEN,"P",0))
		While +RxOutpatPartialFillIEN {
			Set Status=..UpdateObject(VistaSite,RxOutpatIEN_","_RxOutpatPartialFillIEN)
			Write:'+Status $$$ERROR(Status),!
			Set RxOutpatPartialFillIEN=$Order(^|VistaSite.VistaSiteNamespace|PSRX(RxOutpatIEN,"P",RxOutpatPartialFillIEN))
		}
		Set RxOutpatIEN=$Order(^|VistaSite.VistaSiteNamespace|PSRX(RxOutpatIEN))
	}
}


ClassMethod RemoveObject(VistaSite As RDW.VistaSite, FMPK As %String) As %String
{
	Set Status=1
	Set RxOutpatIEN=$Piece(FMPK,",",1)
	Quit:'+RxOutpatIEN "1" // RxOutpatIEN is not a number,  Should never get here as this is checked in JournalReader.
	
	Set RxOutpatPartialFillIEN=$Piece(FMPK,",",2)
	Quit:'+RxOutpatPartialFillIEN "1" // RxOutpatPartialFillIEN is not a number,  Should never get here as this is checked in JournalReader.

	Quit:$Get(^|VistaSite.VistaSiteNamespace|PSRX(RxOutpatIEN,"P",RxOutpatPartialFillIEN,0))'="" "1" // Record at RxOutpatIEN,"P",RxOutpatPartialFillIEN is not deleted.
	
	Set id=VistaSite.Sta3n_"||"_RxOutpatIEN_"||"_RxOutpatPartialFillIEN

	Set oref=..%OpenId(id,4,.Status)
	If '$$$ISOK(Status) {
		If $System.Status.GetErrorCodes(Status)'=5809 {
			// Error is not because the object does not exist.  Probably can't get lock.
			Quit Status
		} Else {
			Quit 1 // Error is because record does not exist so don't have to delete.
		}
	} // Either got lock or object does not exist.
	
	If $IsObject(oref) {
		Set oref.OpCode="D"
		Set oref.VistaEditDate=$ZDateTime($H,3)
		Set Status=oref.%Save()
	}
	Quit Status
}


ClassMethod UpdateObject(VistaSite As RDW.VistaSite, FMPK As %String) As %String
{
	Set Status=1
	Set RxOutpatIEN=$Piece(FMPK,",",1)
	Quit:'+RxOutpatIEN "1" // RxOutpatIEN is not a number,  Should never get here as this is checked in JournalReader.
	
	Set RxOutpatPartialFillIEN=$Piece(FMPK,",",2)
	Quit:'+RxOutpatPartialFillIEN "1" // RxOutpatPartialFillIEN is not a number,  Should never get here as this is checked in JournalReader.

	Set id=VistaSite.Sta3n_"||"_RxOutpatIEN_"||"_RxOutpatPartialFillIEN
	
	Set oref=..%OpenId(id,4,.Status)
	If '$$$ISOK(Status) {
		If $System.Status.GetErrorCodes(Status)'=5809 {
			// Error is not because the object does not exist.  Probably can't get lock.
			Quit Status
		}
	} // Either got lock or object does not exist.
	
	If '$IsObject(oref) {
		Set oref=..%New()
		Set oref.RxOutpatIEN=RxOutpatIEN
		Set oref.RxOutpatPartialFillIEN=RxOutpatPartialFillIEN
		Set oref.VistaSite=VistaSite
		Set oref.VistaCreateDate=$ZDateTime($H,3)
		Set oref.OpCode=""
		Set $Bit(BitFlag,1)=1
	}

	Set $Bit(BitFlag,2)=oref.setIssueDate(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,3)=oref.setPatientIEN(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,4)=oref.setProviderIEN(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,5)=oref.setPrescribingDivisionIEN(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,6)=oref.setNationalDrugIEN(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,70)=oref.setLocalDrugIEN(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,8)=oref.setQty(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,9)=oref.setDaysSupply(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,10)=oref.setMailWindow(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,11)=oref.setFillRemarks(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,12)=oref.setUnitPrice(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,13)=oref.setPharmacySiteIEN(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,14)=oref.setLoginDate(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,15)=oref.setFillDateTime(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,16)=oref.setPharmacistIEN(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,17)=oref.setLotNumber(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,18)=oref.setDispensedDate(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,19)=oref.setNDC(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,20)=oref.setClerkStaffIEN(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,21)=oref.setManufacturer(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,22)=oref.setExpirationDate(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,23)=oref.setReleaseDateTime(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,24)=oref.setReturnedToStockDateTime(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,25)=oref.setBingoWaitTime(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,26)=oref.setFilledByStaffIEN(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,27)=oref.setCheckingPharmacistStaffIEN(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,28)=oref.setRxStatus(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,29)=oref.setSPatient(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,37)=oref.setLocalDrug(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)
	Set $Bit(BitFlag,38)=oref.setNationalDrug(VistaSite.VistaSiteNamespace,RxOutpatIEN,RxOutpatPartialFillIEN)

	If $BitFind(BitFlag,1) {
		// Something changed.
		Set oref.VistaEditDate=$ZDateTime($H,3)
		Set Status=oref.%Save()
	}
	Do oref.%Close()
	Quit Status
}

Method setBingoWaitTime(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set BingoWaitTime=$Piece($Get(^|NS|PSRX(RxOutpatIEN,"P",RxOutpatPartialFillIEN,1)),"^",2)
	//Check size of Numeric
	If ('(##class(%Numeric).IsValid(BingoWaitTime))!(BingoWaitTime>99999)) {
		Set BingoWaitTime=""
	}

	If ..BingoWaitTime'=BingoWaitTime {
		Set ..BingoWaitTime=BingoWaitTime
		Set Flag=1
	}
	Kill BingoWaitTime
	Quit Flag
}

Method setCheckingPharmacistStaffIEN(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set CheckingPharmacistStaffIEN=$Piece($Get(^|NS|PSRX(RxOutpatIEN,"P",RxOutpatPartialFillIEN,1)),"^",4)

	If ..CheckingPharmacistStaffIEN'=CheckingPharmacistStaffIEN {
		Set ..CheckingPharmacistStaffIEN=CheckingPharmacistStaffIEN
		Set Flag=1
	}
	Kill CheckingPharmacistStaffIEN
	Quit Flag
}

Method setClerkStaffIEN(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set ClerkStaffIEN=$Piece($Get(^|NS|PSRX(RxOutpatIEN,"P",RxOutpatPartialFillIEN,0)),"^",7)

	If ..ClerkStaffIEN'=ClerkStaffIEN {
		Set ..ClerkStaffIEN=ClerkStaffIEN
		Set Flag=1
	}
	Kill ClerkStaffIEN
	Quit Flag
}

Method setDaysSupply(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set DaysSupply=$Piece($Get(^|NS|PSRX(RxOutpatIEN,"P",RxOutpatPartialFillIEN,0)),"^",10)
	//Check size of Numeric
	If ('(##class(%Numeric).IsValid(DaysSupply))!(DaysSupply>2147483647)) {
		Set DaysSupply=""
	}
	//Change real number to integer
	If ((DaysSupply#1)>0) {
		Set DaysSupply=DaysSupply\1
	}

	If ..DaysSupply'=DaysSupply {
		Set ..DaysSupply=DaysSupply
		Set Flag=1
	}
	Kill DaysSupply
	Quit Flag
}

Method setDispensedDate(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set DispensedDate=$Piece($Get(^|NS|PSRX(RxOutpatIEN,"P",RxOutpatPartialFillIEN,0)),"^",13)
	Set:+DispensedDate DispensedDate=##class(%FilemanDate).LogicalToDate(DispensedDate)

	If ..DispensedDate'=DispensedDate {
		Set ..DispensedDate=DispensedDate
		Set Flag=1
	}
	Kill DispensedDate
	Quit Flag
}

Method setExpirationDate(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set ExpirationDate=$Piece($Get(^|NS|PSRX(RxOutpatIEN,"P",RxOutpatPartialFillIEN,1)),"^",5)
	Set:+ExpirationDate ExpirationDate=##class(%FilemanDate).LogicalToDate(ExpirationDate)

	If ..ExpirationDate'=ExpirationDate {
		Set ..ExpirationDate=ExpirationDate
		Set Flag=1
	}
	Kill ExpirationDate
	Quit Flag
}

Method setFillDateTime(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set FillDateTime=$Piece($Get(^|NS|PSRX(RxOutpatIEN,"P",RxOutpatPartialFillIEN,0)),"^",1)
	Set:+FillDateTime FillDateTime=##class(%FilemanTimeStamp).LogicalToOdbc(FillDateTime)

	If ..FillDateTime'=FillDateTime {
		Set ..FillDateTime=FillDateTime
		Set Flag=1
	}
	Kill FillDateTime
	Quit Flag
}

Method setFillRemarks(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set FillRemarks=$Piece($Get(^|NS|PSRX(RxOutpatIEN,"P",RxOutpatPartialFillIEN,0)),"^",3)
	If $Length(FillRemarks)>100 {
		Set FillRemarks=$Extract(FillRemarks,1,100)
	}
	If ..FillRemarks'=FillRemarks {
		Set ..FillRemarks=FillRemarks
		Set Flag=1
	}
	Kill FillRemarks
	Quit Flag
}

Method setFilledByStaffIEN(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set FilledByStaffIEN=$Piece($Get(^|NS|PSRX(RxOutpatIEN,"P",RxOutpatPartialFillIEN,1)),"^",3)

	If ..FilledByStaffIEN'=FilledByStaffIEN {
		Set ..FilledByStaffIEN=FilledByStaffIEN
		Set Flag=1
	}
	Kill FilledByStaffIEN
	Quit Flag
}

Method setIssueDate(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set IssueDate=$Piece($Get(^|NS|PSRX(RxOutpatIEN,0)),"^",13)
	Set:+IssueDate IssueDate=##class(%FilemanDate).LogicalToDate(IssueDate) 

	If ..IssueDate'=IssueDate {
		Set ..IssueDate=IssueDate
		Set Flag=1
	}
	Kill IssueDate
	Quit Flag
}

Method setLocalDrugIEN(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set LocalDrugIEN=$Piece($Get(^|NS|PSRX(RxOutpatIEN,0)),"^",6)

	If ..LocalDrugIEN'=LocalDrugIEN {
		Set ..LocalDrugIEN=LocalDrugIEN
		Set Flag=1
	}
	Kill LocalDrugIEN
	Quit Flag
}

Method setLoginDate(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set LoginDate=$Piece($Get(^|NS|PSRX(RxOutpatIEN,"P",RxOutpatPartialFillIEN,0)),"^",8)
	Set:+LoginDate LoginDate=##class(%FilemanDate).LogicalToDate(LoginDate) 
	
	If ..LoginDate'=LoginDate {
		Set ..LoginDate=LoginDate
		Set Flag=1
	}
	Kill LoginDate
	Quit Flag
}

Method setLotNumber(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set LotNumber=$Piece($Get(^|NS|PSRX(RxOutpatIEN,"P",RxOutpatPartialFillIEN,0)),"^",6)
	If $Length(LotNumber)>100 {
		Set LotNumber=$Extract(LotNumber,1,100)
	}
	If ..LotNumber'=LotNumber {
		Set ..LotNumber=LotNumber
		Set Flag=1
	}
	Kill LotNumber
	Quit Flag
}

Method setMailWindow(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set MailWindow=$Piece($Get(^|NS|PSRX(RxOutpatIEN,"P",RxOutpatPartialFillIEN,0)),"^",2)
	If $Length(MailWindow)>1 {
		Set MailWindow=$Extract(MailWindow,1,1)
	}
	If ..MailWindow'=MailWindow {
		Set ..MailWindow=MailWindow
		Set Flag=1
	}
	Kill MailWindow
	Quit Flag
}

Method setManufacturer(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set Manufacturer=$Piece($Get(^|NS|PSRX(RxOutpatIEN,"P",RxOutpatPartialFillIEN,1)),"^",1)
	If $Length(Manufacturer)>50 {
		Set Manufacturer=$Extract(Manufacturer,1,50)
	}
	If ..Manufacturer'=Manufacturer {

		Set ..Manufacturer=Manufacturer
		Set Flag=1
	}
	Kill Manufacturer
	Quit Flag
}

Method setNDC(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set NDC=$Piece($Get(^|NS|PSRX(RxOutpatIEN,"P",RxOutpatPartialFillIEN,0)),"^",12)
	If $Length(NDC)>100 {
		Set NDC=$Extract(NDC,1,100)
	}
	If ..NDC'=NDC {
		Set ..NDC=NDC
		Set Flag=1
	}
	Kill NDC
	Quit Flag
}

Method setNationalDrugIEN(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set NationalDrugIEN=$Piece($Get(^|NS|PSRX(RxOutpatIEN,0)),"^",6)
	If (NationalDrugIEN'="") {
		Set NationalDrugIEN=$Piece($Get(^|NS|PSDRUG(NationalDrugIEN,"ND")),"^",3)
	}

	If ..NationalDrugIEN'=NationalDrugIEN {
		Set ..NationalDrugIEN=NationalDrugIEN
		Set Flag=1
	}
	Kill NationalDrugIEN
	Quit Flag
}

Method setPatientIEN(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set PatientIEN=$Piece($Get(^|NS|PSRX(RxOutpatIEN,0)),"^",2)

	If ..PatientIEN'=PatientIEN {
		Set ..PatientIEN=PatientIEN
		Set Flag=1
	}
	Kill PatientIEN
	Quit Flag
}

Method setPharmacistIEN(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set PharmacistIEN=$Piece($Get(^|NS|PSRX(RxOutpatIEN,"P",RxOutpatPartialFillIEN,0)),"^",5)

	If ..PharmacistIEN'=PharmacistIEN {
		Set ..PharmacistIEN=PharmacistIEN
		Set Flag=1
	}
	Kill PharmacistIEN
	Quit Flag
}

Method setPharmacySiteIEN(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set PharmacySiteIEN=$Piece($Get(^|NS|PSRX(RxOutpatIEN,"P",RxOutpatPartialFillIEN,0)),"^",9)
	If $Length(PharmacySiteIEN)>50 {
		Set PharmacySiteIEN=$Extract(PharmacySiteIEN,1,50)
	}
	If ..PharmacySiteIEN'=PharmacySiteIEN {
		Set ..PharmacySiteIEN=PharmacySiteIEN
		Set Flag=1
	}
	Kill PharmacySiteIEN
	Quit Flag
}

Method setPrescribingDivisionIEN(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set PrescribingDivisionIEN=$Piece($Get(^|NS|PSRX(RxOutpatIEN,0)),"^",5)
	If (PrescribingDivisionIEN'="") {
		Set PrescribingDivisionIEN=$Piece($Get(^|NS|SC(PrescribingDivisionIEN,0)),"^",15)
	}

	If ..PrescribingDivisionIEN'=PrescribingDivisionIEN {
		Set ..PrescribingDivisionIEN=PrescribingDivisionIEN
		Set Flag=1
	}
	Kill PrescribingDivisionIEN
	Quit Flag
}

Method setProviderIEN(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set ProviderIEN=$Piece($Get(^|NS|PSRX(RxOutpatIEN,"P",RxOutpatPartialFillIEN,0)),"^",17)

	If ..ProviderIEN'=ProviderIEN {
		Set ..ProviderIEN=ProviderIEN
		Set Flag=1
	}
	Kill ProviderIEN
	Quit Flag
}

Method setQty(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set Qty=$Piece($Get(^|NS|PSRX(RxOutpatIEN,"P",RxOutpatPartialFillIEN,0)),"^",4)
	If $Length(Qty)>50 {
		Set Qty=$Extract(Qty,1,50)
	}
	If ..Qty'=Qty {
		Set ..Qty=Qty
		Set Flag=1
	}
	Kill Qty
	Quit Flag
}

Method setReleaseDateTime(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set ReleaseDateTime=$Piece($Get(^|NS|PSRX(RxOutpatIEN,"P",RxOutpatPartialFillIEN,0)),"^",19)
	Set:+ReleaseDateTime ReleaseDateTime=##class(%FilemanTimeStamp).LogicalToOdbc(ReleaseDateTime) 

	If ..ReleaseDateTime'=ReleaseDateTime {
		Set ..ReleaseDateTime=ReleaseDateTime
		Set Flag=1
	}
	Kill ReleaseDateTime
	Quit Flag
}

Method setReturnedToStockDateTime(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set ReturnedToStockDateTime=$Piece($Get(^|NS|PSRX(RxOutpatIEN,"P",RxOutpatPartialFillIEN,0)),"^",16)
	Set:+ReturnedToStockDateTime ReturnedToStockDateTime=##class(%FilemanTimeStamp).LogicalToOdbc(ReturnedToStockDateTime) 

	If ..ReturnedToStockDateTime'=ReturnedToStockDateTime {
		Set ..ReturnedToStockDateTime=ReturnedToStockDateTime
		Set Flag=1
	}
	Kill ReturnedToStockDateTime
	Quit Flag
}

Method setRxStatus(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set RxStatus=$Piece($Get(^|NS|PSRX(RxOutpatIEN,"STA")),"^",1)
	If RxStatus]""
	{
		Set Codes=$Piece($Get(^|NS|DD(52,100,0)),"^",3)
		Set zz=1
		While ($Piece(Codes,";",zz)]"")
		{
			Set Code=$Piece($Piece(Codes,";",zz),":",1)
			If (Code=RxStatus)
			{
				Set RxStatus=$Piece($Piece(Codes,";",zz),":",2)
			}
			Set zz=zz+1
		}
		Kill zz,Codes,Code
		}
	If $Length(RxStatus)>50 {
		Set RxStatus=$Extract(RxStatus,1,50)
	}
	If ..RxStatus'=RxStatus {
		Set ..RxStatus=RxStatus
		Set Flag=1
	}
	Kill RxStatus
	Quit Flag
}

Method setUnitPrice(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set UnitPrice=$Piece($Get(^|NS|PSRX(RxOutpatIEN,"P",RxOutpatPartialFillIEN,0)),"^",11)
	//Check size of Numeric
	If ('(##class(%Numeric).IsValid(UnitPrice))!(UnitPrice>214748.3647)) {
		Set UnitPrice=""
	}

	If ..UnitPrice'=UnitPrice {
		Set ..UnitPrice=UnitPrice
		Set Flag=1
	}
	Kill UnitPrice
	Quit Flag
}

Method setSPatient(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Set id=..VistaSite.Sta3n_"||"_..PatientIEN
	Set SPatient=##class(SPatient.SPatient2v001).%OpenId(id)

	If ..SPatient'=SPatient {
		Set ..SPatient=SPatient
		Set Flag=1
	}
	Kill SPatient
	Quit Flag
}

Method setLocalDrug(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Quit:..LocalDrugIEN']"" Flag
	Set id=..VistaSite.Sta3n_"||"_..LocalDrugIEN
	Set LocalDrug=##class(Dim.LocalDrug50v001).%OpenId(id)

	If ..LocalDrug'=LocalDrug {
		Set ..LocalDrug=LocalDrug
		Set Flag=1
	}
	Kill LocalDrug
	Quit Flag
}

Method setNationalDrug(NS As %String, RxOutpatIEN As %String, RxOutpatPartialFillIEN As %String) As %Integer
{
	Set Flag=0
	Quit:..NationalDrugIEN']"" Flag
	Set id=..VistaSite.Sta3n_"||"_..NationalDrugIEN
	Set NationalDrug=##class(Dim.NationalDrugFile506v001).%OpenId(id)

	If ..NationalDrug'=NationalDrug {
		Set ..NationalDrug=NationalDrug
		Set Flag=1
	}
	Kill NationalDrug
	Quit Flag
}

Storage Default
{
<Data name="RxOutpatPartialFill522v001DefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>BingoWaitTime</Value>
</Value>
<Value name="3">
<Value>CheckingPharmacistStaffIEN</Value>
</Value>
<Value name="4">
<Value>ClerkStaffIEN</Value>
</Value>
<Value name="5">
<Value>DaysSupply</Value>
</Value>
<Value name="6">
<Value>DispensedDate</Value>
</Value>
<Value name="7">
<Value>ExpirationDate</Value>
</Value>
<Value name="8">
<Value>FillDateTime</Value>
</Value>
<Value name="9">
<Value>FillRemarks</Value>
</Value>
<Value name="10">
<Value>FilledByStaffIEN</Value>
</Value>
<Value name="11">
<Value>IssueDate</Value>
</Value>
<Value name="12">
<Value>LocalDrugIEN</Value>
</Value>
<Value name="13">
<Value>LoginDate</Value>
</Value>
<Value name="14">
<Value>LotNumber</Value>
</Value>
<Value name="15">
<Value>MailWindow</Value>
</Value>
<Value name="16">
<Value>Manufacturer</Value>
</Value>
<Value name="17">
<Value>NDC</Value>
</Value>
<Value name="18">
<Value>NationalDrugIEN</Value>
</Value>
<Value name="19">
<Value>OpCode</Value>
</Value>
<Value name="20">
<Value>PatientIEN</Value>
</Value>
<Value name="21">
<Value>SPatient</Value>
</Value>
<Value name="22">
<Value>PharmacistIEN</Value>
</Value>
<Value name="23">
<Value>PharmacySiteIEN</Value>
</Value>
<Value name="24">
<Value>PrescribingDivisionIEN</Value>
</Value>
<Value name="25">
<Value>ProviderIEN</Value>
</Value>
<Value name="26">
<Value>Qty</Value>
</Value>
<Value name="27">
<Value>ReleaseDateTime</Value>
</Value>
<Value name="28">
<Value>ReturnedToStockDateTime</Value>
</Value>
<Value name="29">
<Value>RxStatus</Value>
</Value>
<Value name="30">
<Value>UnitPrice</Value>
</Value>
<Value name="31">
<Value>VistaCreateDate</Value>
</Value>
<Value name="32">
<Value>VistaEditDate</Value>
</Value>
<Value name="33">
<Value>LocalDrug</Value>
</Value>
<Value name="34">
<Value>NationalDrug</Value>
</Value>
</Data>
<DataLocation>^RxOut.RxOutpatPar218ED</DataLocation>
<DefaultData>RxOutpatPartialFill522v001DefaultData</DefaultData>
<IdLocation>^RxOut.RxOutpatPar218ED</IdLocation>
<IndexLocation>^RxOut.RxOutpatPar218EI</IndexLocation>
<StreamLocation>^RxOut.RxOutpatPar218ES</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}