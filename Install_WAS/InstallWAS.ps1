#installing WAS
function WASinstall ($IMpath,$repository,$packages,$securestoragefile,$masterpasswordfile,$installationpath,$sharedresourcepath)
{
  Set-Location -Path $IMpath\tools
  #installing WAS
  cmd.exe /c "imcl install $packages -repositories $repository  -installationDirectory $installationpath -sharedResourcesDirectory $sharedresourcepath -acceptLicense -showProgress  -secureStorageFile $securestoragefile -masterPasswordFile $masterpasswordfile"
}

$path = "C:\Users\Public\Powershell\WAS\Install_WAS\InstallWAS.properties"
$output = Get-Content $path | ConvertFrom-StringData

#variables
$IMpath=$output.IMpath
$repository=$output.repository
$packages=$output.packages
$securestoragefile=$output.securestoragefile
$masterpasswordfile=$output.masterpasswordfile
$installationpath=$output.installationPath
$sharedresourcepath=$output.sharedresourcePath
$logpath=$output.logpath

Start-Transcript -Path $logpath
#Calling installWAS
WASinstall $IMpath $repository $packages $securestoragefile $masterpasswordfile $installationpath $sharedresourcepath

Stop-Transcript




