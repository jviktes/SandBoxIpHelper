BeforeAll { 
    # This will bring the function from the main file back to scope.
    . $PSScriptRoot/mainSandBox.ps1
}

Describe "isEven tests" {
    Context "When an even number is inputted" {
       It "Should return true"{
            isEven 2 | Should -Be $true
        }
    }
    Context "When an odd number is inputted" {
        It "Should return false"{
            isEven 7 | Should -Be $false
        }
    }
}