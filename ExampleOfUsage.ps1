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

function Test-GetNumber ($ipAddress) {

    try {
        $ipAdressNumber = [GreyCorbel.Helpers.IPv4AddressHelper]::GetNumber($ipAddress)

        if ($null -eq $ipAdressNumber) {
            throw "Getting null value from GetNumber()" 
        }
        
        if ($ipAdressNumber -ne 2974023424) {
            throw "Getting wrong value from GetNumber()" 
        }

    }
    catch {
        Write-Warning "Error occurred Test-GetNumber: $_"
        throw "Error occurred GetNumber: $_"
    }
}

Test-GetRangeBoundaries -range "90.176.8.132/30" -siteId "123456789"
Test-GetNumber -ipAddress "177.67.255.0"
Test-GetNumber -ipAddress "177.67.255.0/24"