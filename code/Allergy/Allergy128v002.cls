Class Allergy.Allergy128v002 extends (%Persistent, %XML.Adaptor) {
Property AllergicReactant As %String( MAXLEN = 8000) [ SqlFieldName = AllergicReactant ];

Property AllergyIEN As %String;

Property AllergyType As %String;

Property DrugClassIEN As %String;

Property DrugIngredientIEN As %String;

Property DrugNameWithoutDoseIEN As %String;

Property EnteredInErrorDateTime As %TimeStamp;

Property EnteredInErrorFlag As %String( MAXLEN = 1);

Property EnteringInErrorStaffIEN As %String;

Property LocalDrugIEN As %String;

Property Mechanism As %String;

Property ObservedHistorical As %String;

Property OpCode As %String ;

Property OriginatingStaffIEN As %String;

Property OriginationDateTime As %TimeStamp;

Property OriginatorSignOffFlag As %String;

Property PatientIEN As %String;

Property ReactantIEN As %String;

Property ReportableFlag As %String;

Property VistaSite As RDW.VistaSite;

Property VerificationDateTime As %TimeStamp;

Property VerifiedFlag As %String( MAXLEN = 1) ;

Property VerifyingStaffIEN As %String;

Property VistaCreateDate As %TimeStamp;

Property VistaEditDate As %TimeStamp;

Index MainIndex On (VistaSite, AllergyIEN) [ IdKey, PrimaryKey ];

ClassMethod Initialize()
{
}

ClassMethod BuildSite(VistaSite As RDW.VistaSite)
{
	Set AllergyIEN=$Order(^|VistaSite.VistaSiteNamespace|GMR(120.8,0))
	While +AllergyIEN {
		Set Status=..UpdateObject(VistaSite,AllergyIEN)
		Write:'+Status $$$ERROR(Status),!
		Set AllergyIEN=$Order(^|VistaSite.VistaSiteNamespace|GMR(120.8,AllergyIEN))
	}
}

ClassMethod RemoveObject(VistaSite As RDW.VistaSite, FMPK As %String) As %String
{
	Set Status=1
	Set AllergyIEN=$Piece(FMPK,",",1)
	Quit:'+AllergyIEN "1^ AllergyIEN: "_AllergyIEN_" is NOT a number."
	
	Quit:$Get(^|VistaSite.VistaSiteNamespace|GMR(120.8,AllergyIEN,0))'="" "1^ "_AllergyIEN_" is not deleted." 
	Set id=VistaSite.Sta3n_"||"_AllergyIEN

	Set oref=..%OpenId(id,4)
	
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
	Set AllergyIEN=$Piece(FMPK,",",1)
	Quit:'+AllergyIEN "1^ AllergyIEN: "_AllergyIEN_" is NOT a number."
	
	Set id=VistaSite.Sta3n_"||"_AllergyIEN
	Set oref=..%OpenId(id,4)
	
	If '$IsObject(oref) {
		Set oref=..%New()
		Set oref.AllergyIEN=AllergyIEN
		Set oref.VistaSite=VistaSite
		Set oref.VistaCreateDate=$ZDateTime($H,3)
		Set oref.OpCode=""
		Set $Bit(BitFlag,1)=1
	}
	
	Set $Bit(BitFlag,2)=oref.setPatientIEN(VistaSite.VistaSiteNamespace,AllergyIEN)
	Set $Bit(BitFlag,3)=oref.setAllergicReactant(VistaSite.VistaSiteNamespace,AllergyIEN)
	Set $Bit(BitFlag,4)=oref.setDrugNameWithoutDoseIEN(VistaSite.VistaSiteNamespace,AllergyIEN)
	Set $Bit(BitFlag,5)=oref.setDrugIngredientIEN(VistaSite.VistaSiteNamespace,AllergyIEN)
	Set $Bit(BitFlag,6)=oref.setLocalDrugIEN(VistaSite.VistaSiteNamespace,AllergyIEN)
	Set $Bit(BitFlag,7)=oref.setDrugClassIEN(VistaSite.VistaSiteNamespace,AllergyIEN)
	Set $Bit(BitFlag,8)=oref.setReactantIEN(VistaSite.VistaSiteNamespace,AllergyIEN)
	Set $Bit(BitFlag,9)=oref.setAllergyType(VistaSite.VistaSiteNamespace,AllergyIEN)
	Set $Bit(BitFlag,10)=oref.setOriginationDateTime(VistaSite.VistaSiteNamespace,AllergyIEN)
	Set $Bit(BitFlag,11)=oref.setOriginatingStaffIEN(VistaSite.VistaSiteNamespace,AllergyIEN)
	Set $Bit(BitFlag,12)=oref.setObservedHistorical(VistaSite.VistaSiteNamespace,AllergyIEN)
	Set $Bit(BitFlag,13)=oref.setReportableFlag(VistaSite.VistaSiteNamespace,AllergyIEN)
	Set $Bit(BitFlag,14)=oref.setOriginatorSignOffFlag(VistaSite.VistaSiteNamespace,AllergyIEN)
	Set $Bit(BitFlag,15)=oref.setMechanism(VistaSite.VistaSiteNamespace,AllergyIEN)
	Set $Bit(BitFlag,16)=oref.setVerifiedFlag(VistaSite.VistaSiteNamespace,AllergyIEN)
	Set $Bit(BitFlag,17)=oref.setVerificationDateTime(VistaSite.VistaSiteNamespace,AllergyIEN)
	Set $Bit(BitFlag,18)=oref.setVerifyingStaffIEN(VistaSite.VistaSiteNamespace,AllergyIEN)
	Set $Bit(BitFlag,19)=oref.setEnteredInErrorFlag(VistaSite.VistaSiteNamespace,AllergyIEN)
	Set $Bit(BitFlag,20)=oref.setEnteredInErrorDateTime(VistaSite.VistaSiteNamespace,AllergyIEN)
	Set $Bit(BitFlag,21)=oref.setEnteringInErrorStaffIEN(VistaSite.VistaSiteNamespace,AllergyIEN)
	
	If $BitFind(BitFlag,1) {
		// Something changed.
		Set oref.VistaEditDate=$ZDateTime($H,3)
		Set Status=oref.%Save()
	}
	Do oref.%Close()
	Quit Status
}

