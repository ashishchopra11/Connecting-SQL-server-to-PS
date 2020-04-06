$tables= Invoke-Sqlcmd -query 'Select * from dbo.baskets' -ServerInstance CYG362 -Database sql_hr  
write-host ($tables | Format-Table | Out-String) 
$tables | Out-GridView 

$databases = invoke-sqlcmd -server $CYG362 'select name from master.sys.databases where database_id > 4 order by name' 
write-host ($databases | Format-Table | Out-String) 