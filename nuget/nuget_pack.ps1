Set-Location $PSScriptRoot

# Auto-generate <files> section
$nuspecPath = Join-Path $PSScriptRoot 'Package.nuspec'
$nuspecContent = Get-Content $nuspecPath -Raw

# Keep fixed files entries
$fixedFiles = @(
	'    <file src=".\app.png" target="" />',
	'    <file src="..\COPYING" target="COPYING" />',
	'    <file src="LAVFilters.targets" target="build\QuickLook.LAVFilters.targets" />'
)

# Build file list from lib directory
$libRoot = Resolve-Path (Join-Path $PSScriptRoot '..\lib')
$archs = Get-ChildItem $libRoot -Directory | Select-Object -ExpandProperty Name
$dynamicFiles = @()

foreach ($arch in $archs) {
	$archDir = Join-Path $libRoot $arch
	$files = Get-ChildItem $archDir -File
		foreach ($file in $files) {
			$src = "..\lib\$arch\$($file.Name)"
			$target = "build\$arch\$($file.Name)"
			$dynamicFiles += '    <file src="' + $src + '" target="' + $target + '" />'
		}
}

# Generate new <files> section
$allFiles = $fixedFiles + $dynamicFiles
$filesBlock = "  <files>`n" + ($allFiles -join "`n") + "`n  </files>"


# Replace the original <files> block using regex (insert plain text, no extra escaping)
$newNuspec = [System.Text.RegularExpressions.Regex]::Replace(
	$nuspecContent,
	'(?ms)  <files>.*?</files>',
	$filesBlock
)

[System.IO.File]::WriteAllText($nuspecPath, $newNuspec)

# Build nuget pack
& .\nuget pack Package.nuspec -OutputDirectory .

# Pause
Write-Host "Press any key to continue ..."
[void][System.Console]::ReadKey($true)
