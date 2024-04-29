# Set file and folder path for SSMS installer .exe
$folderpath="c:\windows\temp"
$filepath="$folderpath\SSMS-Setup-ENU.exe"
 
#If SSMS not present, download
if (!(Test-Path $filepath)){
write-host "Downloading SQL Server 20.1 SSMS..."
$URL = "https://aka.ms/ssmsfullsetup"
$clnt = New-Object System.Net.WebClient
$clnt.DownloadFile($url,$filepath)
Write-Host "SSMS installer download complete" -ForegroundColor Green
 
}
else {
 
write-host "Located the SQL SSMS Installer binaries, moving on to install..."
}
 
# start the SSMS installer
write-host "Beginning SSMS 20.1 install..." -nonewline
$Parms = " /Install /Quiet /Norestart /Logs log.txt"
$Prms = $Parms.Split(" ")
& "$filepath" $Prms | Out-Null
Write-Host "SSMS installation complete" -ForegroundColor Green
