Write-Host("Compiling hosts file content.")
$content = @(Get-Content 'C:\Windows\System32\drivers\etc\hosts')
$Break = $False
$content_header = $($content |  Foreach-Object { if ($Break -eq $False) {$_}; if ($_ -eq '# http://stevenblack.com') {$Break = $True} })
$content_footer = $($content |  Foreach-Object { if ($Break -eq $False) {$_}; if ($_ -eq '# http://stevenblack.com') {$Break = $False} })
$content_footer = $(
			$content_footer |
			Select-String -Pattern "^0.0.0.0" -NotMatch
	 	   )
Write-Host("Compiling hosts file urls.")
$urls = @(
		$content |
		Select-String -Pattern '^0.0.0.0' |
		Select-String -Pattern '(\s+0.0.0.0)' -NotMatch  |
		ForEach-Object { ($_ -split '\s')[1] }
	 )
$urllines = @("`n")
Write-Host("Attempting to compress hosts file urls.")
while ($urls.length -gt 1)
{
	$one, $two, $three, $four, $five, $six, $seven, $eight, $nine, $rest = $urls
	$urllines += "0.0.0.0 $one $two $three $four $five $six $seven $eight $nine"
	$urls = @($rest)
	Write-Host -NoNewLine $("`r`e[s[" + $urls.length + "] urls left to compress.`e[u")
}
$urllines += "`n"
Write-Host("Hosts file urls finished compressing.")
$content_header
$urllines
$content_footer
