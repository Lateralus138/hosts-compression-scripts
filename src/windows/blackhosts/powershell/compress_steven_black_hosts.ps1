Write-Information "Compiling Steven Black's hosts file content."  -InformationAction Continue
$content = @(Get-Content 'C:\Windows\System32\drivers\etc\hosts')
$Break = $False
$content_header = $($content |  Foreach-Object { if ($Break -eq $False) {$_}; if ($_ -eq '# http://stevenblack.com') {$Break = $True} })
$content_footer = $($content |  Foreach-Object { if ($Break -eq $False) {$_}; if ($_ -eq '# http://stevenblack.com') {$Break = $False} })
$content_footer = $(
			$content_footer |
			Select-String -Pattern "^0.0.0.0" -NotMatch
	 	   )
Write-Information "Compiling hosts file urls." -InformationAction Continue
$urls = @(
		$content |
		Select-String -Pattern '^0.0.0.0' |
		Select-String -Pattern '(\s+0.0.0.0)' -NotMatch  |
		ForEach-Object { ($_ -split '\s')[1] }
	 )
$urls_count = $urls.Count
$urllines = @("`n")
 Write-Information "Attempting to compress hosts file urls." -InformationAction Continue
$index = 0
while ($urls.length -gt 1)
{
	$one, $two, $three, $four, $five, $six, $seven, $eight, $nine, $rest = $urls
	$urllines += "0.0.0.0 $one $two $three $four $five $six $seven $eight $nine"
	$urls = @($rest)
	$index += 9
	Write-Progress -Activity ("[" + $urls.Count + "] urls left to compress. ") -PercentComplete ($index * 100 / $urls_count) -Status 'Compressing...'
}
$urllines += "`n"
if ( ($urls_count % 9) -eq 0 )
{
  $result = $urls_count / 9
}
else 
{
  $result = [math]::truncate($urls_count / 9) + 1
}
Write-Information "Hosts file urls finished compressing." -InformationAction Continue
Write-Information ("Compressed [" + $urls_count + "] urls into [" + $result + "] lines.") -InformationAction Continue
$content_header
$urllines
$content_footer
