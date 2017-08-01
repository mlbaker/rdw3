Class RDW.Tasks extends %RegisteredObject {

ClassMethod Initialize() {
	
}
ClassMethod AddJFileTask() As %String
{
	Set task=##Class(%SYS.Task).%New()
	Set task.Name="AddJournalFiles"
	Set task.Description="Add New Journal Files to list"
	Set task.NameSpace="RDW"  // Namespace the task will run in
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
	Set task.NameSpace="RDW"  // Namespace the task will run in
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