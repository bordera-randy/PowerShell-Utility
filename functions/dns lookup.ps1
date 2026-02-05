<########################################################################################################################################################
    Name Get-DNS.ps1
    Author Randy Bordeaux 
    Date Created 9/05/2023
    Date Modified
    
    .Description 
        Resolve DNS records against public DNS
        
        
    Requirements 
        AZ.AKS Module
        AZ CLI

        
    Documentation 
        https://docs.microsoft.com/en-us/powershell/azure/?view=azps-6.0.0
        https://docs.microsoft.com/en-us/powershell/azure/install-az-ps?view=azps-6.0.0
        https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-windows?view=powershell-7.1
        https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell-core-on-linux?view=powershell-7.1
        https://www.powershellgallery.com/packages/Az/6.0.0
        https://github.com/Azure/azure-powershell/releases
        https://shell.azure.com
    .Example
    get-dns -urllookup "google.com"
########################################################################################################################################################>

function get-DNS {
    param (
        $urllookup
    )
    #$urllookup = "google.com"
    $uri = "https://api.api-ninjas.com/v1/dnslookup?domain=$urllookup"
    $apikey = "ENTERAPIKEYHERE"
    $header = @{
        Accept = "application/json"
        "X-Api-Key" = $apikey
    }
    $dnsprep = iwr -Uri $uri -UseBasicParsing -Method Get -Headers $header | Select-Object -ExpandProperty Content
    $dnsprep | Convertfrom-Json
}


# Example: get-dns -urllookup "google.com"