Method setAllergicReactant(NS As %String, AllergyIEN As %String) As %Integer
{
	Set Flag=0
	Set AllergicReactant=$Piece($Get(^|NS|GMR(120.8,AllergyIEN,0)),"^",2)
	If $Length(AllergicReactant)>8000 {
		Set AllergicReactant=$Extract(AllergicReactant,1,8000)
	}
	If ..AllergicReactant'=AllergicReactant {
		Set ..AllergicReactant=AllergicReactant
		Set Flag=1
	}
	Kill AllergicReactant
	Quit Flag
}


Method setAllergyType(NS As %String, AllergyIEN As %String) As %Integer
{
	Set Flag=0
	Set AllergyType=$Piece($Get(^|NS|GMR(120.8,AllergyIEN,0)),"^",20)
	If $Length(AllergyType)>50 {
		Set AllergyType=$Extract(AllergyType,1,50)
	}
	If ..AllergyType'=AllergyType {
		Set ..AllergyType=AllergyType
		Set Flag=1
	}
	Kill AllergyType
	Quit Flag
}

Method setDrugClassIEN(NS As %String, AllergyIEN As %String) As %Integer
{
	Set Flag=0
	
	// This is field #1, GMR ALLERGY - a variable-pointer:
	//  POINTS TO:        120.82GMR ALLERGY - ^GMRD(120.82,
	//                    50.6 NATIONAL DRUG - ^PSNDF(50.6,
	//                   50   LOCAL DRUG - ^PSDRUG( 
	//                    50.416DRUG INGREDIENTS - ^PS(50.416,
	//                    50.605VA DRUG CLASS - ^PS(50.605,
	Set DrugClassIEN=$Piece($Get(^|NS|GMR(120.8,AllergyIEN,0)),"^",3)
	If DrugClassIEN]""
	{
		Set ien=$Piece(DrugClassIEN,";")
		Set Gbl=$Piece(DrugClassIEN,";",2)
		//If ((Gbl["(")&(+ien)) {
		If Gbl["PS(50.605," {
			Set DrugClassIEN=ien
		} Else {
			Set DrugClassIEN=""
		}
		Kill Gbl,ien
	}

	If ..DrugClassIEN'=DrugClassIEN {
		Set ..DrugClassIEN=DrugClassIEN
		Set Flag=1
	}
	Kill DrugClassIEN
	Quit Flag
}

