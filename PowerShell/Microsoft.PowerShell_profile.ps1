Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadLineOption -HistoryNoDuplicates
Set-PSReadLineOption -Colors @{
  Command            = 'Magenta'
  Number             = 'DarkYellow'
  Member             = 'Yellow'
  Operator           = 'DarkCyan'
  Type               = 'DarkMagenta'
  Variable           = 'DarkGreen'
  Parameter          = 'Green'
  ContinuationPrompt = 'Cyan'
  Default            = 'DarkBlue'
  InlinePrediction   = 'DarkGray'
}
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key Ctrl+P -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key Ctrl+N -Function HistorySearchForward

# Install-Module posh-git -Scope CurrentUser # Import once
# Install-Module -Name PSFzf

# 'Ctrl+T' stands for search file and 'Ctrl+R' stands for search command
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'
$commandOverride = [ScriptBlock]{ param($Location) Write-Host $Location }
Set-PsFzfOption -AltCCommand $commandOverride

# https://ohmyposh.dev/docs
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\gruvbox.omp.json" | Invoke-Expression

function proxyon {
  $internet_setting = Get-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings'
  if ($internet_setting.ProxyEnable -eq 1) {
    $ENV:HTTP_PROXY = "http://$($internet_setting.ProxyServer)"
    $ENV:HTTPS_PROXY = "http://$($internet_setting.ProxyServer)"
  }
  Remove-Variable -Name internet_setting
}

function proxyoff {
  Remove-Item Env:HTTP_PROXY
  Remove-Item Env:HTTPS_PROXY
}

proxyon

Set-Alias -Name v nvim
Set-Alias -Name vi nvim
Set-Alias -Name nc ncat.exe
Set-Alias -Name ls lsd.exe

function ll { lsd.exe -l }

# zoxide aka 'z' command
Invoke-Expression (& { $hook = if ($PSVersionTable.PSVersion.Major -ge 6) { 'pwd' } else { 'prompt' } (zoxide init powershell --cmd cd --hook $hook | Out-String) })

# Import-Module "gsudoModule"

