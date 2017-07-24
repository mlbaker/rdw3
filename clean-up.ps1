function Remove-Databases()
{
    Remove-Item .\databases -Force -Recurse
    Remove-Item .\client -Force -Recurse
    Remove-Item .\journals -Force -Recurse
}
docker-compose down
Remove-Databases