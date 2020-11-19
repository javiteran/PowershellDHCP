#Ejemplo de creación, borrado, opciones de un ámbito y reservas.
#INSTALAR EL ROL DHCP
#Install-WindowsFeature DHCP -IncludeManagementTools

#Borrar AMBITOS
Remove-DhcpServerv4Scope -ScopeId 172.20.140.128 -Force

#CREAR AMBITOS
Add-DhcpServerv4Scope -Name "Examen15" -StartRange 172.20.140.150 -EndRange 172.20.140.200 -SubnetMask 255.255.255.128 –State Active
#OPCIONES de AMBITO
Set-DhcpServerv4OptionValue  -DnsDomain domi.com -DnsServer 172.20.140.254,8.8.8.8 -Router 172.20.140.254 -ScopeId  172.20.140.128
#ó
Set-DhcpServerv4OptionValue -OptionId 3 -Value 172.20.140.254 -ScopeId 172.20.140.128
set-dhcpServerv4OptionValue -DnsServer 172.20.140.254,8.8.8.8 -ScopeId 172.20.140.128
Set-DhcpServerv4OptionValue -DnsDomain "examen15.com"  -ScopeId 172.20.140.128

#Mas opciones
Set-DhcpServerv4OptionValue -OptionId 42 -Value 12.15.66.33 -ScopeId 10.100.100.128               #NTP
Set-DhcpServerv4OptionValue -OptionId 66 -Value 10.100.100.33 -ScopeId 10.100.100.128          #PXE TFTP


#Exclusiones
Add-DhcpServerv4ExclusionRange –StartRange 172.20.140.170 –EndRange 172.20.140.190 –ScopeID 172.20.140.128 

#Reservas DHCP
Add-DhcpServerv4Reservation -ClientId FFFFAABBCCDD -IPAddress 172.20.140.197 -ScopeId 172.20.140.128
#Opciones para una reserva
Set-DhcpServerv4OptionValue -ReservedIP 172.20.140.197 -Router 172.20.140.1
