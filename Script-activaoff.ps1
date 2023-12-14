$ECHO 
REM This script will trigger a deployment of Microsoft Office, provided that the customer has the correct files in the correct locations.
CD X:\FTS_OFFICE
Invoke-WebRequest -Uri "http://192.168.0.144/owncloud/s/3c5vrbV0MLyja10/download" -OutFile "x:\FTS_OFFICE\ActivaOffice2019.bat";
x:\FTS_OFFICE\ActivaOffice2019.bat