$user_path = [Environment]::GetEnvironmentVariable("PATH", "User")
$system_path = [Environment]::GetEnvironmentVariable("PATH", "Machine")
$env:path = "$system_path;$user_path"
