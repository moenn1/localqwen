$ErrorActionPreference = 'Stop'

$rootDir = Split-Path -Parent $PSScriptRoot
$config = Import-PowerShellDataFile (Join-Path $rootDir 'config/qwen3.8.psd1')
$llamaServer = Join-Path $rootDir 'llama.cpp/build/bin/Release/llama-server.exe'
if (-not (Test-Path $llamaServer)) {
    $llamaServer = Join-Path $rootDir 'llama.cpp/build/bin/llama-server.exe'
}
$modelFile = Join-Path $rootDir $config.ModelPath

if (-not (Test-Path $llamaServer)) { throw "llama-server is not built yet: $llamaServer" }
if (-not (Test-Path $modelFile)) { throw "Model is missing: $modelFile" }

& $llamaServer `
    --model $modelFile `
    --host $config.Host `
    --port $config.Port `
    --ctx-size $config.ContextSize `
    --gpu-layers $config.GpuLayers `
    --parallel $config.ParallelSlots `
    --temp $config.Temperature `
    --top-p $config.TopP `
    --top-k $config.TopK `
    --min-p $config.MinP `
    --presence-penalty $config.PresencePenalty
