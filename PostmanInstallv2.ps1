MKDIR C:\Postman64
Invoke-WebRequest -Uri http://192.168.0.144/owncloud/s/G5oe7o6dHOLTLpR/download -OutFile "c:\Postman64\Postman-win64-Setup.exe";
Start-Process "c:\Postman64\Postman-win64-Setup.exe" -Argumentlist '-s' -NoNewWindow -Wait
Start-Sleep 10