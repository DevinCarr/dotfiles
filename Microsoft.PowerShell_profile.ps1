Set-Alias which Get-Command

# https://en.wikipedia.org/wiki/ANSI_escape_code
# Skip some colors that are too close to bright/intense, also solid red/greens
$colorCodesToSkip = @(52, 88, 124, 160, 196) + @(28, 34, 40, 46, 47)
$colorCodes = (23..230) | Where-Object { !$colorCodesToSkip.Contains($_) }
# Global variable to print out the color code if I don't like it in the list
$global:currentColor = 0

# PowerShell prompt
function prompt {
    $ESC = [char]27
    $global:currentColor = $colorCodes | Get-Random
    $time = Get-Date -Format "hh:mm:ss"
    $path = $PWD | Resolve-Path -Relative
    $gitBranch = git rev-parse --abbrev-ref HEAD 2> $null
    $gitBranch = if ($gitBranch -ne $null) { " @ $gitBranch" } else { "" }
    Write-Host "$ESC[38;5;$($global:currentColor)m[$time]$gitBranch$path>$ESC[0;0m" -NoNewline
    " "
}
