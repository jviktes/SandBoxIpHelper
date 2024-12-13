# IpHelper

## Overview

IpHelper project provides basic methods for IP address processing. It contains IPv4AddressHelper and IPv4AddressHelper classes containing methods:

- GetNumber(string ipAddress) returning uint number for IP address
        example: for 177.67.255.0 returns 2974023424
                 for 177.67.255.0/24 returns 2974023424

- GetRangeBoundaries(string range) returns low and high uint bounds for given IP address
        example: for 90.176.8.132/30 returns (1521485956,1521485959)

- BelongsToRange(string ipAddress, string range) returns true/false if IP address is in given range

## Nuget package

Project provides public nuget package from here: <https://www.nuget.org/packages/SandBoxIpHelper/>

## Power shell module

Project provides public powershell module from here: <https://www.powershellgallery.com/packages/SandBoxIpHelper.IPAddressHelper/>

### Example of implementation

```powershell
import-module SandBoxIpHelper.IPAddressHelper

function Test-GetRangeBoundaries ($range, $siteId) {

    $bounds =@()
    try {
            $bounds = [GreyCorbel.Helpers.IPv4AddressHelper]::GetRangeBoundaries($range,$siteId)
            $bounds      = [PSCustomObject]@{
            low  = $bounds.Item1
            high = $bounds.Item2
        }

        if ($null -eq $bounds) {
            throw "Getting null value from GetRangeBoundaries()" 
        }
        
        if ($bounds.low -eq 1521485956) {
            Write-Debug "Test OK for GetRangeBoundaries() low bound value"
        }
        
        if ($boundss.high -eq 1521485959) {
             Write-Debug "Test OK for GetRangeBoundaries() high bound value"
        }    

    }
    catch {
        Write-Warning "Error occurred Test-GetRangeBoundaries: $_"
        throw "Error occurred Test-GetRangeBoundaries: $_"
    }
}
```
