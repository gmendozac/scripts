#crea un usuario local como administrador. Recibe como parametros el usuario y contraseña, separados por un espacio
New-LocalUser -AccountNeverExpires:$true -Password ( ConvertTo-SecureString -AsPlainText -Force '') -Name '' | Add-LocalGroupMember -Group administradores
