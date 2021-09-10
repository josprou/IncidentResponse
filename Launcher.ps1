# Nombre: Launcher.ps1
# Descripción: Script de Recolección de Evidencias en Vivo
# Autor: J. Vicente Serrano

$CaseName = hostname

$driverTools = "L:\"
$driverReport = "M:\"

$Info = "$driverReport\$CaseName\" + "info.txt"
$HistorialDeComandos = "$driverReport\$CaseName\" + "HistorialDeComandos.txt"
$PSInfo = "$driverReport\$CaseName\" + "PSInfo.txt"
$Procesos = "$driverReport\$CaseName\Procesos\" + "Procesos.txt"
$ListDLLs = "$driverReport\$CaseName\Procesos\" + "ListDLLs.txt"
$PSList = "$driverReport\$CaseName\Procesos\" + "Pslist.txt"
$OpenFiles = "$driverReport\$CaseName\OpenFiles\" + "OpenFiles.txt"
$ClipBoard = "$driverReport\$CaseName\ClipBoard\" + "clipboard.d7"
$Services = "$driverReport\$CaseName\Servicios\" + "Servicios.txt"
$Drivers = "$driverReport\$CaseName\Servicios\" + "Drivers.txt"
$UsersLogged = "$driverReport\$CaseName\UsersLogged\" + "UsersLogged.txt"
$SharedLibraries = "$driverReport\$CaseName\SharedLibraries\" + "SharedLibraries.txt"
$SharedLibrariesUnSigned = "$driverReport\$CaseName\SharedLibraries\" + "SharedLibrariesUnSigned.txt"
$NetBIOSCache = "$driverReport\$CaseName\NetworkInfo\" + "NetBIOSCache.txt"
$NetBIOSNames = "$driverReport\$CaseName\NetworkInfo\" + "NetBIOSNames.txt"
$NetBIOSWins = "$driverReport\$CaseName\NetworkInfo\" + "NetBIOSWins.txt"
$NetBIOSSessions = "$driverReport\$CaseName\NetworkInfo\" + "NetBIOSSessions.txt"
$ActiveConnections = "$driverReport\$CaseName\NetworkConnections\" + "ActiveConnections.txt"
$EthernetStatistics = "$driverReport\$CaseName\NetworkConnections\" + "EthernetStatistics.txt"
$ActiveConnectionsWithPID = "$driverReport\$CaseName\NetworkConnections\" + "ActiveConnectionsWithPID.txt"
$ActiveConnectionsTCP = "$driverReport\$CaseName\NetworkConnections\" + "ActiveConnectionsTCP.txt"
$ActiveConnectionsUDP = "$driverReport\$CaseName\NetworkConnections\" + "ActiveConnectionsUDP.txt"
$ActiveConnectionsICMP = "$driverReport\$CaseName\NetworkConnections\" + "ActiveConnectionsICMP.txt"
$ActiveConnectionsIP = "$driverReport\$CaseName\NetworkConnections\" + "ActiveConnectionsIP.txt"
$ActiveConnectionsICMPv6 = "$driverReport\$CaseName\NetworkConnections\" + "ActiveConnectionsICMPv6.txt"
$ActiveConnectionsIPv6 = "$driverReport\$CaseName\NetworkConnections\" + "ActiveConnectionsIPv6.txt"
$ActiveConnectionsTCPv6 = "$driverReport\$CaseName\NetworkConnections\" + "ActiveConnectionsTCPv6.txt"
$ActiveConnectionsUDPv6 = "$driverReport\$CaseName\NetworkConnections\" + "ActiveConnectionsUDPv6.txt"
$RoutingTable = "$driverReport\$CaseName\NetworkConnections\" + "RoutingTable.txt"
$Autoruns = "$driverReport\$CaseName\Autoruns\" + "Autoruns.txt"
$AutorunsCsv = "$driverReport\$CaseName\Autoruns\" + "AutorunsCsv.csv"
$Registros = "$driverReport\$CaseName\Registros\" + "eventlog.txt"

# Creación de directorios
mkdir $driverReport\$CaseName
mkdir $driverReport\$CaseName\Registros
mkdir $driverReport\$CaseName\Procesos
mkdir $driverReport\$CaseName\OpenFiles
mkdir $driverReport\$CaseName\ClipBoard
mkdir $driverReport\$CaseName\Servicios
mkdir $driverReport\$CaseName\UsersLogged
mkdir $driverReport\$CaseName\SharedLibraries
mkdir $driverReport\$CaseName\NetworkInfo
mkdir $driverReport\$CaseName\NetworkConnections
mkdir $driverReport\$CaseName\Autoruns
mkdir $driverReport\$CaseName\RAM

cd $driverTools

# Fecha y hora actual del sistema
echo "Fecha y hora actual del sistema" >> $Info
echo ">> $(Get-Date) | Run: Get-Date"
echo ">> $(Get-Date) | Run: Get-Date" >> $Info
Get-Date >> $Info  

