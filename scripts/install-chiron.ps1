# Installs the Chiron FDE Dojo agent persona into a dedicated project folder.
# Safe: does not touch any existing global OpenCode config.
# Usage: .\install-chiron.ps1 [-TargetDir "C:\path\to\folder"]

param(
    [string]$TargetDir = "$HOME\fde-dojo"
)

$RepoRawUrl = "https://raw.githubusercontent.com/mchellappa/chiron/main/agent/chiron-fde-dojo.md"

Write-Host "FDE Dojo - Chiron agent installer"
Write-Host "Target folder: $TargetDir"

New-Item -ItemType Directory -Force -Path $TargetDir | Out-Null

try {
    Invoke-WebRequest -Uri $RepoRawUrl -OutFile (Join-Path $TargetDir "AGENTS.md") -UseBasicParsing
} catch {
    Write-Error "Failed to download Chiron agent file: $_"
    exit 1
}

Write-Host ""
Write-Host "Done. Chiron's persona is now at: $TargetDir\AGENTS.md"
Write-Host ""
Write-Host "To start your first session:"
Write-Host "  cd `"$TargetDir`""
Write-Host "  opencode"
Write-Host ""
Write-Host "Then say: Chiron, I'm starting the FDE Dojo, Track A Unit 0."
