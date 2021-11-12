#saving IBM credentials to secure storage file
function savecredentials ($IMpath,$repository,$username,$password,$securestoragefile,$masterpasswordfile)
{
  Set-Location -Path $IMpath\tools
  cmd.exe /c "imutilsc saveCredential -url $repository -userName $username -userPassword $password -secureStorageFile $securestoragefile -masterPasswordFile $masterpasswordfile"
}


$path = "C:\Users\Public\Powershell\WAS\secureCredentials\secure.properties"
$output = Get-Content $path | ConvertFrom-StringData

#variables
$IMpath=$output.IMpath
$repository=$output.repository
$securestoragefile=$output.securestoragefile
$masterpasswordfile=$output.masterpasswordfile
$username=$output.username
$password=$output.password
$logpath=$output.logpath
$VerbosePreference="continue"
write-host $credlogpath
Start-Transcript -Path $logpath

Write-Host $IMpath

#calling savecredentials function
savecredentials $IMpath $repository $username $password $securestoragefile $masterpasswordfile

Stop-Transcript

