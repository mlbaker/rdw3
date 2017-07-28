Class PAMPI.PatientInfo extends (%Persistent, %XML.Adaptor) {

	Property PatientID As %Integer;
	
	Property SSN As %String(COLLATION="EXACT");

	Property FullICN As %String(COLLATION="EXACT");
	
	Property VistaSiteList As List Of RDW.VistaSite;
	
	Property PatientList As List Of SPatient.SPatient2v001;

	Property AllergyList As List Of Allergy.Allergy1208v001;

	Property RxOutpatOriginalFillList AS List Of RxOut.RxOutpatOriginalFill52v001;

	Property RxOutpatReFillList As List Of RxOut.RxOutpatReFill521v001;

	Property RxOutpatPartialFillList As List Of RxOut.RxOutpatPartialFill522v001;

	Index PatientIDIndex On PatientID [IdKey, PrimaryKey, Unique];

	Index SSNIndex On SSN;

	Index FullICNIndex on FullICN;

ClassMethod Initialize()
{
	//Just be here.
}
ClassMethod PopulateFromCDW()
{
	Do ..%KillExtent()
	
	Do ..InitializePatientList()
	Do ..InitializePatientAllergyList()
	Do ..InitializePatientRxOriginalList()
	Do ..InitializePatientRxReFillList()
	Do ..InitializePatientRxPartialFillList()
		
}

ClassMethod UpdatePatientList(pt As SPatient.SPatient2v001) As %String
{
	Set Status=1
	Set SSN=pt.SSN
	Set PatientID=0
	&sql(SELECT PatientID INTO :PatientID FROM PAMPI.PatientInfo WHERE SSN=:SSN)
	If +PatientID=0 {
		&sql(SELECT MAX(PatientID) INTO :PatientID FROM PAMPI.PatientInfo)
		Set oref=..%New()
		Set oref.PatientID=PatientID+1
		Set oref.SSN=pt.SSN
		Set oref.FullICN=pt.FullICN
		Do oref.PatientList.Insert(pt)
		Do oref.VistaSiteList.Insert(pt.VistaSite)
		Set Status=oref.%Save()
	} Else {
		Set oref=..%OpenId(PatientID,4)
		If '(oref.PatientList.FindObjectId(pt.%Id())) {
			Set Status=oref.PatientList.Insert(pt)
			Do oref.VistaSiteList.Insert(pt.VistaSite)
			Set Status=oref.%Save()
		}
	}
	Quit Status
}

ClassMethod InitializePatientList()
{
	Set sql="SELECT ID FROM SPatient.SPatient_2_v001"
	Set tStatement=##class(%SQL.Statement).%New()
	Set Status=tStatement.%Prepare(sql)
	Set rSet=tStatement.%Execute()
	While rSet.%Next() {
		Set oPat=##class(SPatient.SPatient2v001).%OpenId(rSet.ID,4)
		Set Status=..UpdatePatientList(oPat)
		Kill oPat
	}
	Do tStatement.%Close()
	Do rSet.%Close()
}

ClassMethod InitializePatientAllergyList()
{
	Set sql="SELECT ID As AllergyID, SPatient->ID As SPatientID FROM Allergy.Allergy_120_8_v001 WHERE SPatient IS NOT NULL"
	Set tStatement=##class(%SQL.Statement).%New()
	Set Status=tStatement.%Prepare(sql)
	Set rSet=tStatement.%Execute()
	While rSet.%Next() {
		Set oPat=##class(SPatient.SPatient2v001).%OpenId(rSet.SPatientID)
		Set oAllergy=##class(Allergy.Allergy1208v001).%OpenId(rSet.AllergyID)
		Set Status=..UpdatePatientAllergyList(oPat,oAllergy)
		Kill oPat
		Kill oAllergy
	}
	Do tStatement.%Close()
	Do rSet.%Close()
}


