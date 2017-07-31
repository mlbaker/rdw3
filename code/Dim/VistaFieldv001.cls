Class Dim.VistaFieldv001 Extends %Persistent
{

Property VistaSite As RDW.VistaSite;

Property VistaFileNumber As %String;

Property VistaFieldNumber As %String;

Property VistaFieldName As %String;

Property VistaFieldType As %String;

Property VistaFieldCodes As %String(MAXLEN = 250);

Property PathToParent As %String(MAXLEN = 250);

Property ParentVistaFile As Dim.VistaFilev001;

Property GlobalNode As %String(MAXLEN = 350);

Property GlobalPiece As %Integer;

Property PointedToFileNumber As %String(MAXLEN = 250);

Property SubFileNumber As %String;

Property SubFileConstant As %String;

Property VistaFieldDescription As %String(MAXLEN = 8000);

Property OpCode As %String;

Property VistaCreateDate As %TimeStamp;

Property VistaEditDate As %TimeStamp;

Index MainIndex On (VistaSite, VistaFileNumber, VistaFieldNumber) [ IdKey, PrimaryKey, Unique ];

Index VistaEditDateIndex On VistaEditDate;

ClassMethod Initialize()
{
}

ClassMethod BuildSite(VistaSite As RDW.VistaSite)
{
	Set VistaFileNumber=$Order(^|VistaSite.VistaSiteNamespace|DD(0))
	While +VistaFileNumber {
		Set VistaFieldNumber=$Order(^|VistaSite.VistaSiteNamespace|DD(VistaFileNumber,0))
		While +VistaFieldNumber {
			Set Status=..UpdateObject(VistaSite,VistaFileNumber_","_VistaFieldNumber)
			Write:'+Status $$$ERROR(Status),!
			Set VistaFieldNumber=$Order(^|VistaSite.VistaSiteNamespace|DD(VistaFileNumber,VistaFieldNumber))
		}
		Set VistaFileNumber=$Order(^|VistaSite.VistaSiteNamespace|DD(VistaFileNumber))
	}
}

ClassMethod RemoveObject(VistaSite As RDW.VistaSite, FMPK As %String) As %String
{
	Set Status=1
	Set VistaFileNumber=$Piece(FMPK,",",1)
	Quit:'+VistaFileNumber "1^ VistaFileNumber: "_VistaFileNumber_" is NOT a number."
	Set VistaFieldNumber=$Piece(FMPK,",",2)
	Quit:'+VistaFieldNumber "1^ VistaFieldNumber: "_VistaFieldNumber_" is NOT a number."
	
	Quit:$Get(^|VistaSite.VistaSiteNamespace|DD(VistaFileNumber,VistaFieldNumber,0))'="" "1^ "_FMPK_" is not deleted." 
	Set id=VistaSite.Sta3n_"||"_VistaFileNumber_"||"_VistaFieldNumber
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
	Set VistaFieldNumber=$Piece(FMPK,",",2)
	Quit:'+VistaFieldNumber "1^ VistaFieldNumber: "_VistaFieldNumber_" is NOT a number."
	
	Set id=VistaSite.Sta3n_"||"_VistaFileNumber_"||"_VistaFieldNumber
	Set oref=..%OpenId(id,4)
	
	If '$IsObject(oref) {
		Set oref=..%New()
		Set oref.VistaFileNumber=VistaFileNumber
		Set oref.VistaFieldNumber=VistaFieldNumber
		Set oref.VistaSite=VistaSite
		Set oref.VistaCreateDate=$ZDateTime($H,3)
		Set oref.OpCode=""
		Set $Bit(BitFlag,1)=1
	}
	
	Set $Bit(BitFlag,2)=oref.setVistaFieldName(VistaSite.VistaSiteNamespace,VistaFileNumber,VistaFieldNumber)
	Set $Bit(BitFlag,3)=oref.setVistaFieldType(VistaSite.VistaSiteNamespace,VistaFileNumber,VistaFieldNumber)
	Set $Bit(BitFlag,4)=oref.setVistaFieldDescription(VistaSite.VistaSiteNamespace,VistaFileNumber,VistaFieldNumber)
	Set $Bit(BitFlag,5)=oref.setVistaFieldCodes(VistaSite.VistaSiteNamespace,VistaFileNumber,VistaFieldNumber)
	Set $Bit(BitFlag,6)=oref.setPathToParent(VistaSite.VistaSiteNamespace,VistaFileNumber,VistaFieldNumber)
	Set $Bit(BitFlag,7)=oref.setSubFileNumber(VistaSite.VistaSiteNamespace,VistaFileNumber,VistaFieldNumber)
	Set $Bit(BitFlag,8)=oref.setSubFileConstant(VistaSite.VistaSiteNamespace,VistaFileNumber,VistaFieldNumber)
	Set $Bit(BitFlag,9)=oref.setGlobalPiece(VistaSite.VistaSiteNamespace,VistaFileNumber,VistaFieldNumber)
	Set $Bit(BitFlag,10)=oref.setParentVistaFile(VistaSite.VistaSiteNamespace,VistaFileNumber,VistaFieldNumber)
	Set $Bit(BitFlag,11)=oref.setGlobalNode(VistaSite.VistaSiteNamespace,VistaFileNumber,VistaFieldNumber)
	Set $Bit(BitFlag,12)=oref.setPointedToFileNumber(VistaSite.VistaSiteNamespace,VistaFileNumber,VistaFieldNumber)
	
	If $BitFind(BitFlag,1) {
		// Something changed.
		Set oref.VistaEditDate=$ZDateTime($H,3)
		Set Status=oref.%Save()
	}
	DO oref.%Close()
	Quit Status
}

