Class SPatient.SPatient2v001 Extends %Persistent [SqlTableName= SPatient_2_v001 ]
{

Property VistaSite As RDW.VistaSite;

Property PatientIEN As %String;

Property PatientName As %String;

Property PatientLastName As %String;

Property PatientFirstName As %String;

Property Gender As %String;

Property DateOfBirth As %Date;

Property SSN As %String;

Property MaritalStatusIEN As %String;

Property StreetAddress1 As %String;

Property StreetAddress2 As %String;

Property StreetAddress3 As %String; 

Property City As %String;

Property StateIEN As %String;

Property ZipCode As %String;

Property CountyIEN As %String;

Property ServiceConnectedFlag As %Boolean;

Property DateOfDeath As %Date;

Property PatientTypeIEN As %String;

Property IntegrationControlNumber As %String;

Property FullICN AS %String;

Property VeteranFlag As %String;

Property OpCode As %String;

Property VistaCreateDate As %TimeStamp;

Property VistaEditDate As %TimeStamp;

Index MainIndex On (VistaSite, PatientIEN) [ IdKey, PrimaryKey, Unique ];

Index VistaEditDateIndex On VistaEditDate;

ClassMethod Initialize()
{
}

ClassMethod BuildSite(VistaSite As RDW.VistaSite)
{
	Set PatientIEN=$Order(^|VistaSite.VistaSiteNamespace|DPT(0))
	While +PatientIEN {
		Set Status=..UpdateObject(VistaSite,PatientIEN)
		Write:'+Status $$$ERROR(Status),!
		Set PatientIEN=$Order(^|VistaSite.VistaSiteNamespace|DPT(PatientIEN))
	}
}

ClassMethod RemoveObject(VistaSite As RDW.VistaSite, FMPK As %String) As %String
{
	Set Status=1
	Set PatientIEN=$Piece(FMPK,",",1)
	Quit:'+VistaFileNumber "1^ PatientIEN: "_PatientIEN_" is NOT a number."
	
	Quit:$Get(^|VistaSite.VistaSiteNamespace|DPT(PatientIEN,0))'="" "1^ "_PatientIEN_" is not deleted." 
	Set id=VistaSite.Sta3n_"||"_PatientIEN

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
	Set PatientIEN=$Piece(FMPK,",",1)
	Quit:'+PatientIEN "1^ PatientIEN: "_PatientIEN_" is NOT a number."
	
	Set id=VistaSite.Sta3n_"||"_PatientIEN
	Set oref=..%OpenId(id,4)
	
	If '$IsObject(oref) {
		Set oref=..%New()
		Set oref.PatientIEN=PatientIEN
		Set oref.VistaSite=VistaSite
		Set oref.VistaCreateDate=$ZDateTime($H,3)
		Set oref.OpCode=""
		Set $Bit(BitFlag,1)=1
	}
	
	Set $Bit(BitFlag,2)=oref.setPatientName(VistaSite.VistaSiteNamespace,PatientIEN)
	Set $Bit(BitFlag,3)=oref.setPatientFirstName(VistaSite.VistaSiteNamespace,PatientIEN)
	Set $Bit(BitFlag,4)=oref.setPatientLastName(VistaSite.VistaSiteNamespace,PatientIEN)
	Set $Bit(BitFlag,5)=oref.setGender(VistaSite.VistaSiteNamespace,PatientIEN)
	Set $Bit(BitFlag,6)=oref.setDateOfBirth(VistaSite.VistaSiteNamespace,PatientIEN)
	Set $Bit(BitFlag,7)=oref.setSSN(VistaSite.VistaSiteNamespace,PatientIEN)	
	Set $Bit(BitFlag,8)=oref.setMaritalStatusIEN(VistaSite.VistaSiteNamespace,PatientIEN)
	Set $Bit(BitFlag,9)=oref.setStreetAddress1(VistaSite.VistaSiteNamespace,PatientIEN)
	Set $Bit(BitFlag,10)=oref.setStreetAddress2(VistaSite.VistaSiteNamespace,PatientIEN)
	Set $Bit(BitFlag,11)=oref.setStreetAddress3(VistaSite.VistaSiteNamespace,PatientIEN)
	Set $Bit(BitFlag,12)=oref.setCity(VistaSite.VistaSiteNamespace,PatientIEN)
	Set $Bit(BitFlag,13)=oref.setStateIEN(VistaSite.VistaSiteNamespace,PatientIEN)
	Set $Bit(BitFlag,14)=oref.setZipCode(VistaSite.VistaSiteNamespace,PatientIEN)
	Set $Bit(BitFlag,15)=oref.setCountyIEN(VistaSite.VistaSiteNamespace,PatientIEN)
	Set $Bit(BitFlag,16)=oref.setServiceConnectedFlag(VistaSite.VistaSiteNamespace,PatientIEN)
	Set $Bit(BitFlag,17)=oref.setDateOfDeath(VistaSite.VistaSiteNamespace,PatientIEN)
	Set $Bit(BitFlag,18)=oref.setPatientTypeIEN(VistaSite.VistaSiteNamespace,PatientIEN)
	Set $Bit(BitFlag,19)=oref.setIntegrationControlNumber(VistaSite.VistaSiteNamespace,PatientIEN)
	Set $Bit(BitFlag,20)=oref.setFullICN(VistaSite.VistaSiteNamespace,PatientIEN)
	Set $Bit(BitFlag,21)=oref.setVeteranFlag(VistaSite.VistaSiteNamespace,PatientIEN)


	
	If $BitFind(BitFlag,1) {
		// Something changed.
		Set oref.VistaEditDate=$ZDateTime($H,3)
		Set Status=oref.%Save()
	}
	Do oref.%Close()
	Quit Status
}

