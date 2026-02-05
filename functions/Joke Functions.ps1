function get-chuck {
    $jokeprep = iwr -Uri 'https://api.chucknorris.io/jokes/random' -UseBasicParsing -Method Get | Select-Object -ExpandProperty Content
    $joke = $jokeprep | Convertfrom-Json
    Add-Type -AssemblyName PresentationCore,PresentationFramework
    $ButtonType = [System.Windows.MessageBoxButton]::OK
    $MessageIcon = [System.Windows.MessageBoxImage]::Error
    $MessageBody = "$($joke.value)"
    $MessageTitle = "Chuck Norris Joke"
    $Result = [System.Windows.MessageBox]::Show($MessageBody,$MessageTitle,$ButtonType,$MessageIcon)
    
    }
function get-dadjoke {
    $header = @{
        Accept = "application/json"
        "Content-Type" = "application/json"
    }
    $jokeprep = iwr -Uri 'https://icanhazdadjoke.com/' -UseBasicParsing -Method Get -Headers $header | Select-Object -ExpandProperty Content
    $joke = $jokeprep | Convertfrom-Json
    #write-output $joke.joke 
    Add-Type -AssemblyName PresentationCore,PresentationFramework
    $ButtonType = [System.Windows.MessageBoxButton]::OK
    $MessageIcon = [System.Windows.MessageBoxImage]::Error
    $MessageBody = "$($joke.joke)"
    $MessageTitle = "Dad Joke"
    $Result = [System.Windows.MessageBox]::Show($MessageBody,$MessageTitle,$ButtonType,$MessageIcon)
    #Write-Host "Your choice is $Result"
    }
    
function get-joke {
    $uri = "https://api.api-ninjas.com/v1/jokes?format=json"
    $apikey = "ENTERAPIKEYHERE"
    $header = @{
        Accept = "application/json"
        "X-Api-Key" = $apikey
    }
    $jokeprep = iwr -Uri $uri -UseBasicParsing -Method Get -Headers $header | Select-Object -ExpandProperty Content
    $joke = $jokeprep | Convertfrom-Json
    write-output $joke.joke 
}

# pop up window 
$wshell = New-Object -ComObject Wscript.Shell
$wshell.Popup("$($joke.value)",0,"Done",0x1)



Add-Type -AssemblyName PresentationCore,PresentationFramework
$ButtonType = [System.Windows.MessageBoxButton]::YesNoCancel
$MessageIcon = [System.Windows.MessageBoxImage]::Error
$MessageBody = "$($joke.value)"
$MessageTitle = "Chuck Norris Joke"
$Result = [System.Windows.MessageBox]::Show($MessageBody,$MessageTitle,$ButtonType,$MessageIcon)
Write-Host "Your choice is $Result"