Method setDrugIngredientIEN(NS As %String, AllergyIEN As %String) As %Integer
{
	Set Flag=0
	// This is field #1, GMR ALLERGY - a variable-pointer:
	//  POINTS TO:        120.82GMR ALLERGY - ^GMRD(120.82,
	//                    50.6 NATIONAL DRUG - ^PSNDF(50.6,
	//                   50   LOCAL DRUG - ^PSDRUG( 
	//                    50.416DRUG INGREDIENTS - ^PS(50.416,
	//                    50.605VA DRUG CLASS - ^PS(50.605,
	Set DrugIngredientIEN=$Piece($Get(^|NS|GMR(120.8,AllergyIEN,0)),"^",3)
	If DrugIngredientIEN]""
	{
		Set ien=$Piece(DrugIngredientIEN,";")
		Set Gbl=$Piece(DrugIngredientIEN,";",2)
		//If ((Gbl["(")&(+ien)) {
		If Gbl["PS(50.416," {
			Set DrugIngredientIEN=ien
		} Else {
			Set DrugIngredientIEN=""
		}
		Kill Gbl,ien
	}

	If ..DrugIngredientIEN'=DrugIngredientIEN {
		Set ..DrugIngredientIEN=DrugIngredientIEN
		Set Flag=1
	}
	Kill DrugIngredientIEN
	Quit Flag
}

Method setDrugNameWithoutDoseIEN(NS As %String, AllergyIEN As %String) As %Integer
{
	Set Flag=0
	// This is field #1, GMR ALLERGY - a variable-pointer:
	//  POINTS TO:        120.82GMR ALLERGY - ^GMRD(120.82,
	//                    50.6 NATIONAL DRUG - ^PSNDF(50.6,
	//                   50   LOCAL DRUG - ^PSDRUG( 
	//                    50.416DRUG INGREDIENTS - ^PS(50.416,
	//                    50.605VA DRUG CLASS - ^PS(50.605,
	Set DrugNameWithoutDoseIEN=$Piece($Get(^|NS|GMR(120.8,AllergyIEN,0)),"^",3)
	If DrugNameWithoutDoseIEN]""
	{
		Set ien=$Piece(DrugNameWithoutDoseIEN,";")
		Set Gbl=$Piece(DrugNameWithoutDoseIEN,";",2)
		//If ((Gbl["(")&(+ien)) {
		If Gbl["PSNDF(50.6," {
			Set DrugNameWithoutDoseIEN=ien
		} else {
			Set DrugNameWithoutDoseIEN=""
		}
		Kill Gbl,ien
	}

	If ..DrugNameWithoutDoseIEN'=DrugNameWithoutDoseIEN {
		Set ..DrugNameWithoutDoseIEN=DrugNameWithoutDoseIEN
		Set Flag=1
	}
	Kill DrugNameWithoutDoseIEN
	Quit Flag
}

Method setEnteredInErrorDateTime(NS As %String, AllergyIEN As %String) As %Integer
{
	Set Flag=0
	Set EnteredInErrorDateTime=$Piece($Get(^|NS|GMR(120.8,AllergyIEN,"ER")),"^",2)
	Set:+EnteredInErrorDateTime EnteredInErrorDateTime=##class(%FilemanDate).LogicalToOdbc(EnteredInErrorDateTime)

	If ..EnteredInErrorDateTime'=EnteredInErrorDateTime {
		Set ..EnteredInErrorDateTime=EnteredInErrorDateTime
		Set Flag=1
	}
	Kill EnteredInErrorDateTime
	Quit Flag
}