Method setVistaFieldName(NS As %String, VistaFileNumber As %String, VistaFieldNumber As %String) As %Integer
{
	Set Flag=0
	Set VistaFieldName=$Piece($Get(^|NS|DD(VistaFileNumber,VistaFieldNumber,0)),"^",1)
	If ..VistaFieldName'=VistaFieldName {
		Set ..VistaFieldName=VistaFieldName
		Set Flag=1
	}
	Quit Flag
}

Method setVistaFieldType(NS As %String, VistaFileNumber As %String, VistaFieldNumber As %String) As %Integer
{
	Set Flag=0
	Set VistaFieldType=$Piece($Get(^|NS|DD(VistaFileNumber,VistaFieldNumber,0)),"^",2)
	If +VistaFieldType>0 {
		Set VistaFieldType="SubFile"
	} ElseIf VistaFieldType["C" {
		Set VistaFieldType="Computed"
	} ElseIf VistaFieldType["D" {
		Set VistaFieldType="Date"
	} ElseIf VistaFieldType["V" {
		Set VistaFieldType="VariablePointer"
	} ElseIf VistaFieldType["N" {
		Set VistaFieldType="Numeric"
	} ElseIf VistaFieldType["S" {
		Set VistaFieldType="SetOfCodes"
	} ElseIf VistaFieldType["P" {
		Set VistaFieldType="Pointer"
	} ElseIf VistaFieldType["W" {
		Set VistaFieldType="WordProcessing"
	} Else {
		Set VistaFieldType="FreeText"
	}
	
	If ..VistaFieldType'=VistaFieldType {
		Set ..VistaFieldType=VistaFieldType
		Set Flag=1
	}
	Quit Flag
}

Method setVistaFieldDescription(NS As %String, VistaFileNumber As %String, VistaFieldNumber As %String) As %Integer
{
	Set Flag=0
	Set VistaFieldDescription=""
	Set LineIEN=$Order(^|NS|DD(VistaFileNumber,VistaFieldNumber,21,0))
	While +LineIEN {
		Set VistaFieldDescription=VistaFieldDescription_$Get(^|NS|DD(VistaFileNumber,VistaFieldNumber,21,LineIEN,0))_$C(13)
		Set LineIEN=$Order(^|NS|DD(VistaFileNumber,VistaFieldNumber,"21",LineIEN))
	}
	
	If $Length(VistaFieldDescription)>8000 {
		Set VistaFieldDescription=$Extract(VistaFieldDescription,1,8000)
	}
	
	If ..VistaFieldDescription'=VistaFieldDescription {
		Set ..VistaFieldDescription=VistaFieldDescription
		Set Flag=1
	}
	Quit Flag
}

Method setVistaFieldCodes(NS As %String, VistaFileNumber As %String, VistaFieldNumber As %String) As %Integer
{
	Set Flag=0
	Set VistaFieldCodes=$Piece($Get(^|NS|DD(VistaFileNumber,VistaFieldNumber,0)),"^",3)
	If ..VistaFieldCodes'=VistaFieldCodes {
		Set ..VistaFieldCodes=VistaFieldCodes
		Set Flag=1
	}
	Quit Flag
}

Method setPathToParent(NS As %String, VistaFileNumber As %String, VistaFieldNumber As %String) As %Integer
{
	Set Flag=0
    Set PathToParent=VistaFileNumber
    Set Parent=$Get(^|NS|DD(VistaFileNumber,0,"UP"))
    While +Parent {
    	Set PathToParent=Parent_";"_PathToParent
    	Set Parent=$Get(^|NS|DD(Parent,0,"UP"))
    }
    Set:PathToParent=VistaFileNumber PathToParent=""
	If ..PathToParent'=PathToParent {
		Set ..PathToParent=PathToParent
		Set Flag=1
	}
	Quit Flag
}

Method setSubFileNumber(NS As %String, VistaFileNumber As %String, VistaFieldNumber As %String) As %Integer
{
	Set Flag=0
	Set SubFileNumber=+$Piece($Get(^|NS|DD(VistaFileNumber,VistaFieldNumber,0)),"^",2)
	Quit:'+SubFileNumber Flag
	
	If ..SubFileNumber'=SubFileNumber {
		Set ..SubFileNumber=SubFileNumber
		Set Flag=1
	}
	Quit Flag
}

Method setSubFileConstant(NS As %String, VistaFileNumber As %String, VistaFieldNumber As %String) As %Integer
{
	Set Flag=0
	Quit:'+..SubFileNumber Flag
	Set SubFileConstant=$Piece($Piece($Get(^|NS|DD(VistaFileNumber,VistaFieldNumber,0)),"^",4),";",1)
	
	Set:'+SubFileConstant SubFileConstant=""""_SubFileConstant_""""
	
	If ..SubFileConstant'=SubFileConstant {
		Set ..SubFileConstant=SubFileConstant
		Set Flag=1
	}
	Quit Flag
}

Method setParentVistaFile(NS As %String, VistaFileNumber As %String, VistaFieldNumber As %String) As %Integer
{
	Set Flag=0
	Quit:..PathToParent']"" Flag
	
	Set ParentVistaFileNumber=$Piece(..PathToParent,";",1)
	Quit:'+ParentVistaFileNumber Flag
	
	Set id=..VistaSite.Sta3n_"||"_ParentVistaFileNumber
	
	Set ParentVistaFile=##class(Dim.VistaFilev001).%OpenId(id,4)
	Quit:'$IsObject(ParentVistaFile) Flag
	
	If ..ParentVistaFile'=ParentVistaFile {
		Set ..ParentVistaFile=ParentVistaFile
		Set Flag=1
	}
	Quit Flag
}

