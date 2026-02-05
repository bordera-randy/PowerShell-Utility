Function Convert-ImmutableID (
    [Parameter(Mandatory = $true)]
    $ImmutableID) { 
    ([GUID][System.Convert]::FromBase64String($ImmutableID)).Guid
}
Function Convert-ObjectGUID (
    [Parameter(Mandatory = $true)]
    $ObjectGUID) { 
    [system.convert]::ToBase64String(([GUID]$ObjectGUID).ToByteArray())
}
Convert-ImmutableID -ImmutableID 'ENTERVALUE'
Convert-ObjectGUID -objectGUID 'ENTERVALUE'