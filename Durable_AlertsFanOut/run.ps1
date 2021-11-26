param($tenant)

try {
  $Test = New-GraphGetRequest -uri 'https://graph.microsoft.com/v1.0/security/alerts' -tenantid $tenant.defaultDomainName -AsApp $true
  $Stuff = [System.Collections.Generic.List[PSCustomObject]]@()
  

  foreach ($alert in $test) {
    $Stuff.Add([PSCustomObject]@{
      Tenant = $tenant.defaultDomainName
      Id     = $alert.Id
      Title  = $alert.Title
      Category = $alert.category
      EventDateTime = $alert.eventDateTime
      Severity = $alert.Severity
      Status = $alert.Status
    })
  }

  $Stuff
}
catch {
  Write-Host "$($_.Exception.Message)"
}