Method setGlobalPiece(NS As %String, VistaFileNumber As %String, VistaFieldNumber As %String) As %Integer
{
	Set Flag=0
	Set GlobalPiece=$Piece($Piece($Get(^|NS|DD(VistaFileNumber,VistaFieldNumber,0)),"^",4),";",2)
	Quit:'+GlobalPiece Flag
	If ..GlobalPiece'=GlobalPiece {
		Set ..GlobalPiece=GlobalPiece
		Set Flag=1
	}
	Quit Flag
}

Method setGlobalNode(NS As %String, VistaFileNumber As %String, VistaFieldNumber As %String) As %Integer
{
	Set Flag=0
	Set Global=$Get(^|NS|DIC(VistaFileNumber,0,"GL"))
	Set GlobalNode=$Piece($Piece($Get(^|NS|DD(VistaFileNumber,VistaFieldNumber,0)),"^",4),";",1)
	
	If Global]"" {
		Set GlobalNode=Global_"D0,"_GlobalNode_")"
	} ElseIf ..PathToParent]"" {
		Set Global=$Get(^|NS|DIC($Piece(..PathToParent,";",1),0,"GL"))_"D0,"
		For i=2:1 {
			Quit:$Piece(..PathToParent,";",i)=""
			Set FileNumber=$Piece(..PathToParent,";",i)
			Set ParentFile=$Piece(..PathToParent,";",i-1)
			Set ParentField=$Order(^|NS|DD(ParentFile,"SB",FileNumber,0))
			If ParentField]"" {
				Set Constant=$Piece($Piece($Get(^|NS|DD(ParentFile,ParentField,0)),"^",4),";",1)
			} Else {
				Set Constant="ZZZ"
			}
			Set:'+Constant Constant=""""_Constant_""""
			Set Global=Global_Constant_",D"_(i-1)_","
		}
		Set GlobalNode=Global_GlobalNode_")"
	}
	Quit:(GlobalNode'["^")!(GlobalNode[",""ZZZ"",") Flag
	If ..GlobalNode'=GlobalNode {
		Set ..GlobalNode=GlobalNode
		Set Flag=1
	}
	Quit Flag
}

