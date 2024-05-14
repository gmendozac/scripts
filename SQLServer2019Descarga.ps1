$url = "https://download.microsoft.com/download/d/a/2/da259851-b941-459d-989c-54a18a5d44dd/SQL2019-SSEI-Dev.exe"
$outputPath = "C:\Users\labinf\Downloads\SQL2019-SSEI-Dev.exe"
Invoke-WebRequest -Uri $url -OutFile $outputPath

while (-not (Test-Path $outputPath)) {
    Start-Sleep -Seconds 5  
}

& $outputPath /ACTION=download MEDIAPATH=C:\Users\labinf\Downloads /QUIET

$setupFilePath = "C:\Users\labinf\Downloads\SQLServer2019-DEV-x64-ESN.exe"
while (-not (Test-Path $setupFilePath)) {
    Start-Sleep -Seconds 5
}

& $setupFilePath /q /x:C:\Users\labinf\Downloads\SQLDEV_2019

Start-Sleep -Seconds 5

$folderPath = "C:\Users\labinf\Downloads\SQLDEV_2019"
if (-not (Test-Path $folderPath)) {
    New-Item -Path $folderPath -ItemType Directory -Force
}

$configFilePath = Join-Path $folderPath "ConfigurationFile.ini"
$configContent = @"
;SQL Server 2019 Configuration File
[OPTIONS]

; Al especificar este parámetro y aceptar las condiciones de Microsoft Python Open y Microsoft Python Server, confirma que ha leído y comprendido los términos de uso. 

IACCEPTPYTHONLICENSETERMS="False"

; Especifica un flujo de trabajo de instalación, como INSTALL, UNINSTALL o UPGRADE. Es un parámetro necesario. 

ACTION="Install"

; Con la especificación de este parámetro y la aceptación de los términos de Microsoft R Open y Microsoft R Server, reconoce que ha leído y comprendido los términos de uso. 

IACCEPTROPENLICENSETERMS="False"

; Especifica que el programa de instalación de SQL Server no debe mostrar la declaración de privacidad cuando se ejecute desde la línea de comandos. 

SUPPRESSPRIVACYSTATEMENTNOTICE="False"

; Use el parámetro /ENU para instalar la versión en inglés de SQL Server en el sistema operativo Windows traducido. 

ENU="False"

; La instalación no mostrará ninguna interfaz de usuario. 

QUIET="True"

; El programa de configuración solo mostrará el progreso, sin la interacción del usuario. 

QUIETSIMPLE="False"

; Parámetro que controla el comportamiento de la interfaz de usuario. Los valores válidos son Normal para la interfaz de usuario completa, AutoAdvance para una interfaz de usuario simplificada y EnableUIOnServerCore para omitir la parte gráfica de la instalación de Server Core. 


; Especifique si el programa de configuración de SQL Server debe detectar e incluir actualizaciones del producto. Los valores válidos son True y False o 1 y 0. De forma predeterminada, el programa de configuración de SQL Server incluirá las actualizaciones que encuentre. 

UpdateEnabled="False"

; Si se proporciona este parámetro, el equipo usará Microsoft Update para comprobar las actualizaciones. 

USEMICROSOFTUPDATE="False"

; Especifica que el programa de instalación de SQL Server no debe mostrar el aviso de edición de pago cuando se ejecute desde la línea de comandos. 

SUPPRESSPAIDEDITIONNOTICE="False"

; Especifique la ubicación en la que el programa de configuración de SQL Server obtendrá actualizaciones del producto. Los valores válidos son 'MU' para buscar en Microsoft Update, una ruta de acceso de carpeta válida, una ruta de acceso relativa, como .\MisActualizaciones, o un recurso compartido UNC. De forma predeterminada, el programa de configuración de SQL Server buscará en Microsoft Update o en el servicio Windows Update mediante Windows Server Update Services. 

UpdateSource="MU"

; Especifica las características que se van a instalar, desinstalar o actualizar. La lista de las características de nivel superior incluye SQL, AS, IS, MDS y Herramientas. La característica SQL instalará el motor de base de datos, la replicación, el texto completo y el servidor de Data Quality Services (DQS). La característica Herramientas instalará los componentes compartidos. 

FEATURES=SQLENGINE

; Muestra el uso de los parámetros de la línea de comandos. 

HELP="False"

; Especifica que el registro de instalación detallado debe redireccionarse a la consola. 

INDICATEPROGRESS="False"

; Especifica que el programa de configuración debe realizar la instalación en WOW64. Este argumento de la línea de comandos no se admite en sistemas IA64 ni de 32 bits. 

X86="False"

; Especifique una instancia con nombre o predeterminada. MSSQLSERVER es la instancia predeterminada de las ediciones que no sean Express, mientras que SQLExpress corresponde a las ediciones Express. Este parámetro es necesario para instalar el motor de base de datos de SQL Server (SQL), o bien Analysis Services (AS). 

INSTANCENAME="MSSQLSERVER"