Method setPatientName(NS As %String, PatientIEN As %String) As %Integer
{
	Set Flag=0
	Set PatientName=$Piece($Get(^|NS|DPT(PatientIEN,0)),"^",1)
	If ..PatientName'=PatientName {
		Set ..PatientName=PatientName
		Set Flag=1
	}
	Quit Flag
}

Method setPatientLastName(NS As %String, PatientIEN As %String) As %Integer
{
	Set Flag=0
	Set PatientLastName=$Piece($Piece($Get(^|NS|DPT(PatientIEN,0)),"^",1),",",1)
	If ..PatientLastName'=PatientLastName {
		Set ..PatientLastName=PatientLastName
		Set Flag=1
	}
	Quit Flag
}

Method setPatientFirstName(NS As %String, PatientIEN As %String) As %Integer
{
	Set Flag=0
	Set PatientFirstName=$Piece($Piece($Get(^|NS|DPT(PatientIEN,0)),"^",1),",",2)
	If ..PatientFirstName'=PatientFirstName {
		Set ..PatientFirstName=PatientFirstName
		Set Flag=1
	}
	Quit Flag
}

Method setGender(NS As %String, PatientIEN As %String) As %Integer
{
	Set Flag=0
	Set Gender=$Piece($Get(^|NS|DPT(PatientIEN,0)),"^",2)
	If ..Gender'=Gender {
		Set ..Gender=Gender
		Set Flag=1
	}
	Quit Flag
}

Method setDateOfBirth(NS As %String, PatientIEN As %String) As %Integer
{
	Set Flag=0
	Set DateOfBirth=$Piece($Get(^|NS|DPT(PatientIEN,0)),"^",3)
	Set:+DateOfBirth DateOfBirth=##class(%FilemanDate).LogicalToDate(DateOfBirth)
	If ..DateOfBirth'=DateOfBirth {
		Set ..DateOfBirth=DateOfBirth
		Set Flag=1
	}
	Quit Flag
}

