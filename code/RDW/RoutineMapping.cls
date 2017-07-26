Class RDW.RoutineMapping Extends %Persistent
{

Property VistaSite As RDW.VistaSite;

Property RoutineName As %String;

Property VistaSiteDatabase As RDW.VistaSiteDatabase;

ClassMethod Initialize()
{
	Do ..%KillExtent()
	Set tStatement=##class(%SQL.Statement).%New()
	Set sql="SELECT ID,VistaSite FROM RDW.VistaSiteDatabase WHERE CacheDatabaseName LIKE '%-rou'"
	Set Status=tStatement.%Prepare(sql)
	Set rSet=tStatement.%Execute()
	While rSet.%Next() {
		Set Sta3n=rSet.%Get("VistaSite")
		Set db=rSet.%Get("ID")
		For routine="%DT*","%RCR","%XU*","%ZIS*","%ZO*","%ZT*"{
			&sql(INSERT INTO RDW.RoutineMapping(VistaSite,RoutineName,VistaSiteDatabase) VALUES(:Sta3n,:routine,:db))
		}
	}
	Do rSet.%Close()
	Do tStatement.%Close()
	Kill rSet
}

Storage Default
{
<Data name="RoutineMappingDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>VistaSite</Value>
</Value>
<Value name="3">
<Value>RoutineName</Value>
</Value>
<Value name="4">
<Value>VistaSiteDatabase</Value>
</Value>
</Data>
<DataLocation>^RDW.RoutineMappingD</DataLocation>
<DefaultData>RoutineMappingDefaultData</DefaultData>
<IdLocation>^RDW.RoutineMappingD</IdLocation>
<IndexLocation>^RDW.RoutineMappingI</IndexLocation>
<StreamLocation>^RDW.RoutineMappingS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
