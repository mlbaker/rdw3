Class RDW.Tasks extends %RegisteredObject {

ClassMethod Initialize() {
	Do ..AddJFileTask()
	Do ..AddJournalReaderTask()
	Do ..AddDataFilerTask()
	Do ..SetupClientJournalDirectory()
}

ClassMethod AddJFileTask() As %String
{
	Set task=##Class(%SYS.Task).%New()
	Set task.Name="AddJournalFiles"
	Set task.Description="Add New Journal Files to list"
	Set task.NameSpace="RDWv4"  // Namespace the task will run in
	Set task.DailyFrequency=task.DailyFrequencyDisplayToLogical("Several")
	Set task.DailyFrequencyTime=0 //minutes
	Set task.DailyIncrement=1  // (every 1 hour or minutes depending on DailyFrequencyTime)
	Set task.DailyStartTime=0
	Set task.DailyEndTime=0
	Set task.Expires=0
	Set task.TaskClass="%SYS.Task.RunLegacyTask"
	Set task.Settings=$lb("ExecuteCode","Do ##class(RDW.JournalFile).AddNewFiles()")
	Set task.StartDate=+$H
	Set task.RunAsUser="_SYSTEM"
	Quit task.%Save()
}

ClassMethod AddJournalReaderTask() As %String
{
	Set task=##Class(%SYS.Task).%New()
	Set task.Name="JournalReader"
	Set task.Description="Run Journal Reader for Instance"
	Set task.NameSpace="RDWv4"  // Namespace the task will run in
	Set task.DailyFrequency=task.DailyFrequencyDisplayToLogical("Several")
	Set task.DailyFrequencyTime=0 //minutes
	Set task.DailyIncrement=1  // (every 1 hour or minutes depending on DailyFrequencyTime)
	Set task.DailyStartTime=0
	Set task.DailyEndTime=0
	Set task.Expires=0
	Set task.TaskClass="%SYS.Task.RunLegacyTask"
	Set task.Settings=$lb("ExecuteCode","Do ##class(RDW.JournalReaderHistory).StartJournalReader()")
	Set task.StartDate=+$H
	Set task.RunAsUser="_SYSTEM"
	Quit task.%Save()
}

ClassMethod AddDataFilerTask() As %String
{
	Set task=##Class(%SYS.Task).%New()
	Set task.Name="DataFiler"
	Set task.Description="Run Data Filers for Instance"
	Set task.NameSpace="RDWv4"  // Namespace the task will run in
	Set task.DailyFrequency=task.DailyFrequencyDisplayToLogical("Several")
	Set task.DailyFrequencyTime=0 //minutes
	Set task.DailyIncrement=1  // (every 1 hour or minutes depending on DailyFrequencyTime)
	Set task.DailyStartTime=0
	Set task.DailyEndTime=0
	Set task.Expires=0
	Set task.TaskClass="%SYS.Task.RunLegacyTask"
	Set task.Settings=$lb("ExecuteCode","Do ##class(RDW.DataFilerHistory).StartDataFiler()")
	Set task.StartDate=+$H
	Set task.RunAsUser="_SYSTEM"
	Quit task.%Save()
}

ClassMethod SetupClientJournalDirectory()
{
	Set NS=$NAMESPACE
	Set cName=$Piece($SYSTEM,":",1)
	Set jDirectory="/cachejrn/v"_$Piece($ZCONVERT(cName,"U"),"V",2)_"/jrn/"
	ZN "%SYS"
	Set Status=##Class(Config.Journal).Get(.Properties)
	Set Properties("CurrentDirectory")=jDirectory
	Set Status=##Class(Config.Journal).Modify(.Properties)
	ZN NS
}

Storage Default
{
<Data name="TasksDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
</Data>
<DataLocation>^RDW.TasksD</DataLocation>
<DefaultData>TasksDefaultData</DefaultData>
<IdLocation>^RDW.TasksD</IdLocation>
<IndexLocation>^RDW.TasksI</IndexLocation>
<StreamLocation>^RDW.TasksS</StreamLocation>
<Type>%Library.CacheStorage</Type>
}

}