Method setEnteredInErrorFlag(NS As %String, AllergyIEN As %String) As %Integer
{
	Set Flag=0
	Set EnteredInErrorFlag=$Piece($Get(^|NS|GMR(120.8,AllergyIEN,"ER")),"^",1)
	//Flag type of property.
	If $Length(EnteredInErrorFlag)>1 {
		Set EnteredInErrorFlag=$Extract(EnteredInErrorFlag,1,1)
	}
	If ..EnteredInErrorFlag'=EnteredInErrorFlag {
		Set ..EnteredInErrorFlag=EnteredInErrorFlag
		Set Flag=1
	}
	Kill EnteredInErrorFlag
	Quit Flag
}


Method setEnteringInErrorStaffIEN(NS As %String, AllergyIEN As %String) As %Integer
{
	Set Flag=0
	Set EnteringInErrorStaffIEN=$Piece($Get(^|NS|GMR(120.8,AllergyIEN,"ER")),"^",3)
	
	If ..EnteringInErrorStaffIEN'=EnteringInErrorStaffIEN {
		Set ..EnteringInErrorStaffIEN=EnteringInErrorStaffIEN
		Set Flag=1
	}
	Kill EnteringInErrorStaffIEN
	Quit Flag
}

Method setLocalDrugIEN(NS As %String, AllergyIEN As %String) As %Integer
{
	Set Flag=0
	// This is field #1, GMR ALLERGY - a variable-pointer:
	//  POINTS TO:        120.82GMR ALLERGY - ^GMRD(120.82,
	//                    50.6 NATIONAL DRUG - ^PSNDF(50.6,
	//                   50   LOCAL DRUG - ^PSDRUG( 
	//                    50.416DRUG INGREDIENTS - ^PS(50.416,
	//                    50.605VA DRUG CLASS - ^PS(50.605,
	Set LocalDrugIEN=$Piece($Get(^|NS|GMR(120.8,AllergyIEN,0)),"^",3)
	If LocalDrugIEN]""
	{
		Set ien=$Piece(LocalDrugIEN,";")
		Set Gbl=$Piece(LocalDrugIEN,";",2)
		//If ((Gbl["(")&(+ien)) {
		If Gbl["PSDRUG(" {
			Set LocalDrugIEN=ien
		} Else {
			Set LocalDrugIEN=""
		}
		Kill Gbl,ien
	}

	If ..LocalDrugIEN'=LocalDrugIEN {
		Set ..LocalDrugIEN=LocalDrugIEN
		Set Flag=1
	}
	Kill LocalDrugIEN
	Quit Flag
}

Method setMechanism(NS As %String, AllergyIEN As %String) As %Integer
{
	Set Flag=0
	Set Mechanism=$Piece($Get(^|NS|GMR(120.8,AllergyIEN,0)),"^",14)

	If ..Mechanism'=Mechanism {
		Set ..Mechanism=Mechanism
		Set Flag=1
	}
	Kill Mechanism
	Quit Flag
}

Method setObservedHistorical(NS As %String, AllergyIEN As %String) As %Integer
{
	Set Flag=0
	Set ObservedHistorical=$Piece($Get(^|NS|GMR(120.8,AllergyIEN,0)),"^",6)
	
	If $Length(ObservedHistorical)>50 {
		Set ObservedHistorical=$Extract(ObservedHistorical,1,50)
	}
	
	If ..ObservedHistorical'=ObservedHistorical {
		Set ..ObservedHistorical=ObservedHistorical
		Set Flag=1
	}
	Kill ObservedHistorical
	Quit Flag
}


Method setOriginatingStaffIEN(NS As %String, AllergyIEN As %String) As %Integer
{
	Set Flag=0
	Set OriginatingStaffIEN=$Piece($Get(^|NS|GMR(120.8,AllergyIEN,0)),"^",5)
	If $Length(OriginatingStaffIEN)>50 {
		Set OriginatingStaffIEN=$Extract(OriginatingStaffIEN,1,50)
	}
	If ..OriginatingStaffIEN'=OriginatingStaffIEN {
		Set ..OriginatingStaffIEN=OriginatingStaffIEN
		Set Flag=1
	}
	Kill OriginatingStaffIEN
	Quit Flag
}

