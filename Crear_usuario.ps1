$password = ConvertTo-SecureString "f4r0n1cs" -AsPlainText -Force
New-LocalUser -Name "Remoto" -Password $password -PasswordNeverExpires
Set-LocalUser -Name "Remoto" -UserMayChangePassword $false
Add-LocalGroupMember -Group "Administradores" -Member "Remoto"
