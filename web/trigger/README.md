# The windows can call back home

Inside any `powershell` automation script you can use following code:

```ps1
Function Send-Note($status) {
    $url =  "http://gw/trigger/"
    $macs = Get-WmiObject win32_networkadapterconfiguration | select description, macaddress
    $ts = Get-Date -Format "o"
    $postParams = @{status=$status;ts=$ts;macs=$macs}
    $data = ConvertTo-Json -InputObject $postParams
    try {
        Invoke-WebRequest -Uri "$($url)" -Method POST -Body $data
    } catch {
        Write-Host "Http error"
    }
}
```

The examples for other programming languages would work similarly.

Curl example:

```bash
curl http://gw/trigger -X POST --data '{"status":"'"some info $USER"'"}'
```
