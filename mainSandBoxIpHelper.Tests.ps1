BeforeAll { 
    #https://pester.dev/docs/usage/modules
    Import-Module ./SandBoxIpHelper.IPAddressHelper.psm1
}

Describe "SandBoxIpHelper tests" {
    Context "When IP 177.67.255.0 is inputted" {
       It "Should return 2974023424"{
            $ipAdressNumber = [GreyCorbel.Helpers.IPv4AddressHelper]::GetNumber("177.67.255.0")
            $ipAdressNumber | Should -Be 2974023424
        }
    },
    Context "When range 90.176.8.132/30 is inputted" {
        It "Should return 2974023424"{
            $bounds = [GreyCorbel.Helpers.IPv4AddressHelper]::GetRangeBoundaries("90.176.8.132/30")
            $bounds      = [PSCustomObject]@{
                low  = $bounds.Item1
                high = $bounds.Item2
            }
            $bounds.low | Should -Be 2974023424
            $bounds.high | Should -Be 1521485959
         }
     }
}