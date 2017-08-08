function Expand-ZIPFile($file, $destination)
{
    $shell = new-object -com shell.application
    $zip = $shell.NameSpace($file)
    foreach($item in $zip.items())
    {
        $shell.Namespace($destination).copyhere($item)
    }
}

#function Create-RDW-Directories()
#{
#    mkdir .\databases\rdw
#    mkdir .\client
#    mkdir .\journals
#}


#Create-RDW-Directories

[string]$dir = Get-Location

#$a = new-object -comobject wscript.shell 
#$intAnswer = $a.popup("Do you want to extract Databases?", ` 
#0,"Extracting Databases",4) 
# If ($intAnswer -eq 6) {
#    Expand-ZIPFile –File “$dir\databases.zip” –Destination "$dir"
#} 

docker-compose up -d rdw

$rdwUp = $dir + '\databases\rdw\rdwv4\cache.lck'
While (1 -eq 1) {
    IF (Test-Path $rdwUp) {
        #file exists. break loop
        break
    }
    #sleep for 10 seconds, then check again
    Start-Sleep -s 10
}

#$rdwUp = $dir + '\client\mountPoints.sh'
#While (1 -eq 1) {
#    IF (Test-Path $rdwUp) {
#        #file exists. break loop
#        break
#    }
#    #sleep for 10 seconds, then check again
#    Start-Sleep -s 1
#}


#If ($intAnswer3 -ne 6) { 
#docker exec -it rdw /scripts/mountPoints.sh
#docker exec -it rdw /scripts/dbDirectory.sh
#}

#Start-Sleep -s 10
docker-compose up -d cachev06
docker-compose up -d cachev07
docker-compose up -d cachev08
docker-compose up -d cachev09
docker-compose up -d cachev10
docker-compose up -d cachev11
docker-compose up -d cachev88