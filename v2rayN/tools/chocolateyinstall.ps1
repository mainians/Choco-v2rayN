$ErrorActionPreference = 'Stop'

if (Test-Connection -ComputerName google.com -Quiet -Count 1) {
    $url_dl = 'https://github.com/2dust/v2rayN/releases/download/6.39/v2rayN-With-Core.zip'
}
else {
    $url_dl = 'https://download.fgit.cf/2dust/v2rayN/releases/download/6.39/v2rayN-With-Core.zip'
}


$sha256 = "96a8b2ce656b5f185f6bdf04830227c1684e1a7dd295d8bb865ec10ce15c90af"

$DesktopPath = [Environment]::GetFolderPath("Desktop")

$packageArgs = @{
    packageName   = $env:ChocolateyPackageName
    unzipLocation  = "$(Get-ToolsLocation)\$env:ChocolateyPackageName"
    url64bit      = $url_dl
    checksum64    = $sha256
    checksumType  = 'SHA256'
}

Install-ChocolateyZipPackage @packageArgs
Install-ChocolateyShortcut -ShortcutFilePath "$DesktopPath\v2rayN.lnk" -TargetPath "$(Get-ToolsLocation)\$env:ChocolateyPackageName\v2rayN-With-Core\v2rayN.exe"
