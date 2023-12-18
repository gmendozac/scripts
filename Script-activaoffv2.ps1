if (-NOT([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator"))
{
  $arguments = "& '" +$myinvocation.mycommand.definition + "'"
  Start-Process powershell -Verb runAs -ArgumentList $arguments
  Break
}
CD C:\FTS_OFFICE
Invoke-WebRequest -Uri "http://192.168.0.144/owncloud/s/3c5vrbV0MLyja10/download" -OutFile "c:\FTS_OFFICE\ActivaOffice2019.bat";
Start-Process c:\FTS_OFFICE\ActivaOffice2019.bat