
function Init
{
    param()

    process
    {
        #check if we need to load or already loaded
        "Init"
        if($null -eq ('IPv4AddressHelper' -as [type])) {
            "IPv4AddressHelper"
            $ipv4AddressHelper = Get-Content "$PSScriptRoot\Helpers\IPv4AddressHelper.cs" -Raw
            Add-Type -TypeDefinition $ipv4AddressHelper -ReferencedAssemblies $referencedAssemblies -WarningAction SilentlyContinue -IgnoreWarnings
        }
        if($null -eq ('IPv6AddressHelper' -as [type])) {
            "IPv6AddressHelper"
            $ipv6AddressHelper = Get-Content "$PSScriptRoot\Helpers\IPv6AddressHelper.cs" -Raw
            Add-Type -TypeDefinition $ipv6AddressHelper -ReferencedAssemblies $referencedAssemblies -WarningAction SilentlyContinue -IgnoreWarnings
        }
    }
}
#load modul:
Init