ClassMethod UpdatePatientAllergyList(pt As SPatient.SPatient2v001, allergy As Allergy.Allergy1208v001) As %String
{
	Set Status=1
	Set SSN=pt.SSN
	Set PatientID=0
	&sql(SELECT PatientID INTO :PatientID FROM PAMPI.PatientInfo WHERE SSN=:SSN)
	If +PatientID=0 {
		&sql(SELECT MAX(PatientID) INTO :PatientID FROM PAMPI.PatientInfo)
		Set oref=..%New()
		Set oref.PatientID=PatientID+1
		Set oref.SSN=pt.SSN
		Set oref.FullICN=pt.FullICN
		Do oref.PatientList.Insert(pt)
		Do oref.VistaSiteList.Insert(pt.VistaSite)
		Set Status=oref.%Save()
	} Else {
		Set oref=..%OpenId(PatientID,4)
		If '(oref.PatientList.FindObjectId(pt.%Id())) {
			Do oref.PatientList.Insert(pt)
			Do oref.VistaSiteList.Insert(pt.VistaSite)
			Set Status=oref.%Save()
		}
	}
	Quit:'oref 0
	If '(oref.AllergyList.FindObjectId(allergy.%Id())) {
		Do oref.AllergyList.Insert(allergy)
		Set Status=oref.%Save()
	}
	Quit Status
}


ClassMethod InitializePatientRxOriginalList()
{
	Set sql="SELECT ID As RxId, SPatient->ID As SPatientID FROM RxOut.RxOutpatOriginalFill_52_v001 WHERE SPatient IS NOT NULL"
	Set tStatement=##class(%SQL.Statement).%New()
	Set Status=tStatement.%Prepare(sql)
	Set rSet=tStatement.%Execute()
	While rSet.%Next() {
		Set oPat=##class(SPatient.SPatient2v001).%OpenId(rSet.SPatientID)
		Set oRx=##class(RxOut.RxOutpatOriginalFill52v001).%OpenId(rSet.RxId)
		Set Status=..UpdatePatientRxOriginalList(oPat,oRx)
		Kill oPat
		Kill oRx
	}
	Do tStatement.%Close()
	Do rSet.%Close()
}


ClassMethod UpdatePatientRxOriginalList(pt As SPatient.SPatient2v001, rx As RxOut.RxOutpatOriginalFill52v001) As %String
{
	Set Status=1
	Set SSN=pt.SSN
	Set PatientID=0
	&sql(SELECT PatientID INTO :PatientID FROM PAMPI.PatientInfo WHERE SSN=:SSN)
	If +PatientID=0 {
		&sql(SELECT MAX(PatientID) INTO :PatientID FROM PAMPI.PatientInfo)
		Set oref=..%New()
		Set oref.PatientID=PatientID+1
		Set oref.SSN=pt.SSN
		Set oref.FullICN=pt.FullICN
		Do oref.PatientList.Insert(pt)
		Do oref.VistaSiteList.Insert(pt.VistaSite)
		Set Status=oref.%Save()
	} Else {
		Set oref=..%OpenId(PatientID,4)
		If '(oref.PatientList.FindObjectId(pt.%Id())) {
			Do oref.PatientList.Insert(pt)
			Do oref.VistaSiteList.Insert(pt.VistaSite)
			Set Status=oref.%Save()
		}
	}
	Quit:'oref 0
	If '(oref.RxOutpatOriginalFillList.FindObjectId(rx.%Id())) {
		Do oref.RxOutpatOriginalFillList.Insert(rx)
		Set Status=oref.%Save()
	}
	Quit Status
}

ClassMethod InitializePatientRxReFillList()
{
	Set sql="SELECT ID As RxId, SPatient->ID As SPatientID FROM RxOut.RxOutpatReFill_52_1_v001  WHERE SPatient IS NOT NULL"
	Set tStatement=##class(%SQL.Statement).%New()
	Set Status=tStatement.%Prepare(sql)
	Set rSet=tStatement.%Execute()
	While rSet.%Next() {
		Set oPat=##class(SPatient.SPatient2v001).%OpenId(rSet.SPatientID)
		Set oRx=##class(RxOut.RxOutpatReFill521v001).%OpenId(rSet.RxId)
		Set Status=..UpdatePatientRxReFillList(oPat,oRx)
		Kill oPat
		Kill oRx
	}
	Do tStatement.%Close()
	Do rSet.%Close()
}


