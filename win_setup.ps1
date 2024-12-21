function AddToPath
{
    param
    (
        [Parameter(Mandatory)]
        [string]$DirPath,
        [bool]$SystemWide = $false
    )
    # $env_var_target = If ($SystemWide) {[System.EnvironmentVariableTarget]::Machine} `
    #     Else {[System.EnvironmentVariableTarget]::User}
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

# TODO can we somehow share one definition of this between this script and refresh_path.ps1?
function RefreshPath
{
    $user_path = [Environment]::GetEnvironmentVariable("PATH", "User")
    $system_path = [Environment]::GetEnvironmentVariable("PATH", "Machine")
    $env:path = "$system_path;$user_path"
}

AddToPath "C:\Program Files\Sublime Text" $true
# TODO make sublime the default editor for bat files (if added to path)
AddToPath "C:\Program Files\Sublime Merge" $true

AddToPath "C:\Program Files\Microsoft Visual Studio\2022\Community\VC\Auxiliary\Build" $true
# RefreshPath
# TODO automatically clone/run the vcvarsall-gen/batch-wrapper stuff?
AddToPath "C:\Utilities\vcvarsall-gen\output" $true
AddToPath "C:\Utilities\batch-wrapper\build" $true

AddToPath "$env:userprofile\miniforge3\condabin"
RefreshPath
# cmd /c where conda # DEBUG
# TODO if added to path (or present in path and default env not already present in conda env list):
# cmd.exe /c conda create -n default python numpy pandas scipy # PyPDF2 python-pptx

# copy sudo.ps1, where.ps1, refresh_path.ps1 to $user_profile/Utilities/_scripts?


