$ECHO 
MKDIR C:\FTS_OFFICE
Invoke-WebRequest -Uri "http://192.168.0.144/owncloud/s/Pe2wZkUGKxf36Om/download" -OutFile "c:\FTS_OFFICE\setup.exe";
Invoke-WebRequest -Uri "http://192.168.0.144/owncloud/s/qr8Xqkdqi6kB0ag/download" -OutFile "c:\FTS_OFFICE\configuration.xml";
c:\FTS_OFFICE\setup.exe /configure c:\FTS_OFFICE\configuration.xml