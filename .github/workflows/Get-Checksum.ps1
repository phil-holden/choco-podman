$version = Get-Content '.version'

$msiUrl = "https://github.com/containers/podman/releases/download/v$version/podman-v$($version).msi"

Invoke-WebRequest -Uri $msiUrl -Outfile install.msi

$checksum = Get-FileHash -Path install.msi

"version=$version" >> $env:GITHUB_ENV
"checksum=$($checksum.Hash)" >> $env:GITHUB_ENV
