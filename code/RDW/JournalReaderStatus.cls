Class RDW.JournalReaderStatus Extends %Persistent
{

Property CacheInstance As RDW.CacheInstance;

Property Status As %String;

ClassMethod Initialize()
{
	Do ..%KillExtent()
	Set sql="SELECT ID FROM RDW.CacheInstance WHERE Active=1"
	Set tStatement=##class(%SQL.Statement).%New()
	Set Status=tStatement.%Prepare(sql)
	Quit:'+Status
	Set rSet=tStatement.%Execute()
	While rSet.%Next() {
		Set id=rSet.ID
		&sql(INSERT INTO JournalReaderStatus(CacheInstance,Status) VALUES(:id,'R'))
	}
	Do rSet.%Close()
	Do tStatement.%Close()
}

ClassMethod GetStatus()
{
	Set insId=##class(RDW.CacheInstance).GetInstanceId()
	Set Status=""
	&sql(SELECT Status INTO :Status FROM RDW.JournalReaderStatus WHERE CacheInstance=:insId)
	Quit Status
}

Storage Default
{
<Data name="JournalReaderStatusDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DockerContainer</Value>
</Value>
<Value name="3">
<Value>Status</Value>
</Value>
<Value name="4">
<Value>CacheInstance</Value>
</Value>
</Data>
<DataLocation>^RDW.JournalReaderStatusD</DataLocation>
<DefaultData>JournalReaderStatusDefaultData</DefaultData>
<IdLocation>^RDW.JournalReaderStatusD</IdLocation>
<IndexLocation>^RDW.JournalReaderStatusI</IndexLocation>
<StreamLocation>^RDW.JournalReaderStatusS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
