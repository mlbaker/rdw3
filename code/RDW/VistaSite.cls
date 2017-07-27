Class RDW.VistaSite Extends (%Persistent, %XML.Adaptor)
{

Property Sta3n As %Integer;

Property Sta3a As %String;

Property SiteName As %String;

Property VISN As %Integer;

Property Server As RDW.Server;

Property Active As %Boolean;

Property VistaSiteNamespace As %String;

Property PopulateDW As %Boolean;

Property LoadGlobals As %Boolean;

Index MainIndex On Sta3n [ IdKey, PrimaryKey, Unique ];

ClassMethod Initialize()
{
	Do ..%KillExtent()
	
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(517,'bec','Beckley WV VAMC',6,6,1,'bec',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(558,'dur','Durham NC VAMC',6,6,1,'dur',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(565,'fnc','Fayetteville NC VAMC',6,6,1,'fnc',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(590,'ham','Hampton VA VAMC',6,6,1,'ham',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(637,'ash','Asheville NC VAMC',6,6,1,'ash',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(652,'ric','Richmond VA VAMC',6,6,1,'ric',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(658,'sam','Salem VA VAMC',6,6,1,'sam',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(659,'sby','Salisbury NC VAMC',6,6,1,'sby',0,0))
	
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(508,'atg','Atlanta GA VAMC',7,7,1,'atg',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(509,'aug','Augusta GA VAMC',7,7,1,'aug',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(521,'bir','Birmingham AL VAMC',7,7,1,'bir',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(534,'cha','Charleston SC VAMC',7,7,1,'cha',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(544,'cms','Columbia SC VAMC',7,7,1,'cms',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(557,'dub','Dublin GA VAMC',7,7,1,'dub',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(619,'cav','Central Alabama VAMC',7,7,1,'cav',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(679,'tua','Tuscaloosa AL VAMC',7,7,1,'tua',0,0))
	
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(516,'bay','Bay Pines FL VAMC',8,8,1,'bay',1,1))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(673,'tam','Tampa (Haley) FL VAMC',8,8,1,'tam',1,1))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(672,'saj','San Juan PR VAMC',8,8,1,'saj',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(546,'mia','Miami FL VAMC',8,88,1,'mia',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(548,'wpb','West Palm Beach FL  VAMC',8,88,1,'wpb',1,1))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(573,'nfl','North Florida (Gainesville) VAMC',8,88,1,'nfl',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(675,'orl','Orlando FL VAMC',8,88,1,'orl',0,0))
	
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(581,'hun','Huntington WV VAMC',9,9,1,'hun',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(596,'lex','Lexington KY VAMC',9,9,1,'lex',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(603,'lou','Louisville KY VAMC',9,9,1,'lou',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(614,'mem','Memphis TN VAMC',9,9,1,'mem',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(621,'mou','Mountain Home TN VAMC',9,9,1,'mou',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(626,'tvh','Tennesee Valley (Nasheville TN) VAMC',9,9,1,'tvh',0,0))
	
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(538,'cll','Chillicothe OH VAMC',10,10,1,'cll',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(539,'cin','Cincinatti OH VAMC',10,10,1,'cin',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(541,'cle','Cleveland OH VAMC',10,10,1,'cle',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(552,'day','Dayton OH VAMC',10,10,1,'day',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(757,'cos','Columbus OH VAMC',10,10,1,'cos',0,0))
	
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(506,'ann','Ann Arbor MI VAMC',11,11,1,'ann',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(515,'bac','Battle Creek MI VAMC',11,11,1,'bac',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(550,'dan','Illiana (Danville IL) VAMC',11,11,1,'dan',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(553,'det','Detroit MI VAMC',11,11,1,'det',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(583,'ind','Indianapolis IN VAMC',11,11,1,'ind',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(610,'nin','Northern Indiana (Marion IL) VAMC',11,11,1,'nin',0,0))
	&sql(INSERT INTO RDW.VistaSite(Sta3n,Sta3a,SiteName,VISN,Server,Active,VistaSiteNamespace,PopulateDW,LoadGlobals) VALUES(655,'sag','Saginaw MI VAMC',11,11,1,'sag',0,0))
}

ClassMethod GetSta3nFromSta3a(Sta3a As %String) As %Integer
{
	Set Sta3n=""
	&sql(SELECT Sta3n INTO :Sta3n FROM RDW.VistaSite WHERE Sta3a=:Sta3a)
	Quit Sta3n
}

Storage Default
{
<Data name="VistaSiteDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Sta3n</Value>
</Value>
<Value name="3">
<Value>Sta3a</Value>
</Value>
<Value name="4">
<Value>SiteName</Value>
</Value>
<Value name="5">
<Value>VISN</Value>
</Value>
<Value name="6">
<Value>Server</Value>
</Value>
<Value name="7">
<Value>Active</Value>
</Value>
<Value name="8">
<Value>VistaSiteNamespace</Value>
</Value>
<Value name="9">
<Value>PopulateDW</Value>
</Value>
<Value name="10">
<Value>LoadGlobals</Value>
</Value>
</Data>
<DataLocation>^RDW.VistaSiteD</DataLocation>
<DefaultData>VistaSiteDefaultData</DefaultData>
<IdLocation>^RDW.VistaSiteD</IdLocation>
<IndexLocation>^RDW.VistaSiteI</IndexLocation>
<StreamLocation>^RDW.VistaSiteS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}
