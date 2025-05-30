# ===== Prompt ==== #
$CurrentViMode = "I"
function prompt {
    "┌[$pwd]`n└► "
}

# ===== VI ===== #
# Vi mode
Set-PSReadLineOption -EditMode Vi

# Vi cursor change
function OnViModeChange {
    if ($args[0] -eq 'Command') {
        # Set the cursor to a blinking block.
        $CurrentViMode = "N"
        Write-Host -NoNewline "`e[1 q"
    } else {
        # Set the cursor to a blinking line.
        $CurrentViMode = "I"
        Write-Host -NoNewline "`e[5 q"
    }
}
Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler $Function:OnViModeChange


# ==== OTHER ==== #
# Bash like tab completion
Set-PSReadLineKeyHandler -Chord Tab -Function Complete

# Disable bell song
Set-PSReadlineOption -BellStyle None
Set-PSReadlineOption -HistoryNoDuplicates


Write-Output "This profile is using Vi EditMode. Please run ``Set-PSReadLineOption -EditMode Windows`` to get default keybindings"
