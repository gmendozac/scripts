MKDIR C:\CPLEX
Invoke-WebRequest -Uri "http://192.168.0.144/owncloud/s/i2AaMnVE3gokoDG/download" -OutFile "C:\CPLEX\cplexresp.properties"
Invoke-WebRequest -Uri "http://192.168.0.144/owncloud/s/LdEhxnrlX6LCOjj/download" -OutFile "C:\CPLEX\cplex_studio129.win-x86-64.exe"
C:\CPLEX\cplex_studio129.win-x86-64.exe -f C:\CPLEX\cplexresp.properties