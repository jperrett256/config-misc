function AddToPath
{
    param
    (
        [Parameter(Mandatory)]
        [string]$DirPath,
        [bool]$SystemWide = $false
    )
    $env_var_target = If ($SystemWide) {"Machine"} Else {"User"}

    Write-Host "Adding ""$DirPath"" to $env_var_target PATH"

    if (!(Test-Path $DirPath) )
    {
        Write-Warning "Supplied directory was not found!"
        return
    }

    $path = [Environment]::GetEnvironmentVariable("PATH", $env_var_target)
    if ($path -notlike "*"+$DirPath+"*")
    {
        [Environment]::SetEnvironmentVariable("PATH", "$path;$DirPath", $env_var_target)
        # TODO return true if just added to path
    }
}

AddToPath -Dir "C:\Program Files\Sublime Text" -SystemWide $true
AddToPath -Dir "C:\Program Files\Sublime Merge" -SystemWide $true

$user_profile = [Environment]::GetEnvironmentVariable("USERPROFILE")

AddToPath -Dir $user_profile"\miniforge3\condabin"
# TODO if added to path, refresh process PATH and run:
# cmd.exe /c conda create -n default python numpy pandas scipy # PyPDF2 python-pptx
