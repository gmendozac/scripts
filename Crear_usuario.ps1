$password=ConvertTo-SecureString "f4r0n1cs" -AsPlainText -force
New-LocalUser -name "Remoto" -Password $password
Add-LocalGroupMember -Group "administradores" -Member "Remoto"