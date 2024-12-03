function AddToPath
{
    param
    (
        [string]$Dir
    )
    if (!(Test-Path $Dir) )
    {
        Write-warning "Supplied directory was not found!"
        return
    }
    $PATH = [Environment]::GetEnvironmentVariable("PATH", "Machine")
    if ($PATH -notlike "*"+$Dir+"*")
    {
        [Environment]::SetEnvironmentVariable("PATH", "$PATH;$Dir", "Machine")
    }
}

AddToPath("C:\Program Files\Sublime Text")
AddToPath("C:\Program Files\Sublime Merge")