Method setOriginationDateTime(NS As %String, AllergyIEN As %String) As %Integer
{
	Set Flag=0
	Set OriginationDateTime=$Piece($Get(^|NS|GMR(120.8,AllergyIEN,0)),"^",4)
	Set:+OriginationDateTime OriginationDateTime=##class(%FilemanDate).LogicalToOdbc(OriginationDateTime)
	
	If ..OriginationDateTime'=OriginationDateTime {
		Set ..OriginationDateTime=OriginationDateTime
		Set Flag=1
	}
	Kill OriginationDateTime
	Quit Flag
}

Method setOriginatorSignOffFlag(NS As %String, AllergyIEN As %String) As %Integer
{
	Set Flag=0
	Set OriginatorSignOffFlag=$Piece($Get(^|NS|GMR(120.8,AllergyIEN,0)),"^",12)
	//Flag type of property.
	//  If '1' then 'Y'  If '0' then 'N'  Else  get the first character from the source field
	Set OriginatorSignOffFlag=$Case(OriginatorSignOffFlag,"1":"Y","0":"N",:$Extract(OriginatorSignOffFlag,1))
	If $Length(OriginatorSignOffFlag)>1 {
		Set OriginatorSignOffFlag=$Extract(OriginatorSignOffFlag,1,1)
	}
	If ..OriginatorSignOffFlag'=OriginatorSignOffFlag {
		Set ..OriginatorSignOffFlag=OriginatorSignOffFlag
		Set Flag=1
	}
	Kill OriginatorSignOffFlag
	Quit Flag
}

Method setPatientIEN(NS As %String, AllergyIEN As %String) As %Integer
{
	Set Flag=0
	Set PatientIEN=$Piece($Get(^|NS|GMR(120.8,AllergyIEN,0)),"^",1)

	If ..PatientIEN'=PatientIEN {
		Set ..PatientIEN=PatientIEN
		Set Flag=1
	}
	Kill PatientIEN
	Quit Flag
}

Method setReactantIEN(Sta3a As %String, AllergyIEN As %String) As %Integer
{
	Set Flag=0

	// This is field #1, GMR ALLERGY - a variable-pointer:
	//  POINTS TO:        120.82GMR ALLERGY - ^GMRD(120.82,
	//                    50.6 NATIONAL DRUG - ^PSNDF(50.6,
	//                   50   LOCAL DRUG - ^PSDRUG( 
	//                    50.416DRUG INGREDIENTS - ^PS(50.416,
	//                    50.605VA DRUG CLASS - ^PS(50.605,
	Set ReactantIEN=$Piece($Get(^|Sta3a|GMR(120.8,AllergyIEN,0)),"^",3)
	If ReactantIEN]""
	{
		Set ien=$Piece(ReactantIEN,";")
		Set Gbl=$Piece(ReactantIEN,";",2)
		
		If Gbl["GMRD(120.82," {
			Set ReactantIEN=ien
		} Else {
			Set ReactantIEN=""
		}
		Kill Gbl,ien
	}


	If ..ReactantIEN'=ReactantIEN {
		Set ..ReactantIEN=ReactantIEN
		Set Flag=1
	}
	Kill ReactantIEN
	Quit Flag
}

Method setReportableFlag(NS As %String, AllergyIEN As %String) As %Integer
{
	Set Flag=0
	Set ReportableFlag=$Piece($Get(^|NS|GMR(120.8,AllergyIEN,0)),"^",21)
	//Flag type of property.
	//  If 'y' then 'Y'  If 'n' then 'N'  Else  get the first character from the source field
	Set ReportableFlag=$Case(ReportableFlag,"y":"Y","n":"N",:$Extract(ReportableFlag,1))
	If $Length(ReportableFlag)>1 {
		Set ReportableFlag=$Extract(ReportableFlag,1,1)
	}
	If ..ReportableFlag'=ReportableFlag {
		Set ..ReportableFlag=ReportableFlag
		Set Flag=1
	}
	Kill ReportableFlag
	Quit Flag
}


