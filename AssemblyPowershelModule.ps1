param (
    [Parameter(Mandatory = $true)]
    [string]$RootDirectory,
    #$env:GITHUB_WORKSPACE
    [Parameter(Mandatory = $true)]
    [string]$ModuleName
    #SandBoxIpHelper
)

#Create folders:
New-Item -Path "outputModule\" -ItemType Directory -Force
New-Item -Path "outputModule\$($ModuleName)\" -ItemType Directory -Force
New-Item -Path "outputModule\$($ModuleName)\Helpers" -ItemType Directory -Force

#Copying required files:
Get-ChildItem -Path (Join-Path $RootDirectory "Helpers") -Filter "*.cs" | Copy-Item -Destination (Join-Path $RootDirectory "outputModule\$($ModuleName)\Helpers") -Force
Get-ChildItem -Path $RootDirectory -Recurse -Include "*.psd1","*.psm1" | Copy-Item -Destination (Join-Path $RootDirectory "outputModule\$($ModuleName)\") -Force

#Licence:
Copy-Item -Path $RootDirectory"\LICENSE" -Destination $RootDirectory"\outputModule\$($ModuleName)\LICENSE.txt" -Force