ClassMethod UpdatePatientRxReFillList(pt As SPatient.SPatient2v001, rx As RxOut.RxOutpatReFill521v001) As %String
{
	Set Status=1
	Set SSN=pt.SSN
	Set PatientID=0
	&sql(SELECT PatientID INTO :PatientID FROM PAMPI.PatientInfo WHERE SSN=:SSN)
	If +PatientID=0 {
		&sql(SELECT MAX(PatientID) INTO :PatientID FROM PAMPI.PatientInfo)
		Set oref=..%New()
		Set oref.PatientID=PatientID+1
		Set oref.SSN=pt.SSN
		Set oref.FullICN=pt.FullICN
		Do oref.PatientList.Insert(pt)
		Do oref.VistaSiteList.Insert(pt.VistaSite)
		Set Status=oref.%Save()
	} Else {
		Set oref=..%OpenId(PatientID,4)
		If '(oref.PatientList.FindObjectId(pt.%Id())) {
			Do oref.PatientList.Insert(pt)
			Do oref.VistaSiteList.Insert(pt.VistaSite)
			Set Status=oref.%Save()
		}
	}
	Quit:'oref 0
	If '(oref.RxOutpatReFillList.FindObjectId(rx.%Id())) {
		Do oref.RxOutpatReFillList.Insert(rx)
		Set Status=oref.%Save()
	}
	Quit Status
}

ClassMethod InitializePatientRxPartialFillList()
{
	Set sql="SELECT ID As RxId, SPatient->ID As SPatientID FROM RxOut.RxOutpatPartialFill_52_2_v001 WHERE SPatient IS NOT NULL"
	Set tStatement=##class(%SQL.Statement).%New()
	Set Status=tStatement.%Prepare(sql)
	Set rSet=tStatement.%Execute()
	While rSet.%Next() {
		Set oPat=##class(SPatient.SPatient2v001).%OpenId(rSet.SPatientID)
		Set oRx=##class(RxOut.RxOutpatPartialFill522v001).%OpenId(rSet.RxId)
		Set Status=..UpdatePatientRxPartialFillList(oPat,oRx)
		Kill oPat
		Kill oRx
	}
	Do tStatement.%Close()
	Do rSet.%Close()
}


ClassMethod UpdatePatientRxPartialFillList(pt As SPatient.SPatient2v001, rx As RxOut.RxOutpatPartialFill522v001) As %String
{
	Set Status=1
	Set SSN=pt.SSN
	Set PatientID=0
	&sql(SELECT PatientID INTO :PatientID FROM PAMPI.PatientInfo WHERE SSN=:SSN)
	If +PatientID=0 {
		&sql(SELECT MAX(PatientID) INTO :PatientID FROM PAMPI.PatientInfo)
		Set oref=..%New()
		Set oref.PatientID=PatientID+1
		Set oref.SSN=pt.SSN
		Set oref.FullICN=pt.FullICN
		Do oref.PatientList.Insert(pt)
		Do oref.VistaSiteList.Insert(pt.VistaSite)
		Set Status=oref.%Save()
	} Else {
		Set oref=..%OpenId(PatientID,4)
		If '(oref.PatientList.FindObjectId(pt.%Id())) {
			Do oref.PatientList.Insert(pt)
			Do oref.VistaSiteList.Insert(pt.VistaSite)
			Set Status=oref.%Save()
		}
	}
	Quit:'oref 0
	If '(oref.RxOutpatPartialFillList.FindObjectId(rx.%Id())) {
		Do oref.RxOutpatPartialFillList.Insert(rx)
		Set Status=oref.%Save()
	}
	Quit Status
}



Storage Default
{
<Data name="PatientInfoDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>SSN</Value>
</Value>
<Value name="3">
<Value>FullICN</Value>
</Value>
<Value name="4">
<Value>VistaSiteList</Value>
</Value>
<Value name="5">
<Value>PatientList</Value>
</Value>
<Value name="6">
<Value>AllergyList</Value>
</Value>
<Value name="7">
<Value>RxOutpatOriginalFillList</Value>
</Value>
<Value name="8">
<Value>RxOutpatReFillList</Value>
</Value>
<Value name="9">
<Value>RxOutpatPartialFillList</Value>
</Value>
</Data>
<DataLocation>^PAMPI.PatientInfoD</DataLocation>
<DefaultData>PatientInfoDefaultData</DefaultData>
<IdLocation>^PAMPI.PatientInfoD</IdLocation>
<IndexLocation>^PAMPI.PatientInfoI</IndexLocation>
<StreamLocation>^PAMPI.PatientInfoS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}