# Información del sistema 
echo ">> $(Get-Date) | Run: systeminfo.exe"
echo ">> $(Get-Date) | Run: systeminfo.exe" >> $Info
systeminfo.exe >> $Info
echo ">> $(Get-Date) | Run: psinfo64.exe -accepteula -h -s -d"
echo ">> $(Get-Date) | Run: psinfo64.exe -accepteula -h -s -d" >> $Info
.\tools\psinfo64.exe -accepteula -h -s -d >> $Info

# Historial de comandos
echo "Historial de comandos`n" >> $HistorialDeComandos
echo ">> $(Get-Date) | Run: doskey /history"
echo ">> $(Get-Date) | Run: doskey /history" >> $HistorialDeComandos
doskey /history >> $HistorialDeComandos

# Tiempo de actividad actual del sistema
echo "`nTiempo de actividad actual del sistema" >> $PSInfo
echo ">> $(Get-Date) | Run: net statistics"
echo "`n>> $(Get-Date) | Run: net statistics" >> $PSInfo 
net.exe statistics >> $PSInfo 
echo ">> $(Get-Date) | Run: Get-Uptime"
echo "`n>> $(Get-Date) | Run: Get-Uptime" >> $PSInfo 
Get-Uptime >> $PSInfo 

# Procesos en ejecución
echo ">> $(Get-Date) | Run: netstat –ab"
echo "`n>> $(Get-Date) | Run: netstat –ab" >> $Procesos
NETSTAT.EXE -ab >> $Procesos
echo ">> $(Get-Date) | Run: Listdlls64.exe -accepteula"
echo "`n>> $(Get-Date) | Run: Listdlls64.exe -accepteula" >> $ListDLLs
.\tools\Listdlls64.exe -accepteula >> $ListDLLs
echo ">> $(Get-Date) | Run: pslist.exe -accepteula -x"
echo "`n>> $(Get-Date) | Run: pslist.exe -accepteula -x" >> $PSList
.\tools\PStools\pslist.exe -accepteula -x >> $PSList 

# Archivos abiertos
echo ">> $(Get-Date) | Run: net file"
echo "`n>> $(Get-Date) | Run: net file" >> $OpenFiles 
net file >> $OpenFiles
echo ">> $(Get-Date) | Run: psfile64.exe -accepteula"
echo "`n>> $(Get-Date) | Run: psfile64.exe -accepteula" >> $OpenFiles 
.\tools\PStools\psfile64.exe -accepteula >> $OpenFiles
echo ">> $(Get-Date) | Run: openfiles"
echo "`n>> $(Get-Date) | Run: openfiles" >> $OpenFiles 
openfiles >> $OpenFiles 

# PortaPapeles
#echo ">> $(Get-Date) | Run: FreeClipViewer.exe $ClipBoard" 
#.\tools\FreeClipViewer.exe $ClipBoard

# Servicios/Drivers
echo ">> $(Get-Date) | Run: tasklist.exe /svc"
echo "`n>> $(Get-Date) | Run: tasklist.exe /svc" >> $Services
tasklist.exe /svc >>  $Services
echo ">> $(Get-Date) | Run: Get-WmiObject -Class win32_service -computer `".`" -Namespace `"root\cimv2`" | format-list *"
echo "`n>> $(Get-Date) | Run: Get-WmiObject -Class win32_service -computer `".`" -Namespace `"root\cimv2`" | format-list *" >> $Services
Get-WmiObject -Class win32_service -computer "." -Namespace "root\cimv2" | format-list * >> $Services
echo ">> $(Get-Date) | Run: psservice64.exe -accepteula"
echo "`n>> $(Get-Date) | Run: " >> $Services
.\tools\PStools\PsService64.exe -accepteula >> $Services
echo ">> $(Get-Date) | Run: Get-WindowsDriver -Online -All"
echo "`n>> $(Get-Date) | Run: Get-WindowsDriver -Online -All" >> $Drivers
Get-WindowsDriver -Online -All >> $Drivers

# Usuarios conectados
echo ">> $(Get-Date) | Run: PsLoggedon64.exe -accepteula"
echo "`n>> $(Get-Date) | Run: PsLoggedon64.exe -accepteula" >> $UsersLogged 
.\tools\PStools\PsLoggedon64.exe -accepteula >> $UsersLogged 
echo ">> $(Get-Date) | Run: net session"
echo "`n>> $(Get-Date) | Run: net session" >> $UsersLogged 
net session >> $UsersLogged 
echo ">> $(Get-Date) | Run: logonsessions64.exe -accepteula -p"
echo "`n>> $(Get-Date) | Run: logonsessions64.exe -accepteula -p" >> $UsersLogged 
.\tools\logonsessions64.exe -accepteula -p >> $UsersLogged 

# DLL o bibliotecas compartidas
echo ">> $(Get-Date) | Run: Listdlls64.exe -accepteula -v"
echo "`n>> $(Get-Date) | Run: Listdlls64.exe -accepteula -v" >> $SharedLibraries 
.\tools\Listdlls64.exe -accepteula -v >> $SharedLibraries
echo ">> $(Get-Date) | Run: Listdlls64.exe -accepteula -u"
echo "`n>> $(Get-Date) | Run: Listdlls64.exe -accepteula -u" >> $SharedLibrariesUnSigned 
.\tools\Listdlls64.exe -accepteula -u >> $SharedLibrariesUnSigned 

