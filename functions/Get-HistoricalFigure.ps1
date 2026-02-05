function get-historicalfigure {
    param (
        $name
    )
    $uri = "https://api.api-ninjas.com/v1/historicalfigures?name=$name"
    $apikey = "ENTERAPIKEYHERE"
    $header = @{
        Accept = "application/json"
        "X-Api-Key" = $apikey
    }
    $prep = iwr -Uri $uri -UseBasicParsing -Method Get -Headers $header | Select-Object -ExpandProperty Content
    $final = $prep | Convertfrom-Json
    $info = $final | select -ExpandProperty info

    write-host -ForegroundColor DarkMagenta "Checking $($name)"
    $final.name
    $final.Title
    $($info | fl)
}

get-historicalfigure -name "Bhushan Parab"
