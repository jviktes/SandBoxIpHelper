BeforeAll { 
    Install-Module -Name  SandBoxIpHelper.IPAddressHelper
    Import-Module SandBoxIpHelper.IPAddressHelper
}

Describe "SandBoxIpHelper tests" {
    Context "When an even number is inputted" {
       It "Should return 2974023424"{
            $ipAdressNumber = [GreyCorbel.Helpers.IPv4AddressHelper]::GetNumber("177.67.255.0")
            $($ipAdressNumber)
            "vysledky:"
            $ipAdressNumber | Should -Be 2974023424
        }
    }
}