# Información de red
echo ">> $(Get-Date) | Run: nbtstat.exe -c"
echo "`n>> $(Get-Date) | Run: nbtstat.exe -c" >> $NetBIOSCache
nbtstat -c >> $NetBIOSCache
echo ">> $(Get-Date) | Run: nbtstat.exe -n"
echo "`n>> $(Get-Date) | Run: nbtstat.exe -n" >> $NetBIOSNames
nbtstat -n >> $NetBIOSNames
echo ">> $(Get-Date) | Run: nbtstat.exe -r"
echo "`n>> $(Get-Date) | Run: nbtstat.exe -r" >> $NetBIOSWins
nbtstat -r >> $NetBIOSWins
echo ">> $(Get-Date) | Run: nbtstat.exe -s"
echo "`n>> $(Get-Date) | Run: nbtstat.exe -s" >> $NetBIOSSessions
nbtstat -s >> $NetBIOSSessions

# Conexiones de red
echo ">> $(Get-Date) | Run: netstat.exe -ano"
echo "`n>> $(Get-Date) | Run: netstat.exe -ano" >> $ActiveConnections
netstat.exe -ano >> $ActiveConnections
echo ">> $(Get-Date) | Run: netstat.exe -e"
echo "`n>> $(Get-Date) | Run: netstat.exe -e" >> $EthernetStatistics
netstat.exe -e >> $EthernetStatistics
echo ">> $(Get-Date) | Run: netstat.exe -o"
echo "`n>> $(Get-Date) | Run: netstat.exe -o" >> $ActiveConnectionsWithPID
netstat.exe -o >> $ActiveConnectionsWithPID
echo ">> $(Get-Date) | Run: netstat.exe -p TCP"
echo "`n>> $(Get-Date) | Run: netstat.exe -p TCP" >> $ActiveConnectionsTCP
netstat.exe -p TCP >> $ActiveConnectionsTCP
echo ">> $(Get-Date) | Run: netstat.exe -p UDP"
echo "`n>> $(Get-Date) | Run: netstat.exe -p UDP" >> $ActiveConnectionsUDP
netstat.exe -p UDP >> $ActiveConnectionsUDP
echo ">> $(Get-Date) | Run: netstat.exe -p ICMP"
echo "`n>> $(Get-Date) | Run: netstat.exe -p ICMP" >> $ActiveConnectionsICMP
netstat.exe -p ICMP >> $ActiveConnectionsICMP
echo ">> $(Get-Date) | Run: netstat.exe -p IP"
echo "`n>> $(Get-Date) | Run: netstat.exe -p IP" >> $ActiveConnectionsIP
netstat.exe -p IP >> $ActiveConnectionsIP
echo ">> $(Get-Date) | Run: netstat.exe -p ICMPv6"
echo "`n>> $(Get-Date) | Run: netstat.exe -p ICMPv6" >> $ActiveConnectionsICMPv6
netstat.exe -p ICMPv6 >> $ActiveConnectionsICMPv6
echo ">> $(Get-Date) | Run: netstat.exe -p IPv6"
echo "`n>> $(Get-Date) | Run: netstat.exe -p IPv6" >> $ActiveConnectionsIPv6
netstat.exe -p IPv6 >> $ActiveConnectionsIPv6
echo ">> $(Get-Date) | Run: netstat.exe -p TCPv6"
echo "`n>> $(Get-Date) | Run: netstat.exe -p TCPv6" >> $ActiveConnectionsTCPv6
netstat.exe -p TCPv6 >> $ActiveConnectionsTCPv6
echo ">> $(Get-Date) | Run: netstat.exe -p UDPv6"
echo "`n>> $(Get-Date) | Run: netstat.exe -p UDPv6" >> $ActiveConnectionsUDPv6
netstat.exe -p UDPv6 >> $ActiveConnectionsUDPv6
echo ">> $(Get-Date) | Run: netstat.exe -r"
echo "`n>> $(Get-Date) | Run: netstat.exe -r" >> $RoutingTable
netstat.exe -r >> $RoutingTable

# Procesos que se ejecuten durante el arranque del sistema
echo ">> $(Get-Date) | Run: autorunsc64.exe -accepteula -a * -h -s -t"
echo "`n>> $(Get-Date) | Run: autorunsc64.exe -accepteula -a * -h -s -t" >> $Autoruns
.\tools\autorunsc64.exe -accepteula -a * -h -s -t >> $Autoruns
echo ">> $(Get-Date) | Run: autorunsc64.exe -accepteula -a * -h -s -t -c"
echo "`n>> $(Get-Date) | Run: autorunsc64.exe -accepteula -a * -h -s -t -c" >> $AutorunsCsv
.\tools\autorunsc64.exe -accepteula -a * -h -s -t -c >> $AutorunsCsv
