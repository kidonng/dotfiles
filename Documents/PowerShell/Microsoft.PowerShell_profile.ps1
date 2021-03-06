# Functions
Function Get-File {
  curl.exe -LJOR $args
}

Function Get-IPv4Address {
  curl.exe -sS ip.sb | nali
}

Function Get-Ipv6Address {
  curl.exe -sS6 ip.sb | nali
}

Function Select-Dotfiles {
  git --git-dir $env:HOME\.config\dotfiles $args
}

function Clear-All-History {
  Remove-Item -Confirm:$true "$env:APPDATA\Microsoft\Windows\PowerShell\PSReadLine\$($host.Name)_history.txt"
}

Function Get-MD5 {
  (Get-FileHash -Algorithm MD5 $args).Hash
}

Function Get-SHA1 {
  (Get-FileHash -Algorithm SHA1 $args).Hash
}

Function Get-SHA256 {
  (Get-FileHash -Algorithm SHA256 $args).Hash
}

Function Get-SHA512 {
  (Get-FileHash -Algorithm SHA512 $args).Hash
}

# env
# Fix `less` encoding (for `git log` etc.)
# $env:LESSCHARSET = 'utf-8'
$env:PROXYCHAINS_CONF_FILE = "$(scoop prefix proxychains)\proxychains.conf"

# Plugins
starship init powershell | Invoke-Expression
starship completions | Out-String | Invoke-Expression
# # https://github.com/cli/cli/issues/1775#issuecomment-695769258
# # Invoke-Expression (@(&gh completion -s powershell) -replace " ''\)$"," ' ')" -join "`n")
Import-Module posh-git
Import-Module PSColor
Import-Module PSFzf
Import-Module "$(scoop prefix scoop)\supporting\completion\Scoop-Completion"
Set-PsFzfOption -PSReadlineChordReverseHistory 'Ctrl+r'

# Aliases
New-Alias -Option Private c code-insiders
New-Alias -Option Private dl Get-File
New-Alias -Option Private dot Select-Dotfiles
New-Alias -Option Private e explorer.exe
New-Alias -Option Private g git.exe
New-Alias -Option Private i4 Get-IPv4Address
New-Alias -Option Private i6 Get-Ipv6Address
New-Alias -Option Private p proxychains.exe
New-Alias -Option Private s sudo
New-Alias -Option Private md5 Get-MD5
New-alias -Option private sha1 Get-SHA1
New-alias -Option private sha256 Get-SHA256
New-alias -option private sha512 Get-SHA512
