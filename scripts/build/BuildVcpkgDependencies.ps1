Set-StrictMode -Version Latest
Push-Location $PSScriptRoot

$ErrorActionPreference = "Stop"
$PSDefaultParameterValues['*:ErrorAction'] = 'Stop'

# Setup the correct version of vcpkg
# See https://docs.microsoft.com/en-us/cpp/vcpkg for install instructions
#git clone -q --recursive https://github.com/Microsoft/vcpkg
cd vcpkg
.\bootstrap-vcpkg.bat
cp ..\x64-windows-static.cmake .\triplets\

# Install these packages. If certain packages must have a specific version, modify/add a folder under ./ports
# This script copies the ports list over the default port list downloaded from the vcpkg repo.
robocopy /S ..\ports\ .\ports

$packages = @()
$packages += "openexr"
$packages += "ptex"
$packages += "boost-filesystem"
$packages += "boost-program-options"
$packages += "boost-python"
$packages += "boost-system"
$packages += "tbb"
#$packages += "opensubdiv"

$exports = $packages | % { $_ + ":x64-windows-static" }

foreach ($export in $exports) {
    .\vcpkg install $export
}

.\vcpkg export $exports --nuget --nuget-id=sxusd-vcpkg-dependencies --nuget-version=1.0.0

Pop-Location