$ECHO 
MKDIR C:\FTS_OFFICE
Invoke-WebRequest -Uri "http://200.1.25.137:65000/owncloud/s/xsabbxaHfg5rhTj/download" -OutFile "c:\FTS_OFFICE\setup.exe";
Invoke-WebRequest -Uri "http://200.1.25.137:65000/owncloud/s/suOx87vRKUjV1pl/download" -OutFile "c:\FTS_OFFICE\configuration.xml";
c:\FTS_OFFICE\setup.exe /configure c:\FTS_OFFICE\configuration.xml