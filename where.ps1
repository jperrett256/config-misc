param(
    [Parameter(Mandatory)]
    [String]$Name
)
Write-Output (Get-Command $Name).Path
