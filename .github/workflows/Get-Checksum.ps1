$version = Get-Content "$PSScriptRoot/.version"

$msiUrl = "https://github.com/containers/podman/releases/download/v$version/podman-v$($version).msi"

Invoke-WebRequest -Uri $msiUrl -Outfile $PSScriptRoot/install.msi

$checksum = Get-FileHash -Path $PSScriptRoot/install.msi

"version=$version" >> $env:GITHUB_ENV
"checksum=$($checksum.Hash)" >> $env:GITHUB_ENV
