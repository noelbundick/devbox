Param(
  [Parameter(Mandatory = $true)]
  [string] $Email,
  [Parameter(Mandatory = $true)]
  [string] $ApiKey,
  [Parameter(Mandatory = $true)]
  [string] $Domain,
  [Parameter(Mandatory = $true)]
  [string] $Name
)

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

$headers = @{
  "Content-Type"="application/json";
  "X-Auth-Key"=$ApiKey;
  "X-Auth-Email"=$Email;
}

$zone = Invoke-WebRequest -UseBasicParsing -Method GET -Headers $headers -Uri "https://api.cloudflare.com/client/v4/zones/" | ConvertFrom-Json | select -ExpandProperty result | ? { $_.name -eq $Domain }

$zoneId = $zone.id
$recordName = "$Name.$Domain"
$record = Invoke-WebRequest -UseBasicParsing -Method GET -Headers $headers -Uri "https://api.cloudflare.com/client/v4/zones/$zoneId/dns_records" | ConvertFrom-Json | select -ExpandProperty result | ? { $_.name -eq $recordName }

$publicIP = Invoke-RestMethod http://ipinfo.io/json | select -ExpandProperty ip
if ($record) {
  Write-Output "Updating DNS record"
  $recordId = $record.id
  $body = @{
    "type" = "A";
    "name" = $Name;
    "content" = $publicIP;
    "proxied" = $false
  }
  $json = ConvertTo-Json $body
  Invoke-WebRequest -UseBasicParsing -Method PUT -Headers $headers -Body $json -Uri "https://api.cloudflare.com/client/v4/zones/$zoneId/dns_records/$recordid" | ConvertFrom-Json | select -ExpandProperty result
} else {
  Write-Output "Creating new DNS record"
  $body = @{
    "type" = "A";
    "name" = $Name;
    "content" = $publicIP;
    "proxied" = $false
  }
  $json = ConvertTo-Json $body
  Invoke-WebRequest -UseBasicParsing -Method POST -Headers $headers -Body $json -Uri "https://api.cloudflare.com/client/v4/zones/$zoneId/dns_records" | ConvertFrom-Json | select -ExpandProperty result
}
