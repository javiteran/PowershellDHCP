#Añadir varios ámbitos
$NombreAmbito = 'MiAmbito'
$Mascara = '255.255.255.192'
for ($i=30;$i -le 67;$i++) 
{ 
        Add-DhcpServerv4Scope -EndRange 90.90.$i.79 -Name $NombreAmbito$i -StartRange 90.90.$i.70 -SubnetMask $Mascara
}

