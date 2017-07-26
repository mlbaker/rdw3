Class Dim.LocalDrug50v001 extends (%Persistent, %XML.Adaptor) [ SqlTableName = LocalDrug_50_v001 ] 
{
	
	Property VistaSite As RDW.VistaSite;

	Property LocalDrugIEN As %String;

	Property LocalDrugName As %String (MAXLEN=500);

	Property VAClassification As %String;

	Property PharmacyOrderableItemIEN As %String;

	Property ExpirationDate As %Date;

	Property NationalDrugFileIEN As %String;

	Property VAProductName As %String(MAXLEN=500);

	Property NDC As %String;

	Property OpCode As %String( MAXLEN=1 );

	Property VistaCreateDate As %TimeStamp;

	Property VistaEditDate As %TimeStamp;

	Index MainIndex On (VistaSite, LocalDrugIEN) [ IdKey, PrimaryKey, Unique ];

Index VistaEditDateIndex On VistaEditDate;

ClassMethod Initialize()
{
}

ClassMethod BuildSite(VistaSite As RDW.VistaSite)
{
	Set LocalDrugIEN=$Order(^|VistaSite.VistaSiteNamespace|PSDRUG(0))
	While +LocalDrugIEN {
		Set Status=..UpdateObject(VistaSite,LocalDrugIEN)
		Write:'+Status $$$ERROR(Status),!
		Set LocalDrugIEN=$Order(^|VistaSite.VistaSiteNamespace|PSDRUG(LocalDrugIEN))
	}
}

ClassMethod RemoveObject(VistaSite As RDW.VistaSite, FMPK As %String) As %String
{
	Set Status=1
	Set LocalDrugIEN=$Piece(FMPK,",",1)
	Quit:'+LocalDrugIEN "1^ LocalDrugIEN: "_LocalDrugIEN_" is NOT a number."
	
	Quit:$Get(^|VistaSite.VistaSiteNamespace|PSDRUG(LocalDrugIEN,0))'="" "1^ "_LocalDrugIEN_" is not deleted." 
	Set id=VistaSite.Sta3n_"||"_LocalDrugIEN

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
	Set LocalDrugIEN=$Piece(FMPK,",",1)
	Quit:'+LocalDrugIEN "1^ LocalDrugIEN: "_LocalDrugIEN_" is NOT a number."
	
	Set id=VistaSite.Sta3n_"||"_LocalDrugIEN
	Set oref=..%OpenId(id,4)
	
	If '$IsObject(oref) {
		Set oref=..%New()
		Set oref.LocalDrugIEN=LocalDrugIEN
		Set oref.VistaSite=VistaSite
		Set oref.VistaCreateDate=$ZDateTime($H,3)
		Set oref.OpCode=""
		Set $Bit(BitFlag,1)=1
	}
	
	Set $Bit(BitFlag,2)=oref.setLocalDrugName(VistaSite.VistaSiteNamespace,LocalDrugIEN)
	Set $Bit(BitFlag,3)=oref.setVAClassification(VistaSite.VistaSiteNamespace,LocalDrugIEN)
	Set $Bit(BitFlag,4)=oref.setPharmacyOrderableItemIEN(VistaSite.VistaSiteNamespace,LocalDrugIEN)
	Set $Bit(BitFlag,5)=oref.setExpirationDate(VistaSite.VistaSiteNamespace,LocalDrugIEN)
	Set $Bit(BitFlag,6)=oref.setNationalDrugFileIEN(VistaSite.VistaSiteNamespace,LocalDrugIEN)
	Set $Bit(BitFlag,7)=oref.setVAProductName(VistaSite.VistaSiteNamespace,LocalDrugIEN)	
	Set $Bit(BitFlag,8)=oref.setNDC(VistaSite.VistaSiteNamespace,LocalDrugIEN)

	If $BitFind(BitFlag,1) {
		// Something changed.
		Set oref.VistaEditDate=$ZDateTime($H,3)
		Set Status=oref.%Save()
	}
	Do oref.%Close()
	Quit Status
}

