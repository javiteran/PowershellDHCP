#Bucle para añadir un archivo con MAC/IPs
$ejemplo=Import-Csv W:\CreaReservasAmbito.csv -Delimiter ';'
foreach ($fila in $ejemplo){
          #Remove-DhcpServerv4Reservation -ScopeId $fila.scope -ClientId $fila.mac
           Add-DhcpServerv4Reservation -ScopeId 172.20.140.128    -IPAddress     $fila.ip     -ClientId           $fila.mac
}
	
