Class RDW.GlobalsToWatch Extends %Persistent
{

Property GlobalName As %String(COLLATION = "EXACT");

Property ClassName As %String(COLLATION = "EXACT");

Property NumberOfSubscripts As %Integer;

Property PrimaryKeys As %String;

Property SubscriptCompare As %String;

Property FirstSubscript As %String;

Index GlobalNameIndex On GlobalName;

ClassMethod Initialize()
{
	Do ..%KillExtent()
	&sql(INSERT INTO RDW.GlobalsToWatch(GlobalName,ClassName,NumberOfSubscripts,PrimaryKeys,SubscriptCompare,FirstSubscript) VALUES('^DPT','SPatient.SPatient2v001',2,'1',NULL,NULL))
	&sql(INSERT INTO RDW.GlobalsToWatch(GlobalName,ClassName,NumberOfSubscripts,PrimaryKeys,SubscriptCompare,FirstSubscript) VALUES('^DIC','Dim.VistaFilev001',2,'1','2:"0"',NULL))
	&sql(INSERT INTO RDW.GlobalsToWatch(GlobalName,ClassName,NumberOfSubscripts,PrimaryKeys,SubscriptCompare,FirstSubscript) VALUES('^DD','Dim.VistaFieldv001',3,'1,2,','3:"0"',NULL))
	&sql(INSERT INTO RDW.GlobalsToWatch(GlobalName,ClassName,NumberOfSubscripts,PrimaryKeys,SubscriptCompare,FirstSubscript) VALUES('^PSRX','RxOut.RxOutpatOriginalFill52v001',2,'1',NULL,NULL))
	&sql(INSERT INTO RDW.GlobalsToWatch(GlobalName,ClassName,NumberOfSubscripts,PrimaryKeys,SubscriptCompare,FirstSubscript) VALUES('^PSRX','RxOut.RxOutpatReFill521v001',4,'1,3','3:"1"',NULL))
	&sql(INSERT INTO RDW.GlobalsToWatch(GlobalName,ClassName,NumberOfSubscripts,PrimaryKeys,SubscriptCompare,FirstSubscript) VALUES('^PSRX','RxOut.RxOutpatPartialFill522v001',4,'1,3','3:"P"',NULL))
	&sql(INSERT INTO RDW.GlobalsToWatch(GlobalName,ClassName,NumberOfSubscripts,PrimaryKeys,SubscriptCompare,FirstSubscript) VALUES('^GMR','Allergy.Allergy1208v001',3,'2',NULL,'120.8'))
}

Storage Default
{
<Data name="GlobalsToWatchDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>GlobalName</Value>
</Value>
<Value name="3">
<Value>ClassName</Value>
</Value>
<Value name="4">
<Value>NumberOfSubscripts</Value>
</Value>
<Value name="5">
<Value>PrimaryKeys</Value>
</Value>
<Value name="6">
<Value>SubScriptCompare</Value>
</Value>
<Value name="7">
<Value>FirstSubscript</Value>
</Value>
<Value name="8">
<Value>SubscriptCompare</Value>
</Value>
</Data>
<DataLocation>^RDW.GlobalsToWatchD</DataLocation>
<DefaultData>GlobalsToWatchDefaultData</DefaultData>
<IdLocation>^RDW.GlobalsToWatchD</IdLocation>
<IndexLocation>^RDW.GlobalsToWatchI</IndexLocation>
<StreamLocation>^RDW.GlobalsToWatchS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
