MKDIR C:\CPLEX
Invoke-WebRequest -Uri "http://200.1.25.137:65000/owncloud/s/StKNsW6P3kdavQG/download" -OutFile "C:\CPLEX\cplexresp.properties"
Invoke-WebRequest -Uri "http://200.1.25.137:65000/owncloud/s/BbBcqAEENcLES9z/download" -OutFile "C:\CPLEX\cplex_studio129.win-x86-64.exe"
C:\CPLEX\cplex_studio129.win-x86-64.exe -f C:\CPLEX\cplexresp.properties