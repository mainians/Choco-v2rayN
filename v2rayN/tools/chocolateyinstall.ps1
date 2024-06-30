$ErrorActionPreference = 'Stop'

if (Test-Connection -ComputerName google.com -Quiet -Count 1) {
    $url_dl = 'https://github.com/2dust/v2rayN/releases/download/6.49/v2rayN-With-Core.zip'
}
else {
    $url_dl = 'https://mirror.ghproxy.com/https://github.com/2dust/v2rayN/releases/download/6.49/v2rayN-With-Core.zip'
}


$sha256 = "cf7158d230b02d306d314f2a63972b001347ca8d31d1f895d4a105c4bd381351"

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
