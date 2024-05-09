$url = "https://download.microsoft.com/download/d/a/2/da259851-b941-459d-989c-54a18a5d44dd/SQL2019-SSEI-Dev.exe"
$outputPath = "C:\Users\labinf\Downloads\SQL2019-SSEI-Dev.exe"
Invoke-WebRequest -Uri $url -OutFile $outputPath

while (-not (Test-Path $outputPath)) {
    Start-Sleep -Seconds 5  
}

& $outputPath /ACTION=download MEDIAPATH=C:\Users\labinf\Downloads /QUIET /ENU

$setupFilePath = "C:\Users\labinf\Downloads\SQLServer2019-DEV-x64-ESN.exe"
while (-not (Test-Path $setupFilePath)) {
    Start-Sleep -Seconds 5
}

& $setupFilePath /q /x:C:\Users\labinf\Downloads\SQLDEV_2019

Start-Sleep -Seconds 5

$folderPath = "C:\Users\labinf\Downloads\SQLDEV_2019"
if (-not (Test-Path $folderPath)) {
    New-Item -Path $folderPath -ItemType Directory -Force
}

$configFilePath = Join-Path $folderPath "ConfigurationFile.ini"
$configContent = @"
;SQL Server 2019 Configuration File
[OPTIONS]

ACTION="Install"
IACCEPTSQLSERVERLICENSETERMS="True"
IACCEPTPYTHONLICENSETERMS="False"
IACCEPTROPENLICENSETERMS="False"
PID="22222-00000-00000-00000-00000"

QUIET="True"
QUIETSIMPLE="False"
SUPPRESSPRIVACYSTATEMENTNOTICE="False"
SUPPRESSPAIDEDITIONNOTICE="True"
INDICATEPROGRESS="False"

UpdateSource="MU"
UpdateEnabled="False"
USEMICROSOFTUPDATE="False"
HELP="False"

FEATURES=SQLENGINE,CONN,IS,BC
INSTANCENAME="MSSQLSERVER"
INSTANCEID="MSSQLSERVER"
SQLSYSADMINACCOUNTS="DESKTOP-R05GSCQ\labinf"
SAPWD="desired-sa-password"

ENU="False"
SQLMAXDOP="4"
SQLCOLLATION="SQL_Latin1_General_CP1_CI_AS"
SQLSVCINSTANTFILEINIT="True"
SECURITYMODE="SQL"
SQLTEMPDBFILECOUNT="4"
SQLTEMPDBFILESIZE="8"
SQLTEMPDBFILEGROWTH="64"
SQLTEMPDBLOGFILESIZE="8"
SQLTEMPDBLOGFILEGROWTH="64"
TCPENABLED="1"
NPENABLED="1"
USESQLRECOMMENDEDMEMORYLIMITS="True"

SQLSVCSTARTUPTYPE="Automatic"
SQLSVCACCOUNT="NT Service\MSSQLSERVER"
SQLSVCPASSWORD="desired-sa-password"

SQLTELSVCACCT="NT Service\SQLTELEMETRY"
SQLTELSVCSTARTUPTYPE="Automatic"

ISTELSVCSTARTUPTYPE="Automatic"
ISTELSVCACCT="NT Service\SSISTELEMETRY150"

AGTSVCACCOUNT="NT Service\SQLSERVERAGENT"
AGTSVCSTARTUPTYPE="Manual"

ISSVCSTARTUPTYPE="Automatic"
ISSVCACCOUNT="NT Service\MsDtsServer150"

COMMFABRICPORT="0"
COMMFABRICNETWORKLEVEL="0"
COMMFABRICENCRYPTION="0"
MATRIXCMBRICKCOMMPORT="0"

X86="False"
FILESTREAMLEVEL="0"
ENABLERANU="False"
ADDCURRENTUSERASSQLADMIN="False"
BROWSERSVCSTARTUPTYPE="Disabled"

"@
$configContent | Out-File -FilePath $configFilePath -Encoding UTF8

& C:\Users\labinf\Downloads\SQLDEV_2019\SETUP.EXE /ConfigurationFile=C:\Users\labinf\Downloads\SQLDEV_2019\ConfigurationFile.ini