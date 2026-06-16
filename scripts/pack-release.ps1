# -*- coding: utf-8 -*-
# Build Release and pack install zip for GitHub Releases.
# Usage: .\scripts\pack-release.ps1 [-TarkovDir "U:\Games\EscapeFromTarkov4\"]

param(
    [string]$TarkovDir = "",
    [string]$Version = "1.0.0"
)

function Write-Utf8File {
    param([string]$Path, [string]$Content)
    $utf8 = New-Object System.Text.UTF8Encoding $false
    [System.IO.File]::WriteAllText($Path, $Content, $utf8)
}

$ErrorActionPreference = "Stop"
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$RepoRoot = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$ReleaseRoot = Join-Path (Split-Path -Parent $RepoRoot) "GamePanelHUDHitFikaFix-release"
$Csproj = Join-Path $RepoRoot "GamePanelHUDHitFikaFix.csproj"

Write-Host "=== Build ===" -ForegroundColor Cyan
$buildArgs = @("build", $Csproj, "-c", "Release", "--nologo")
if ($TarkovDir) {
    $buildArgs += "-p:TarkovDir=$TarkovDir"
}
& dotnet @buildArgs
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }

$Dll = Join-Path $RepoRoot "bin\Release\GamePanelHUDHitFikaFix.dll"
if (-not (Test-Path $Dll)) {
    Write-Error "DLL not found: $Dll"
}

$Stamp = Get-Date -Format "yyyy-MM-dd"
$ZipName = "GamePanelHUDHitFikaFix_v${Version}.zip"
$StageDir = Join-Path $ReleaseRoot "stage"
$PluginsDir = Join-Path $StageDir "BepInEx\plugins"

if (Test-Path $StageDir) { Remove-Item $StageDir -Recurse -Force }
New-Item -ItemType Directory -Path $PluginsDir -Force | Out-Null

Copy-Item $Dll (Join-Path $PluginsDir "GamePanelHUDHitFikaFix.dll")

$installEn = @"
# GamePanelHUD Hit Fika Fix v$Version

Extract to EscapeFromTarkov root (next to EscapeFromTarkov.exe).

Requires: Game Panel HUD 3.4+, Kmy Tarkov Api 1.5+, Project Fika.
Install on every Fika client in coop.

Log check: [HIT_FIKA_FIX] Patched ObservedPlayer.ApplyClientShot
"@

$installRu = @"
# GamePanelHUD Hit Fika Fix v$Version

Распаковать в корень EscapeFromTarkov (рядом с EscapeFromTarkov.exe).

Нужно: Game Panel HUD 3.4+, Kmy Tarkov Api 1.5+, Project Fika.
Ставить на каждый Fika-клиент в coop.

Проверка в логе: [HIT_FIKA_FIX] Patched ObservedPlayer.ApplyClientShot
"@

Write-Utf8File -Path (Join-Path $StageDir "INSTALL_EN.md") -Content $installEn
Write-Utf8File -Path (Join-Path $StageDir "INSTALL_RU.md") -Content $installRu
Copy-Item (Join-Path $RepoRoot "CHANGELOG.md") (Join-Path $StageDir "CHANGELOG.md") -ErrorAction SilentlyContinue

if (-not (Test-Path $ReleaseRoot)) {
    New-Item -ItemType Directory -Path $ReleaseRoot -Force | Out-Null
}

$ZipPath = Join-Path $ReleaseRoot $ZipName
if (Test-Path $ZipPath) { Remove-Item $ZipPath -Force }

Add-Type -AssemblyName System.IO.Compression.FileSystem
[System.IO.Compression.ZipFile]::CreateFromDirectory($StageDir, $ZipPath)

Remove-Item $StageDir -Recurse -Force

$readmeRelease = @"
# GamePanelHUDHitFikaFix - Release package

**EN:** Install zip for players. Extract to EscapeFromTarkov root.

**RU:** Установочный архив. Распаковать в корень EscapeFromTarkov.

## Files

- $ZipName
- INSTALL_EN.md / INSTALL_RU.md
"@

Write-Utf8File -Path (Join-Path $ReleaseRoot "README.md") -Content ($readmeRelease + "`n")

Write-Host ""
Write-Host "=== Done ===" -ForegroundColor Green
Write-Host "Zip: $ZipPath"
Write-Host "Size: $([math]::Round((Get-Item $ZipPath).Length / 1KB, 1)) KB"