Method setSSN(NS As %String, PatientIEN As %String) As %Integer
{
	Set Flag=0
	Set SSN=$Piece($Get(^|NS|DPT(PatientIEN,0)),"^",9)
	If ..SSN'=SSN {
		Set ..SSN=SSN
		Set Flag=1
	}
	Quit Flag
}
Method setMaritalStatusIEN(NS As %String, PatientIEN As %String) As %Integer
{
	Set Flag=0
	Set MaritalStatusIEN=$Piece($Get(^|NS|DPT(PatientIEN,0)),"^",5)
	If ..MaritalStatusIEN'=MaritalStatusIEN {
		Set ..MaritalStatusIEN=MaritalStatusIEN
		Set Flag=1
	}
	Quit Flag
}
Method setStreetAddress1(NS As %String, PatientIEN As %String) As %Integer
{
	Set Flag=0
	Set StreetAddress1=$Piece($Get(^|NS|DPT(PatientIEN,.11)),"^",1)
	If ..StreetAddress1'=StreetAddress1 {
		Set ..StreetAddress1=StreetAddress1
		Set Flag=1
	}
	Quit Flag
}
Method setStreetAddress2(NS As %String, PatientIEN As %String) As %Integer
{
	Set Flag=0
	Set StreetAddress2=$Piece($Get(^|NS|DPT(PatientIEN,.11)),"^",2)
	If ..StreetAddress2'=StreetAddress2 {
		Set ..StreetAddress2=StreetAddress2
		Set Flag=1
	}
	Quit Flag
}
Method setStreetAddress3(NS As %String, PatientIEN As %String) As %Integer
{
	Set Flag=0
	Set StreetAddress3=$Piece($Get(^|NS|DPT(PatientIEN,.11)),"^",3)
	If ..StreetAddress3'=StreetAddress3 {
		Set ..StreetAddress3=StreetAddress3
		Set Flag=1
	}
	Quit Flag
}
Method setCity(NS As %String, PatientIEN As %String) As %Integer
{
	Set Flag=0
	Set City=$Piece($Get(^|NS|DPT(PatientIEN,.11)),"^",4)
	If ..City'=City {
		Set ..City=City
		Set Flag=1
	}
	Quit Flag
}
Method setStateIEN(NS As %String, PatientIEN As %String) As %Integer
{
	Set Flag=0
	Set StateIEN=$Piece($Get(^|NS|DPT(PatientIEN,.11)),"^",5)
	If ..StateIEN'=StateIEN {
		Set ..StateIEN=StateIEN
		Set Flag=1
	}
	Quit Flag
}
Method setZipCode(NS As %String, PatientIEN As %String) As %Integer
{
	Set Flag=0
	Set ZipCode=$Piece($Get(^|NS|DPT(PatientIEN,.11)),"^",6)
	If ..ZipCode'=ZipCode {
		Set ..ZipCode=ZipCode
		Set Flag=1
	}
	Quit Flag
}
Method setCountyIEN(NS As %String, PatientIEN As %String) As %Integer
{
	Set Flag=0
	Set CountyIEN=$Piece($Get(^|NS|DPT(PatientIEN,.11)),"^",7)
	If ..CountyIEN'=CountyIEN {
		Set ..CountyIEN=CountyIEN
		Set Flag=1
	}
	Quit Flag
}
Method setServiceConnectedFlag(NS As %String, PatientIEN As %String) As %Integer
{
	Set Flag=0
	Set ServiceConnectedFlag=$Piece($Get(^|NS|DPT(PatientIEN,.3)),"^",1)
	Set ServiceConnectedFlag=$Case(ServiceConnectedFlag,"Y":1,:0)
	If ..ServiceConnectedFlag'=ServiceConnectedFlag {
		Set ..ServiceConnectedFlag=ServiceConnectedFlag
		Set Flag=1
	}
	Quit Flag
}
Method setDateOfDeath(NS As %String, PatientIEN As %String) As %Integer
{
	Set Flag=0
	Set DateOfDeath=$Piece($Get(^|NS|DPT(PatientIEN,.35)),"^",1)
	Set:+DateOfDeath DateOfDeath=##class(%FilemanDate).LogicalToDate(DateOfDeath)
	If ..DateOfDeath'=DateOfDeath {
		Set ..DateOfDeath=DateOfDeath
		Set Flag=1
	}
	Quit Flag
}
Method setPatientTypeIEN(NS As %String, PatientIEN As %String) As %Integer
{
	Set Flag=0
	Set PatientTypeIEN=$Piece($Get(^|NS|DPT(PatientIEN,"TYPE")),"^",1)
	If ..PatientTypeIEN'=PatientTypeIEN {
		Set ..PatientTypeIEN=PatientTypeIEN
		Set Flag=1
	}
	Quit Flag
}
Method setIntegrationControlNumber(NS As %String, PatientIEN As %String) As %Integer
{
	Set Flag=0
	Set IntegrationControlNumber=$Piece($Get(^|NS|DPT(PatientIEN,"MPI")),"^",1)
	If ..IntegrationControlNumber'=IntegrationControlNumber {
		Set ..IntegrationControlNumber=IntegrationControlNumber
		Set Flag=1
	}
	Quit Flag
}
Method setFullICN(NS As %String, PatientIEN As %String) As %Integer
{
	Set Flag=0
	Set FullICN=$Piece($Get(^|NS|DPT(PatientIEN,"MPI")),"^",10)
	If ..FullICN'=FullICN {
		Set ..FullICN=FullICN
		Set Flag=1
	}
	Quit Flag
}
Method setVeteranFlag(NS As %String, PatientIEN As %String) As %Integer
{
	Set Flag=0
	Set VeteranFlag=$Piece($Get(^|NS|DPT(PatientIEN,"VET")),"^",1)
	Set VeteranFlag=$Case(VeteranFlag,"Y":1,:0)
	If ..VeteranFlag'=VeteranFlag {
		Set ..VeteranFlag=VeteranFlag
		Set Flag=1
	}
	Quit Flag
}