Method setPointedToFileNumber(NS As %String, VistaFileNumber As %String, VistaFieldNumber As %String) As %Integer
{
	Set Flag=0
	Quit:..VistaFieldType'="Pointer" Flag
	
	Set PointedToFileNumber=+$Piece($Piece($Get(^|NS|DD(VistaFileNumber,VistaFieldNumber,0)),"^",2),"P",2)
	Quit:'+PointedToFileNumber Flag
	
	If ..PointedToFileNumber'=PointedToFileNumber {
		Set ..PointedToFileNumber=PointedToFileNumber
		Set Flag=1
	}
	Quit Flag
}

Storage Default
{
<Data name="VistaFieldv001DefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>VistaFieldName</Value>
</Value>
<Value name="3">
<Value>VistaFieldType</Value>
</Value>
<Value name="4">
<Value>VistaFieldCodes</Value>
</Value>
<Value name="5">
<Value>PathToParent</Value>
</Value>
<Value name="6">
<Value>ParentVistaFile</Value>
</Value>
<Value name="7">
<Value>GlobalNode</Value>
</Value>
<Value name="8">
<Value>GlobalPiece</Value>
</Value>
<Value name="9">
<Value>PointedToFileNumber</Value>
</Value>
<Value name="10">
<Value>SubFileNumber</Value>
</Value>
<Value name="11">
<Value>SubFileConstant</Value>
</Value>
<Value name="12">
<Value>VistaFieldDescription</Value>
</Value>
<Value name="13">
<Value>OpCode</Value>
</Value>
<Value name="14">
<Value>VistaCreateDate</Value>
</Value>
<Value name="15">
<Value>VistaEditDate</Value>
</Value>
</Data>
<DataLocation>^Dim.VistaFieldv001D</DataLocation>
<DefaultData>VistaFieldv001DefaultData</DefaultData>
<IdLocation>^Dim.VistaFieldv001D</IdLocation>
<IndexLocation>^Dim.VistaFieldv001I</IndexLocation>
<StreamLocation>^Dim.VistaFieldv001S</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
