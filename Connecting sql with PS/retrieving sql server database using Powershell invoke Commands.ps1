$MYSERVER = 'CYG362'
$tables = invoke-sqlcmd -server MYSERVER -Database sql_hr  "select * from dbo.baskets"

