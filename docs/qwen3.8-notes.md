# Qwen3.8-27B notes

## Chosen quantization

`UD-Q4_K_XL` is the recommended starting point on this 32 GB M1 Pro. Its Hugging Face file size is 16.7 GiB. It should fit in unified memory, leaving room for the operating system and a modest KV cache.

The model advertises a 262,144-token maximum context window, but this machine should start with 8,192 tokens. Context memory grows quickly; raise it only after stable testing.

## Sampling presets

| Mode | Temperature | Top-p | Top-k | Min-p | Presence penalty |
| --- | ---: | ---: | ---: | ---: | ---: |
| Thinking | 1.0 | 0.95 | 20 | 0.0 | 0.0 |
| Instruct / non-thinking | 0.7 | 0.80 | 20 | 0.0 | 1.5 |

The checked-in server config begins with the Thinking preset. For ordinary chat, change `TEMPERATURE`, `TOP_P`, and `PRESENCE_PENALTY` in `config/qwen3.8.env`.

## Storage

Keep at least 25–30 GB free before a model download. Hugging Face may use temporary cache space during the transfer.
