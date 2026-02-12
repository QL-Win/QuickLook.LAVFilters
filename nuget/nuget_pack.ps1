Set-Location $PSScriptRoot

# nuget pack
& .\nuget pack Package.nuspec -OutputDirectory .

# pause
Write-Host "Press any key to continue ..."
[void][System.Console]::ReadKey($true)
