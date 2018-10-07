
Import-Module 'C:\tools\poshgit\dahlbyk-posh-git-9bda399\src\posh-git.psd1'
#[System.Environment]::SetEnvironmentVariable("SSH_AUTH_SOCK", $null)
#[System.Environment]::SetEnvironmentVariable("SSH_AGENT_PID", $null)

Set-Alias dc docker-compose
Set-Alias g git
Set-PSReadlineOption -TokenKind Parameter -Foregroundcolor Cyan
Set-PSReadlineOption -TokenKind Operator -Foregroundcolor White
Set-PSReadlineOption -BellStyle None
