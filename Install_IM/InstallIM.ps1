$propertiesFile = "C:\Users\Public\Powershell\WAS\Install_IM\installIM.properties"
$params = Get-Content $propertiesFile | ConvertFrom-StringData
$url=$params.url
$downloadPath=$params.downloadPath
$installPath=$params.installPath
$logpath=$params.logpath
$servername=$params.servername
$VerbosePreference="continue"

Start-Transcript -Path $logpath
#check server have internet access
if ((Test-Connection -ComputerName $servername -Quiet) -eq "True")
{
  Write-Verbose "Server have Internet access"
  #calling downloadIM function
  downloadIM $url $downloadPath $installPath
}
else
{
  #calling installIM function
  installIM $downloadPath $installPath
}
Stop-Transcript

#downloading Installation manager
function downloadIM ($url,$downloadPath,$installPath)
{
  
  Invoke-WebRequest -Uri $url -OutFile $downloadPath
  
  if (Test-Path $downloadPath)
  {
    Write-Verbose "ready to extract"
  }
  #calling installInstallationManager function
  installIM $downloadPath $installPath
}

#installing Installation manager
function installIM ($downloadPath,$installPath)
{
  #extracting files
  Expand-Archive -LiteralPath $downloadPath -DestinationPath $installPath -Force
  if (Test-Path $installPath)
  {
    Write-Verbose "File extracted successfully"
  }
  else
  {
    Write-Verbose "File extraction failed. Please check the path is correct"
  }
  Set-Location -Path $installPath
  #installing IM
  cmd.exe /c "installc -acceptLicense"
}

