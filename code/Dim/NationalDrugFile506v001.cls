Class Dim.NationalDrugFile506v001 Extends (%Persistent, %XML.Adaptor) [ SqlTableName = NationalDrugFile_50_6_v001 ] 
{
	Property VistaSite As RDW.VistaSite;

	Property NationalDrugFileIEN As %String;

	Property NationalDrugFileName As %String (MAXLEN=500);

	Property InactivationDate As %Date;

	Property MasterEntryForVUID As %String;

	Property VUID As %String(MAXLEN=500);

	Property OpCode As %String( MAXLEN=1 );

	Property VistaCreateDate As %TimeStamp;

	Property VistaEditDate As %TimeStamp;

	Index MainIndex On (VistaSite, NationalDrugFileIEN) [ IdKey, PrimaryKey, Unique ];

Index VistaEditDateIndex On VistaEditDate;

ClassMethod Initialize()
{
}

ClassMethod BuildSite(VistaSite As RDW.VistaSite)
{
	Set NationalDrugFileIEN=$Order(^|VistaSite.VistaSiteNamespace|PSNDF(50.6,0))
	While +NationalDrugFileIEN {
		Set Status=..UpdateObject(VistaSite,NationalDrugFileIEN)
		Write:'+Status $$$ERROR(Status),!
		Set NationalDrugFileIEN=$Order(^|VistaSite.VistaSiteNamespace|PSNDF(50.6,NationalDrugFileIEN))
	}
}

ClassMethod RemoveObject(VistaSite As RDW.VistaSite, FMPK As %String) As %String
{
	Set Status=1
	Set NationalDrugFileIEN=$Piece(FMPK,",",1)
	Quit:'+NationalDrugFileIEN "1^ NationalDrugFileIEN: "_NationalDrugFileIEN_" is NOT a number."
	
	Quit:$Get(^|VistaSite.VistaSiteNamespace|PSNDF(50.6,NationalDrugFileIEN,0))'="" "1^ "_NationalDrugFileIEN_" is not deleted." 
	Set id=VistaSite.Sta3n_"||"_NationalDrugFileIEN

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
	Set NationalDrugFileIEN=$Piece(FMPK,",",1)
	Quit:'+NationalDrugFileIEN "1^ NationalDrugFileIEN: "_NationalDrugFileIEN_" is NOT a number."
	
	Set id=VistaSite.Sta3n_"||"_NationalDrugFileIEN
	Set oref=..%OpenId(id,4)
	
	If '$IsObject(oref) {
		Set oref=..%New()
		Set oref.NationalDrugFileIEN=NationalDrugFileIEN
		Set oref.VistaSite=VistaSite
		Set oref.VistaCreateDate=$ZDateTime($H,3)
		Set oref.OpCode=""
		Set $Bit(BitFlag,1)=1
	}
	
	Set $Bit(BitFlag,2)=oref.setNationalDrugFileName(VistaSite.VistaSiteNamespace,NationalDrugFileIEN)
	Set $Bit(BitFlag,3)=oref.setInactivationDate(VistaSite.VistaSiteNamespace,NationalDrugFileIEN)
	Set $Bit(BitFlag,4)=oref.setMasterEntryForVUID(VistaSite.VistaSiteNamespace,NationalDrugFileIEN)
	Set $Bit(BitFlag,5)=oref.setVUID(VistaSite.VistaSiteNamespace,NationalDrugFileIEN)


	If $BitFind(BitFlag,1) {
		// Something changed.
		Set oref.VistaEditDate=$ZDateTime($H,3)
		Set Status=oref.%Save()
	}
	Do oref.%Close()
	Quit Status
}

Method setNationalDrugFileName(NS As %String, NationalDrugFileIEN As %String) As %Integer
{
	Set Flag=0
	Set NationalDrugFileName=$Piece($Get(^|NS|PSNDF(50.6,NationalDrugFileIEN,0)),"^",1)
	If ..NationalDrugFileName'=NationalDrugFileName {
		Set ..NationalDrugFileName=NationalDrugFileName
		Set Flag=1
	}
	Quit Flag
}


Method setInactivationDate(NS As %String, NationalDrugFileIEN As %String) As %Integer
{
	Set Flag=0
	Set InactivationDate=$Piece($Get(^|NS|PSNDF(50.6,NationalDrugFileIEN,0)),"^",2)
	Set:+InactivationDate InactivationDate=##class(%FilemanDate).LogicalToDate(InactivationDate)
	If ..InactivationDate'=InactivationDate {
		Set ..InactivationDate=InactivationDate
		Set Flag=1
	}
	Quit Flag
}

Method setMasterEntryForVUID(NS As %String, NationalDrugFileIEN As %String) As %Integer
{
	Set Flag=0
	Set MasterEntryForVUID=$Piece($Get(^|NS|PSNDF(50.6,NationalDrugFileIEN,"VUID")),"^",2)
	If ..MasterEntryForVUID'=MasterEntryForVUID {
		Set ..MasterEntryForVUID=MasterEntryForVUID
		Set Flag=1
	}
	Quit Flag
}

Method setVUID(NS As %String, NationalDrugFileIEN As %String) As %Integer
{
	Set Flag=0
	Set VUID=$Piece($Get(^|NS|PSNDF(50.6,NationalDrugFileIEN,"VUID")),"^",1)
	If ..VUID'=VUID {
		Set ..VUID=VUID
		Set Flag=1
	}
	Quit Flag
}
Storage Default
{
<Data name="NationalDrugFile506v001DefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>NationalDrugFileName</Value>
</Value>
<Value name="3">
<Value>InactivationDate</Value>
</Value>
<Value name="4">
<Value>MasterEntryForVUID</Value>
</Value>
<Value name="5">
<Value>VUID</Value>
</Value>
<Value name="6">
<Value>OpCode</Value>
</Value>
<Value name="7">
<Value>VistaCreateDate</Value>
</Value>
<Value name="8">
<Value>VistaEditDate</Value>
</Value>
</Data>
<DataLocation>^Dim.NationalDrugFile506v001D</DataLocation>
<DefaultData>NationalDrugFile506v001DefaultData</DefaultData>
<IdLocation>^Dim.NationalDrugFile506v001D</IdLocation>
<IndexLocation>^Dim.NationalDrugFile506v001I</IndexLocation>
<StreamLocation>^Dim.NationalDrugFile506v001S</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}