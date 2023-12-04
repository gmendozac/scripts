$ECHO 
REM This script will trigger a deployment of Microsoft Office, provided that the customer has the correct files in the correct locations.
MKDIR X:\FTS_OFFICE
Invoke-WebRequest -Uri "http://192.168.0.144/owncloud/s/Pe2wZkUGKxf36Om/download" -OutFile "x:\FTS_OFFICE\setup.exe";
Invoke-WebRequest -Uri "http://192.168.0.144/owncloud/s/qr8Xqkdqi6kB0ag/download" -OutFile "x:\FTS_OFFICE\configuration.xml";
x:\FTS_OFFICE\setup.exe /configure x:\FTS_OFFICE\configuration.xml