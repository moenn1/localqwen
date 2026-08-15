#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
# shellcheck source=/dev/null
source "$ROOT_DIR/config/qwen3.8.env"

LLAMA_SERVER="$ROOT_DIR/llama.cpp/build/bin/llama-server"
MODEL_FILE="$ROOT_DIR/$MODEL_PATH"

if [[ ! -x "$LLAMA_SERVER" ]]; then
  echo "llama-server is not built yet: $LLAMA_SERVER" >&2
  exit 1
fi
if [[ ! -f "$MODEL_FILE" ]]; then
  echo "Model is missing: $MODEL_FILE" >&2
  exit 1
fi

exec "$LLAMA_SERVER" \
  --model "$MODEL_FILE" \
  --host "$HOST" \
  --port "$PORT" \
  --ctx-size "$CONTEXT_SIZE" \
  --gpu-layers "$GPU_LAYERS" \
  --parallel "$PARALLEL_SLOTS" \
  --temp "$TEMPERATURE" \
  --top-p "$TOP_P" \
  --top-k "$TOP_K" \
  --min-p "$MIN_P" \
  --presence-penalty "$PRESENCE_PENALTY"