Storage Default
{
<Data name="SPatient2v001DefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>PatientName</Value>
</Value>
<Value name="3">
<Value>PatientLastName</Value>
</Value>
<Value name="4">
<Value>PatientFirstName</Value>
</Value>
<Value name="5">
<Value>Gender</Value>
</Value>
<Value name="6">
<Value>DateOfBirth</Value>
</Value>
<Value name="7">
<Value>SSN</Value>
</Value>
<Value name="8">
<Value>MaritalStatusIEN</Value>
</Value>
<Value name="9">
<Value>StreetAddress1</Value>
</Value>
<Value name="10">
<Value>StreetAddress2</Value>
</Value>
<Value name="11">
<Value>StreetAddress3</Value>
</Value>
<Value name="12">
<Value>City</Value>
</Value>
<Value name="13">
<Value>StateIEN</Value>
</Value>
<Value name="14">
<Value>ZipCode</Value>
</Value>
<Value name="15">
<Value>CountyIEN</Value>
</Value>
<Value name="16">
<Value>ServiceConnectedFlag</Value>
</Value>
<Value name="17">
<Value>DateOfDeath</Value>
</Value>
<Value name="18">
<Value>PatientTypeIEN</Value>
</Value>
<Value name="19">
<Value>IntegrationControlNumber</Value>
</Value>
<Value name="20">
<Value>FullICN</Value>
</Value>
<Value name="21">
<Value>VeteranFlag</Value>
</Value>
<Value name="22">
<Value>OpCode</Value>
</Value>
<Value name="23">
<Value>VistaCreateDate</Value>
</Value>
<Value name="24">
<Value>VistaEditDate</Value>
</Value>
</Data>
<DataLocation>^SPatient.SPatient2v001D</DataLocation>
<DefaultData>SPatient2v001DefaultData</DefaultData>
<IdLocation>^SPatient.SPatient2v001D</IdLocation>
<IndexLocation>^SPatient.SPatient2v001I</IndexLocation>
<StreamLocation>^SPatient.SPatient2v001S</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