; Especifique el directorio de instalación raíz de los componentes compartidos. Este directorio no cambia después de instalar los componentes compartidos. 

INSTALLSHAREDDIR="C:\Program Files\Microsoft SQL Server"

; Especifique el directorio de instalación raíz de los componentes compartidos WOW64. Este directorio no cambia después de instalar los componentes compartidos WOW64. 

INSTALLSHAREDWOWDIR="C:\Program Files (x86)\Microsoft SQL Server"

; Especifique el identificador de instancia de las características de SQL Server que ha indicado. Las estructuras de directorios y del Registro, así como los nombres de los servicios SQL Server incorporarán el identificador de instancia de SQL Server. 

INSTANCEID="MSSQLSERVER"

; Cuenta del servicio CEIP de SQL Server: dominio\usuario o cuenta del sistema. 

SQLTELSVCACCT="NT Service\SQLTELEMETRY"

; Tipo de inicio para el servicio CEIP de SQL Server. 

SQLTELSVCSTARTUPTYPE="Automatic"

; Especifique el directorio de instalación. 

INSTANCEDIR="C:\Program Files\Microsoft SQL Server"

; Nombre de cuenta del Agente 

AGTSVCACCOUNT="NT Service\SQLSERVERAGENT"

; Iniciar servicio automáticamente después de la instalación.  

AGTSVCSTARTUPTYPE="Manual"

; Puerto de comunicación TCP del brick de CM 

COMMFABRICPORT="0"

; Cómo usará la matriz las redes privadas 

COMMFABRICNETWORKLEVEL="0"

; Cómo se protegerá la comunicación entre bricks 

COMMFABRICENCRYPTION="0"

; Puerto TCP usado por el brick de CM 

MATRIXCMBRICKCOMMPORT="0"

; Tipo de inicio para el servicio SQL Server. 

SQLSVCSTARTUPTYPE="Automatic"

; Nivel para habilitar la característica FILESTREAM en (0, 1, 2 o 3). 

FILESTREAMLEVEL="0"

; La opción de configuración de servidor de grado máximo de paralelismo (MAXDOP). 

SQLMAXDOP="6"

; Establézcalo en "1" para habilitar RANU para SQL Server Express. 

ENABLERANU="False"

; Especifica una intercalación de Windows o SQL que se va a utilizar para el motor de base de datos. 

SQLCOLLATION="Modern_Spanish_CI_AS"

; Cuenta para el servicio de SQL Server: Dominio\Usuario o cuenta de sistema. 

SQLSVCACCOUNT="NT Service\MSSQLSERVER"

; Establezca el valor como "True" para habilitar la inicialización de archivo instantánea para el servicio SQL Server. Si se habilita, la Configuración concederá el privilegio de realización de tareas de mantenimiento de volumen al SID del servicio de motor de la base de datos. Esto puede dar lugar a la divulgación de información, ya que se podría permitir a una entidad de seguridad no autorizada el acceso a contenido eliminado. 

SQLSVCINSTANTFILEINIT="False"

; Cuentas de Windows que se suministran como administradores del sistema de SQL Server. 

SQLSYSADMINACCOUNTS="$deviceName\labinf"

; El número de archivos de TempDB del motor de base de datos. 

SQLTEMPDBFILECOUNT="6"

; Especifica el tamaño inicial en MB del archivo de datos de TempDB de un motor de base de datos. 

SQLTEMPDBFILESIZE="8"

; Especifica el incremento en MB del crecimiento automático de cada archivo de datos de TempDB en cada motor de base de datos. 

SQLTEMPDBFILEGROWTH="64"

; Especifica el tamaño inicial en MB del archivo de registro de TempDB del motor de base de datos. 

SQLTEMPDBLOGFILESIZE="8"

; Especifica el incremento en MB del crecimiento automático del archivo de registro de TempDB del motor de base de datos. 

SQLTEMPDBLOGFILEGROWTH="64"

; Se aprovisiona el usuario actual como un administrador del sistema del motor de base de datos para SQL Server 2019 Express. 

ADDCURRENTUSERASSQLADMIN="False"

; Especifique 0 para deshabilitar el protocolo TCP/IP, o 1 para habilitarlo. 

TCPENABLED="0"

; Especifique 0 para deshabilitar el protocolo Named Pipes, o 1 para habilitarlo. 

NPENABLED="0"

; Tipo de inicio para el servicio SQL Server Browser. 

BROWSERSVCSTARTUPTYPE="Disabled"

; Use SQLMAXMEMORY para minimizar el riesgo de que el sistema operativo sufra una presión de memoria perjudicial. 

SQLMAXMEMORY="2147483647"

; Use SQLMINMEMORY para reservar una cantidad mínima de memoria disponible en el Administrador de memoria de SQL Server. 

SQLMINMEMORY="0"
IACCEPTSQLSERVERLICENSETERMS="True"
"@
$configContent | Out-File -FilePath $configFilePath -Encoding UTF8
