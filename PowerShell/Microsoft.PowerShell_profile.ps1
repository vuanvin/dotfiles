# Invoke-Expression (&starship init powershell)

# Install-Module PSReadLine -Scope CurrentUser # Import once
Set-PSReadLineOption -EditMode Emacs

Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadlineKeyHandler -Key Ctrl+P -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key Ctrl+N -Function HistorySearchForward

# Install-Module -Name PSFzf
# replace 'Ctrl+t' and 'Ctrl+r' with your preferred bindings:
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+t' -PSReadlineChordReverseHistory 'Ctrl+r'

# https://ohmyposh.dev/docs
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\half-life.omp.json" | Invoke-Expression
# Install-Module posh-git -Scope CurrentUser # Import once


function proxyon
{
	$env:HTTP_PROXY="http://127.0.0.1:7890"
	$env:HTTPS_PROXY="http://127.0.0.1:7890"
	$env:NO_PROXY="http://127.0.0.1,localhost,ubuntu.wsl,wsl.local"
}
proxyon

function proxyoff
{
	$env:HTTP_PROXY=""
	$env:HTTPS_PROXY=""
	$env:NO_PROXY=""
}

Set-Alias -Name v nvim
Set-Alias -Name vi nvim
Set-Alias -Name vim nvim

#Set the color for Prediction (auto-suggestion)
Set-PSReadLineOption -Colors @{
  Command            = 'Magenta'
  Number             = 'DarkBlue'
  Member             = 'DarkBlue'
  Operator           = 'DarkBlue'
  Type               = 'DarkBlue'
  Variable           = 'DarkGreen'
  Parameter          = 'DarkGreen'
  ContinuationPrompt = 'DarkBlue'
  Default            = 'DarkBlue'
  InlinePrediction   = 'DarkGray'
}
