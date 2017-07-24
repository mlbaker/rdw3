Class RDW.CacheInstance Extends %Persistent
{

Property CacheInstanceID As %Integer;

Property Server As RDW.Server;

Property InstanceName As %String;

Property SuperServerPort As %Integer;

Property WebServerPort As %Integer;

Property Active As %Boolean;

Index MainIndex On CacheInstanceID [ IdKey, PrimaryKey, Unique ];

ClassMethod Initialize()
{
	Do ..%KillExtent()
	
	&sql(INSERT INTO RDW.CacheInstance(CacheInstanceID,Server,InstanceName,SuperServerPort,WebServerPort,Active) VALUES(6,6,'HS2017',1972,57772,1))
	&sql(INSERT INTO RDW.CacheInstance(CacheInstanceID,Server,InstanceName,SuperServerPort,WebServerPort,Active) VALUES(7,7,'HS2017',1972,57772,1))
	&sql(INSERT INTO RDW.CacheInstance(CacheInstanceID,Server,InstanceName,SuperServerPort,WebServerPort,Active) VALUES(8,8,'HS2017',1972,57772,1))
	&sql(INSERT INTO RDW.CacheInstance(CacheInstanceID,Server,InstanceName,SuperServerPort,WebServerPort,Active) VALUES(9,9,'HS2017',1972,57772,1))
	&sql(INSERT INTO RDW.CacheInstance(CacheInstanceID,Server,InstanceName,SuperServerPort,WebServerPort,Active) VALUES(10,10,'HS2017',1972,57772,1))
	&sql(INSERT INTO RDW.CacheInstance(CacheInstanceID,Server,InstanceName,SuperServerPort,WebServerPort,Active) VALUES(11,11,'HS2017',1972,57772,1))
	&sql(INSERT INTO RDW.CacheInstance(CacheInstanceID,Server,InstanceName,SuperServerPort,WebServerPort,Active) VALUES(88,88,'HS2017',1972,57772,1))
}

ClassMethod GetInstanceId() {
	Set svrId=##class(RDW.Server).GetServerId()
	Set id=""
	&sql(SELECT ID INTO :id FROM RDW.CacheInstance WHERE Server=:svrId)
	Quit id
}

Storage Default
{
<Data name="CacheInstanceDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>DockerContainer</Value>
</Value>
<Value name="3">
<Value>InstanceName</Value>
</Value>
<Value name="4">
<Value>SuperServerPort</Value>
</Value>
<Value name="5">
<Value>WebServerPort</Value>
</Value>
<Value name="6">
<Value>Active</Value>
</Value>
<Value name="7">
<Value>Server</Value>
</Value>
</Data>
<DataLocation>^RDW.CacheInstanceD</DataLocation>
<DefaultData>CacheInstanceDefaultData</DefaultData>
<IdLocation>^RDW.CacheInstanceD</IdLocation>
<IndexLocation>^RDW.CacheInstanceI</IndexLocation>
<StreamLocation>^RDW.CacheInstanceS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
