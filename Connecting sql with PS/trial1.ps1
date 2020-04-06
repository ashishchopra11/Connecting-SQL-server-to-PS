Enable-PSRemoting -force
$strSQLServer="CYG362"
$strSQLDatabase="sql_hr"
$strSQLUser="CYBERGINDIA\ashish.chopra"
#$strSQLPassword=""

$psSession = New-PSSession -Computer $strSQLServer 
$psSession.GetType().Name
Invoke-Command -Session $psSession -Script {$strSQLServer,$strSQLdatabase,$strSQLUser,$strSQLPassword}
Invoke-Command -Session $psSession -Script {Import-Module SQLPS -ErrorAction Continue}
Invoke-Command -Session $psSession -Script {$objDataset= Invoke-Sqlcmd -Query "select * from baskets" -server $($strSQLServer) -database $('sql_hr')}
Invoke-Command -Session $psSession -Script {$objDataset.Count}
