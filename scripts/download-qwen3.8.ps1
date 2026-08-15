$ErrorActionPreference = 'Stop'

$rootDir = Split-Path -Parent $PSScriptRoot
$modelDir = Join-Path $rootDir 'models'
$modelFile = Join-Path $modelDir 'Qwen3.8-27B-UD-Q4_K_XL.gguf'
$modelUrl = 'https://huggingface.co/unsloth/Qwen3.8-27B-GGUF/resolve/main/Qwen3.8-27B-UD-Q4_K_XL.gguf'

New-Item -ItemType Directory -Force -Path $modelDir | Out-Null
Write-Host "Downloading to $modelFile (safe to re-run; curl resumes partial downloads)."
& curl.exe --fail --location --continue-at - --output $modelFile $modelUrl
if ($LASTEXITCODE -ne 0) { exit $LASTEXITCODE }
