


# O365 Email setup
$SMTPServer = "smtp.office365.com"
$SMTPClient = New-Object Net.Mail.SmtpClient($SmtpServer, 587) 
$SMTPClient.EnableSsl = $true
 
# Change this sections variables as required 
$EmailFrom = 'SaaSInfrastructureOps@duckcreek.com'
$EmailTo = "randy.bordeaux@duckcreek.com"
$EmailSubject = "Just a Test Mail"
$EmailBody = "<strong>A Test HTML Email</strong>"
$emailusername = 'SaaSInfrastructureOps@duckcreek.onmicrosoft.com'
$emailPassword = 'Fhj4P#SX3v+*rY5sfdz7Hv@@VW=Pa28!' 
$SMTPClient.Credentials = New-Object System.Net.NetworkCredential("$emailusername", "$emailPassword");  
$Credential = Get-Credential

$mailparams =@{
    smtpserver  = $SMTPServer
    port        = '587'
    usessl      = $true 
    Credential  = $credential
    from        = 'SaaSInfrastructureOps@duckcreek.com'
    to          = 'randy.bordeaux@duckcreek.com'
    subject     = "SMTP Test Email - $(get-date -format g)"
    body        = "This is a test message, from PowerShell"
}

Send-MailMessage @mailparams

# Send the Email
$SMTPMessage = New-Object System.Net.Mail.MailMessage($EmailFrom,$EmailTo,$EmailSubject,$EmailBody)
$SMTPMessage.IsBodyHTML = $true # Set to $false or delete this line if you want plain text
$SMTPClient.Send($SMTPMessage)

$Credential = @{
    username    = $emailusername 
    Password    = $emailPassword
} 

Send-MailMessage -From $EmailFrom -To $EmailTo -SmtpServer smtp.office365.com -port 587 -subject $EmailSubject -body $EmailBody -cred $Credential -UseSsl -Verbose -Debug

Send-MailMessage 