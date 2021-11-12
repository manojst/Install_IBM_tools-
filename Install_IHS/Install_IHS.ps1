#installing IBM HTTP server
function installIHS($IMpath,$repository,$packages,$securestoragefile,$masterpasswordfile,$installationpath,$sharedresourcepath,$port)
{
  Set-Location -Path $IMpath\tools
  #installling IHS
  cmd.exe /c "imcl install $packages -repositories $repository  -installationDirectory $installationpath -sharedResourcesDirectory $sharedresourcepath -properties user.ihs.httpPort=$port -acceptLicense -showProgress -secureStorageFile $securestoragefile -masterPasswordFile $masterpasswordfile"
}﻿

$path = "C:\Users\Public\Powershell\WAS\Install_IHS\Install_IHS.properties"
$params = Get-Content $path | ConvertFrom-StringData

#variables
$IMpath=$params.IMpath
$repository=$params.repository
$packages=$params.packages
$securestoragefile=$params.securestoragefile
$masterpasswordfile=$params.masterpasswordfile
$installationpath= $params.installationpath
$sharedresourcepath=$params.sharedresourcepath
$port=$params.port
$logpath=$params.logpath

Start-Transcript -Path $logpath
#Calling installIHS function
installIHS $IMpath $repository $packages $securestoragefile $masterpasswordfile $installationpath $sharedresourcepath $port
Stop-Transcript