$miracleThunderPath = "$PSScriptRoot\Miracle_Thunder.exe"
Set-Date 20/06/2020
Start-Process $miracleThunderPath
$processName = "Miracle_Thunder"
do {
    Start-Sleep -Seconds 1 # Check every 5 seconds
} while (Get-Process $processName -ErrorAction SilentlyContinue)
Stop-Service w32time -Force
Start-Service w32time
w32tm /config /manualpeerlist:"time.windows.com" /syncfromflags:MANUAL /reliable:YES /update
w32tm /resync
exit 0
