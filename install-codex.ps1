#Requires -Version 5.1
[CmdletBinding()]
param(
    [string]$CodexRoot = (Join-Path $env:USERPROFILE '.codex')
)

$ErrorActionPreference = 'Stop'
$RepoRoot = Split-Path -Parent $MyInvocation.MyCommand.Path
$SkillRoot = Join-Path $CodexRoot 'skills'
$AgentRoot = Join-Path $CodexRoot 'agents'

New-Item -ItemType Directory -Path $SkillRoot, $AgentRoot -Force | Out-Null

$MainTarget = Join-Path $SkillRoot 'meta-ads'
New-Item -ItemType Directory -Path $MainTarget -Force | Out-Null
Copy-Item -LiteralPath (Join-Path $RepoRoot 'meta-ads\SKILL.md') -Destination (Join-Path $MainTarget 'SKILL.md') -Force
Copy-Item -LiteralPath (Join-Path $RepoRoot 'meta-ads\references') -Destination (Join-Path $MainTarget 'references') -Recurse -Force
Copy-Item -LiteralPath (Join-Path $RepoRoot 'scripts') -Destination (Join-Path $MainTarget 'scripts') -Recurse -Force
Copy-Item -LiteralPath (Join-Path $RepoRoot 'requirements.txt') -Destination (Join-Path $MainTarget 'requirements.txt') -Force

Get-ChildItem -LiteralPath (Join-Path $RepoRoot 'skills') -Directory | ForEach-Object {
    $Target = Join-Path $SkillRoot $_.Name
    Copy-Item -LiteralPath $_.FullName -Destination $Target -Recurse -Force
}

Copy-Item -Path (Join-Path $RepoRoot 'agents\*.md') -Destination $AgentRoot -Force

python -m pip install -r (Join-Path $MainTarget 'requirements.txt')
python -m playwright install chromium

Write-Host '[OK] Meta Ads for Codex installed.' -ForegroundColor Green
Write-Host "Skills: $SkillRoot"
Write-Host "Agents: $AgentRoot"
Write-Host 'Restart Codex or start a new task before using the skills.'