Method setLocalDrugName(NS As %String, LocalDrugIEN As %String) As %Integer
{
	Set Flag=0
	Set LocalDrugName=$Piece($Get(^|NS|PSDRUG(LocalDrugIEN,0)),"^",1)
	If ..LocalDrugName'=LocalDrugName {
		Set ..LocalDrugName=LocalDrugName
		Set Flag=1
	}
	Quit Flag
}

Method setVAClassification(NS As %String, LocalDrugIEN As %String) As %Integer
{
	Set Flag=0
	Set VAClassification=$Piece($Get(^|NS|PSDRUG(LocalDrugIEN,0)),"^",2)
	If ..VAClassification'=VAClassification {
		Set ..VAClassification=VAClassification
		Set Flag=1
	}
	Quit Flag
}

Method setPharmacyOrderableItemIEN(NS As %String, LocalDrugIEN As %String) As %Integer
{
	Set Flag=0
	Set PharmacyOrderableItemIEN=$Piece($Get(^|NS|PSDRUG(LocalDrugIEN,2)),"^",1)
	If ..PharmacyOrderableItemIEN'=PharmacyOrderableItemIEN {
		Set ..PharmacyOrderableItemIEN=PharmacyOrderableItemIEN
		Set Flag=1
	}
	Quit Flag
}

Method setExpirationDate(NS As %String, LocalDrugIEN As %String) As %Integer
{
	Set Flag=0
	Set ExpirationDate=$Piece($Get(^|NS|PSDRUG(LocalDrugIEN,660)),"^",9)
	Set:+ExpirationDate ExpirationDate=##class(%FilemanDate).LogicalToDate(ExpirationDate)
	If ..ExpirationDate'=ExpirationDate {
		Set ..ExpirationDate=ExpirationDate
		Set Flag=1
	}
	Quit Flag
}

Method setNationalDrugFileIEN(NS As %String, LocalDrugIEN As %String) As %Integer
{
	Set Flag=0
	Set NationalDrugFileIEN=$Piece($Get(^|NS|PSDRUG(LocalDrugIEN,"ND")),"^",1)
	If ..NationalDrugFileIEN'=NationalDrugFileIEN {
		Set ..NationalDrugFileIEN=NationalDrugFileIEN
		Set Flag=1
	}
	Quit Flag
}

Method setVAProductName(NS As %String, LocalDrugIEN As %String) As %Integer
{
	Set Flag=0
	Set VAProductName=$Piece($Get(^|NS|PSDRUG(LocalDrugIEN,"ND")),"^",2)
	If ..VAProductName'=VAProductName {
		Set ..VAProductName=VAProductName
		Set Flag=1
	}
	Quit Flag
}

Method setNDC(NS As %String, LocalDrugIEN As %String) As %Integer
{
	Set Flag=0
	Set NDC=$Piece($Get(^|NS|PSDRUG(LocalDrugIEN,2)),"^",4)
	If ..NDC'=NDC {
		Set ..NDC=NDC
		Set Flag=1
	}
	Quit Flag
}
Storage Default
{
<Data name="LocalDrug50v001DefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>LocalDrugName</Value>
</Value>
<Value name="3">
<Value>VAClassification</Value>
</Value>
<Value name="4">
<Value>PharmacyOrderableItemIEN</Value>
</Value>
<Value name="5">
<Value>ExpirationDate</Value>
</Value>
<Value name="6">
<Value>NationalDrugFileIEN</Value>
</Value>
<Value name="7">
<Value>VAProductName</Value>
</Value>
<Value name="8">
<Value>NDC</Value>
</Value>
<Value name="9">
<Value>OpCode</Value>
</Value>
<Value name="10">
<Value>VistaCreateDate</Value>
</Value>
<Value name="11">
<Value>VistaEditDate</Value>
</Value>
</Data>
<DataLocation>^Dim.LocalDrug50v001D</DataLocation>
<DefaultData>LocalDrug50v001DefaultData</DefaultData>
<IdLocation>^Dim.LocalDrug50v001D</IdLocation>
<IndexLocation>^Dim.LocalDrug50v001I</IndexLocation>
<StreamLocation>^Dim.LocalDrug50v001S</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}