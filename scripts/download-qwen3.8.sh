#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
MODEL_DIR="$ROOT_DIR/models"
MODEL_FILE="$MODEL_DIR/Qwen3.8-27B-UD-Q4_K_XL.gguf"
MODEL_URL="https://huggingface.co/unsloth/Qwen3.8-27B-GGUF/resolve/main/Qwen3.8-27B-UD-Q4_K_XL.gguf"

mkdir -p "$MODEL_DIR"
echo "Downloading to $MODEL_FILE (safe to re-run; curl resumes partial downloads)."
exec curl --fail --location --continue-at - --output "$MODEL_FILE" "$MODEL_URL"
