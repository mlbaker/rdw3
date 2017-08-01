function Expand-ZIPFile($file, $destination)
{
    $shell = new-object -com shell.application
    $zip = $shell.NameSpace($file)
    foreach($item in $zip.items())
    {
        $shell.Namespace($destination).copyhere($item)
    }
}

function Create-RDW-Directories()
{
    mkdir .\databases\rdw
    mkdir .\client
    mkdir .\client\globals
    mkdir .\client\routines
    mkdir .\journals
}


Create-RDW-Directories

[string]$dir = Get-Location

$a = new-object -comobject wscript.shell 
$intAnswer1 = $a.popup("Do you want to extract Globals?", ` 
0,"Extracting Globals",4) 
If ($intAnswer1 -eq 6) { 
    Expand-ZIPFile –File “$dir\VistaGlobals.zip” –Destination "$dir\client\globals"
} 

$a = new-object -comobject wscript.shell 
$intAnswer2 = $a.popup("Do you want to extract Routines?", ` 
0,"Extracting Globals",4) 
If ($intAnswer2 -eq 6) { 
    Expand-ZIPFile –File “$dir\VistaRoutines.zip” –Destination "$dir\client\routines"
} 

$a = new-object -comobject wscript.shell 
$intAnswer3 = $a.popup("Do you want to extract Databases?", ` 
0,"Extracting Globals",4) 
#If (($intAnswer2 -eq 6)-and($intAnswer1 -ne 6)) {
 If ($intAnswer3 -eq 6) {
    Expand-ZIPFile –File “$dir\databases.zip” –Destination "$dir"
} 

docker-compose up -d rdw

$rdwUp = $dir + '\databases\rdw\cache.lck'
While (1 -eq 1) {
    IF (Test-Path $rdwUp) {
        #file exists. break loop
        break
    }
    #sleep for 10 seconds, then check again
    Start-Sleep -s 10
}

$rdwUp = $dir + '\client\mountPoints.sh'
While (1 -eq 1) {
    IF (Test-Path $rdwUp) {
        #file exists. break loop
        break
    }
    #sleep for 10 seconds, then check again
    Start-Sleep -s 1
}

#If ($intAnswer3 -ne 6) { 
	docker exec -it rdw /scripts/mountPoints.sh
	docker exec -it rdw /scripts/dbDirectory.sh
#}

Start-Sleep -s 10
docker-compose up -d cachev08
Start-Sleep -s 60
docker-compose up -d cachev88