Class PAMPI.PatientInfo extends (%Persistent, %XML.Adaptor) {

	Property PatientID As %Integer;
	
	Property SSN As %String(COLLATION="EXACT");

	Property FullICN As %String(COLLATION="EXACT");
	
	Property VistaSiteList As List Of RDW.VistaSite;
	
	Property PatientList As List Of SPatient.SPatient2v001;

	Property AllergyList As List Of Allergy.Allergy1208v001;

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
	Set sql="SELECT ID As AllergyID, SPatient->ID As SPatientID FROM Allergy.Allergy_120_8_v001"
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
<Value>VistSiteList</Value>
</Value>
<Value name="5">
<Value>PatientList</Value>
</Value>
<Value name="6">
<Value>VistaSiteList</Value>
</Value>
<Value name="7">
<Value>AllergyList</Value>
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