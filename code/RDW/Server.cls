Class RDW.Server extends %Persistent 
{

Property ServerID As %Integer;

Property ServerName As %String;

Property Active As %Boolean;

Index MainIndex On ServerID [ IdKey, PrimaryKey, Unique ];

ClassMethod Initialize()
{
	Do ..%KillExtent()
	&sql(INSERT INTO RDW.Server(ServerID,ServerName,Active) VALUES(6,'cachev06',1))
	&sql(INSERT INTO RDW.Server(ServerID,ServerName,Active) VALUES(7,'cachev07',1))
	&sql(INSERT INTO RDW.Server(ServerID,ServerName,Active) VALUES(8,'cachev08',1))
	&sql(INSERT INTO RDW.Server(ServerID,ServerName,Active) VALUES(9,'cachev09',1))
	&sql(INSERT INTO RDW.Server(ServerID,ServerName,Active) VALUES(10,'cachev10',1))
	&sql(INSERT INTO RDW.Server(ServerID,ServerName,Active) VALUES(11,'cachev11',1))
	&sql(INSERT INTO RDW.Server(ServerID,ServerName,Active) VALUES(88,'cachev88',1))
}

ClassMethod GetServerId() As %Integer {
	Set serverName=$Piece($SYSTEM,":",1)
	Set id=""
	&sql(SELECT ID INTO :id FROM RDW.Server WHERE ServerName=:serverName)
	Quit id
}
Storage Default
{
<Data name="ServerDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ServerName</Value>
</Value>
<Value name="3">
<Value>Active</Value>
</Value>
</Data>
<DataLocation>^RDW.ServerD</DataLocation>
<DefaultData>ServerDefaultData</DefaultData>
<IdLocation>^RDW.ServerD</IdLocation>
<IndexLocation>^RDW.ServerI</IndexLocation>
<StreamLocation>^RDW.ServerS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}