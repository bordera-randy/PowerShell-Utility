
<# Categories 
artliterature
language
sciencenature
general
fooddrink
peopleplaces
geography
historyholidays
entertainment
toysgames
music
mathematics
religionmythology
sportsleisure
#>


function get-trivia {
    param (
        $category
    )
    $uri = "https://api.api-ninjas.com/v1/trivia?category="
    $apikey = "ENTERAPIKEYHERE"
    $header = @{
        Accept = "application/json"
        "X-Api-Key" = $apikey
    }
    $prep = iwr -Uri $uri -UseBasicParsing -Method Get -Headers $header | Select-Object -ExpandProperty Content
    $final = $prep | Convertfrom-Json
    write-host -ForegroundColor green $final.question
    write-host -ForegroundColor red $final.answer
}
