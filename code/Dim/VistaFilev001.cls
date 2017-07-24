Class Dim.VistaFilev001 Extends %Persistent
{

Property VistaSite As RDW.VistaSite;

Property VistaFileNumber As %String;

Property VistaFileName As %String;

Property GlobalName As %String;

Property VistaFileDescription As %String(MAXLEN = 8000);

Property OpCode As %String;

Property VistaCreateDate As %TimeStamp;

Property VistaEditDate As %TimeStamp;

Index MainIndex On (VistaSite, VistaFileNumber) [ IdKey, PrimaryKey, Unique ];

Index VistaEditDateIndex On VistaEditDate;

ClassMethod Initialize()
{
}

ClassMethod BuildSite(VistaSite As RDW.VistaSite)
{
	Set VistaFileNumber=$Order(^|VistaSite.VistaSiteNamespace|DIC(0))
	While +VistaFileNumber {
		Set Status=..UpdateObject(VistaSite,VistaFileNumber)
		Write:'+Status $$$ERROR(Status),!
		Set VistaFileNumber=$Order(^|VistaSite.VistaSiteNamespace|DIC(VistaFileNumber))
	}
}

ClassMethod RemoveObject(VistaSite As RDW.VistaSite, FMPK As %String) As %String
{
	Set Status=1
	Set VistaFileNumber=$Piece(FMPK,",",1)
	Quit:'+VistaFileNumber "1^ VistaFileNumber: "_VistaFileNumber_" is NOT a number."
	
	Quit:$Get(^|VistaSite.VistaSiteNamespace|DIC(VistaFileNumber,0))'="" "1^ "_VistaFileNumber_" is not deleted." 
	Set id=VistaSite.Sta3n_"||"_VistaFileNumber
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
	Set VistaFileNumber=$Piece(FMPK,",",1)
	Quit:'+VistaFileNumber "1^ VistaFileNumber: "_VistaFileNumber_" is NOT a number."
	
	Set id=VistaSite.Sta3n_"||"_VistaFileNumber
	Set oref=..%OpenId(id,4)
	If '$IsObject(oref) {
		Set oref=..%New()
		Set oref.VistaFileNumber=VistaFileNumber
		Set oref.VistaSite=VistaSite
		Set oref.VistaCreateDate=$ZDateTime($H,3)
		Set oref.OpCode=""
		Set $Bit(BitFlag,1)=1
	}
	
	Set $Bit(BitFlag,2)=oref.setVistaFileName(VistaSite.VistaSiteNamespace,VistaFileNumber)
	Set $Bit(BitFlag,3)=oref.setGlobalName(VistaSite.VistaSiteNamespace,VistaFileNumber)
	Set $Bit(BitFlag,4)=oref.setVistaFileDescription(VistaSite.VistaSiteNamespace,VistaFileNumber)
	
	If $BitFind(BitFlag,1) {
		// Something changed.
		Set oref.VistaEditDate=$ZDateTime($H,3)
		Set Status=oref.%Save()
	}
	Do oref.%Close()
	Quit Status
}

Method setVistaFileName(NS As %String, VistaFileNumber As %String) As %Integer
{
	Set Flag=0
	Set VistaFileName=$Piece($Get(^|NS|DIC(VistaFileNumber,0)),"^",1)
	If ..VistaFileName'=VistaFileName {
		Set ..VistaFileName=VistaFileName
		Set Flag=1
	}
	Quit Flag
}

Method setGlobalName(NS As %String, VistaFileNumber As %String) As %Integer
{
	Set Flag=0
	Set GlobalName=$Get(^|NS|DIC(VistaFileNumber,0,"GL"))
	If ..GlobalName'=GlobalName {
		Set ..GlobalName=GlobalName
		Set Flag=1
	}
	Quit Flag
}

Method setVistaFileDescription(NS As %String, VistaFileNumber As %String) As %Integer
{
	Set Flag=0
	Set VistaFileDescription=""
	Set LineIEN=$Order(^|NS|DIC(VistaFileNumber,"%D",0))
	While +LineIEN {
		Set VistaFileDescription=VistaFileDescription_$Get(^|NS|DIC(VistaFileNumber,"%D",LineIEN,0))_$C(13)
		Set LineIEN=$Order(^|NS|DIC(VistaFileNumber,"%D",LineIEN))
	}
	Set:$Length(VistaFileDescription)>8000 VistaFileDescription=$Extract(VistaFileDescription,1,8000)
	If ..VistaFileDescription'=VistaFileDescription {
		Set ..VistaFileDescription=VistaFileDescription
		Set Flag=1
	}
	Quit Flag
}

Storage Default
{
<Data name="VistaFilev001DefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>VistaFileName</Value>
</Value>
<Value name="3">
<Value>GlobalName</Value>
</Value>
<Value name="4">
<Value>VistaFileDescription</Value>
</Value>
<Value name="5">
<Value>OpCode</Value>
</Value>
<Value name="6">
<Value>VistaCreateDate</Value>
</Value>
<Value name="7">
<Value>VistaEditDate</Value>
</Value>
</Data>
<DataLocation>^Dim.VistaFilev001D</DataLocation>
<DefaultData>VistaFilev001DefaultData</DefaultData>
<IdLocation>^Dim.VistaFilev001D</IdLocation>
<IndexLocation>^Dim.VistaFilev001I</IndexLocation>
<StreamLocation>^Dim.VistaFilev001S</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
