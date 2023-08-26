<#
.SYNOPSIS
	Windows hosts file compression script.
.DESCRIPTION
	PowerShell script to compress a large hosts file in Windows. The default output is to the console.
.PARAMETER OutputFile
	Path to an output file. 
.PARAMETER InputFile
	Path to an input file. Defaults to 'C:\Windows\System32\drivers\etc\hosts'.
.EXAMPLE
	PS> compress_hosts -OutputFile $Env:USERPROFILE\Documents\hosts
.NOTES
	compress_hosts.ps1
	Author: Ian Pride 
	Modified date: 1:36 PM Saturday, August 26, 2023
	Version 1.0.0 - Added Get-Help comments
#>
# ╔═══════════════════════════════════════════════════════════╗
# ║ Universal hosts file compression script for Windows       ║
# ║ © 2023 Ian Pride - New Pride Software/Services            ║
# ║ https://github.com/Lateralus138/hosts-compression-scripts ║
# ╚═══════════════════════════════════════════════════════════╝
param(
	[String]$OutputFile,
	[string]$InputFile = 'C:\Windows\System32\drivers\etc\hosts'
)
"Compiling $InputFile content."
$content = @(Get-Content $InputFile)
"Compiling $InputFile urls for 0.0.0.0."
$firstURL0Index = $null
$hasFirstURL0Index = $False
$urls_0 = @(
	$content |
	Select-String -Pattern '^0.0.0.0' |
	Select-String -Pattern '(\s+0.0.0.0)' -NotMatch  |
	ForEach-Object {
		($_ -split '\s')[1];
		if (-Not $hasFirstURL0Index) {
			$firstURL0Index = $content.IndexOf($_);
			$hasFirstURL0Index = $True;
			$firstURL0Index | Out-Null
		}
	}
)
"Compiling $InputFile urls for 127.0.0.1."
$firstURL127Index = $null
$hasFirstURL127Index = $False
$urls_127 = @(
	$content |
	Select-String -Pattern '^127.0.0.1' |
	Select-String -Pattern '(\s+(127.0.0.1|localhost|local|localhost\.localdomain))' -NotMatch  |
	ForEach-Object {
		($_ -split '\s')[1];
		if (-Not $hasFirstURL127Index) {
			$firstURL127Index = $content.IndexOf($_);
			$hasFirstURL127Index = $True;
			$firstURL127Index | Out-Null
		}
	}
)
$firstURLIndex = $null
if ($hasFirstURL0Index -And $hasFirstURL127Index)
{
	$firstURLIndex = if ($hasFirstURL0Index -le $hasFirstURL127Index) {
		$firstURLIndex = $firstURL0Index
	} else {
		$firstURLIndex = $firstURL127Index
	}
}
elseif ($hasFirstURL0Index)
{
	$firstURLIndex = $firstURL0Index
}
elseif ($hasFirstURL127Index)
{
	$firstURLIndex = $firstURL127Index
}
else
{
	$firstURLIndex = 0
}
$content_header = $content[0..($firstURLIndex - 1)]
$content_footer = $content[$firstURLIndex..$content.GetUpperBound(0)]
$content_footer = $(
	$content_footer |
	Select-String -Pattern "^0.0.0.0" -NotMatch
)
$content_footer = $(
	$content_footer |
	Select-String -Pattern "^127.0.0.1" -NotMatch
)
$urls_0_count = $urls_0.Count
if ($urls_0_count -gt 0)
{
	$urllines = "`n"
	"Attempting to compress hosts file urls for 0.0.0.0."
	for ($index = 0; $index -lt $urls_0_count; $index += 9)
	{
		$urllines += "0.0.0.0 " + [string]($urls_0[$index..($index + 8)] -join ' ') + "`n"
		Write-Progress -Activity ("[" + ($urls_0_count - $index) + "] urls left to compress for 0.0.0.0. ") -PercentComplete ($index * 100 / $urls_0_count) -Status 'Compressing...'
	}
}
$urls_127_count = $urls_127.Count
if ($urls_127_count -gt 0)
{
	$urllines = "`n"
	"Attempting to compress hosts file urls for 127.0.0.1."
	for ($index = 0; $index -lt $urls_127_count; $index += 9)
	{
		$urllines += "127.0.0.1 " + [string]($urls_0[$index..($index + 8)] -join ' ') + "`n"
		Write-Progress -Activity ("[" + ($urls_127_count - $index) + "] urls left to compress for 127.0.0.1. ") -PercentComplete ($index * 100 / $urls_127_count) -Status 'Compressing...'
	}
}
$urllines += "`n"
if ( (($urls_0_count + $urls_127_count) % 9) -eq 0 )
{
  $result = ($urls_0_count + $urls_127_count) / 9
}
else 
{
  $result = [math]::truncate(($urls_0_count + $urls_127_count) / 9) + 1
}
"Hosts file urls finished compressing."
("Compressed [" + ($urls_0_count + $urls_127_count) + "] urls into [" + $result + "] lines.")
$body = ($content_header).Replace("`n`n", "`n").Trim("`n")
$body += ($urllines).Replace("`n`n", "`n").Trim("`n")
$body += $content_footer
if ($OutputFile)
{
	$body | Out-File "$OutputFile" -Force -Encoding utf8
}
else
{
	$body
}
