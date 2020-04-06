$Server = 'CYG362'    
$database = 'sql_hr'
$Connection = New-Object System.Data.SQLClient.SQLConnection
$Connection.ConnectionString = "server=$($Server);database=$($Database);trusted_connection=true;"
$Connection.Open()
$Command = New-Object System.Data.SQLClient.SQLCommand
$Command.Connection = $Connection
$Command.CommandText = 'Select * from baskets'
$Reader = $Command.ExecuteReader()
$Datatable = New-Object System.Data.DataTable
$Datatable.Load($Reader)
$Datatable
$Connection.Close() 