Method setVerificationDateTime(NS As %String, AllergyIEN As %String) As %Integer
{
	Set Flag=0
	Set VerificationDateTime=$Piece($Get(^|NS|GMR(120.8,AllergyIEN,0)),"^",17)
	Set:+VerificationDateTime VerificationDateTime=##class(%FilemanDate).LogicalToOdbc(VerificationDateTime)
	
	If ..VerificationDateTime'=VerificationDateTime {
		Set ..VerificationDateTime=VerificationDateTime
		Set Flag=1
	}
	Kill VerificationDateTime
	Quit Flag
}

Method setVerifiedFlag(NS As %String, AllergyIEN As %String) As %Integer
{
	Set Flag=0
	Set VerifiedFlag=$Piece($Get(^|NS|GMR(120.8,AllergyIEN,0)),"^",16)
	//Flag type of property.
	//  If '1' then 'Y'  If '0' then 'N'  Else  get the first character from the source field
	Set VerifiedFlag=$Case(VerifiedFlag,"1":"Y","0":"N",:$Extract(VerifiedFlag,1))
	If $Length(VerifiedFlag)>1 {
		Set VerifiedFlag=$Extract(VerifiedFlag,1,1)
	}
	If ..VerifiedFlag'=VerifiedFlag {
		Set ..VerifiedFlag=VerifiedFlag
		Set Flag=1
	}
	Kill VerifiedFlag
	Quit Flag
}

Method setVerifyingStaffIEN(NS As %String, AllergyIEN As %String) As %Integer
{
	Set Flag=0
	Set VerifyingStaffIEN=$Piece($Get(^|NS|GMR(120.8,AllergyIEN,0)),"^",18)
	If $Length(VerifyingStaffIEN)>50 {
		Set VerifyingStaffIEN=$Extract(VerifyingStaffIEN,1,50)
	}
	If ..VerifyingStaffIEN'=VerifyingStaffIEN {
		Set ..VerifyingStaffIEN=VerifyingStaffIEN
		Set Flag=1
	}
	Kill VerifyingStaffIEN
	Quit Flag
}

Storage Default
{
<Data name="Allergy128v002DefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>AllergicReactant</Value>
</Value>
<Value name="3">
<Value>AllergyType</Value>
</Value>
<Value name="4">
<Value>DrugClassIEN</Value>
</Value>
<Value name="5">
<Value>DrugIngredientIEN</Value>
</Value>
<Value name="6">
<Value>DrugNameWithoutDoseIEN</Value>
</Value>
<Value name="7">
<Value>EnteredInErrorDateTime</Value>
</Value>
<Value name="8">
<Value>EnteredInErrorFlag</Value>
</Value>
<Value name="9">
<Value>EnteringInErrorStaffIEN</Value>
</Value>
<Value name="10">
<Value>LocalDrugIEN</Value>
</Value>
<Value name="11">
<Value>Mechanism</Value>
</Value>
<Value name="12">
<Value>ObservedHistorical</Value>
</Value>
<Value name="13">
<Value>OpCode</Value>
</Value>
<Value name="14">
<Value>OriginatingStaffIEN</Value>
</Value>
<Value name="15">
<Value>OriginationDateTime</Value>
</Value>
<Value name="16">
<Value>OriginatorSignOffFlag</Value>
</Value>
<Value name="17">
<Value>PatientIEN</Value>
</Value>
<Value name="18">
<Value>ReactantIEN</Value>
</Value>
<Value name="19">
<Value>ReportableFlag</Value>
</Value>
<Value name="20">
<Value>VerificationDateTime</Value>
</Value>
<Value name="21">
<Value>VerifiedFlag</Value>
</Value>
<Value name="22">
<Value>VerifyingStaffIEN</Value>
</Value>
<Value name="23">
<Value>VistaCreateDate</Value>
</Value>
<Value name="24">
<Value>VistaEditDate</Value>
</Value>
</Data>
<DataLocation>^Allergy.Allergy128v002D</DataLocation>
<DefaultData>Allergy128v002DefaultData</DefaultData>
<IdLocation>^Allergy.Allergy128v002D</IdLocation>
<IndexLocation>^Allergy.Allergy128v002I</IndexLocation>
<StreamLocation>^Allergy.Allergy128v002S</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}