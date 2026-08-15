# Local Qwen3.8 setup

This directory is the local home for running `unsloth/Qwen3.8-27B-GGUF` on macOS, Linux, or Windows.

## Hardware

- Darwin / Apple Silicon, Linux, and Windows supported through `llama.cpp`
- 32 GB total or unified memory is the practical starting point for Q4
- Recommended model: `Qwen3.8-27B-UD-Q4_K_XL.gguf` (16.7 GiB)

## Layout

- `llama.cpp/` — upstream inference runtime (generated locally)
- `models/` — downloaded GGUF model files (ignored by Git)
- `config/qwen3.8.env` — reusable server settings
- `scripts/serve-qwen3.8.sh` — starts the local OpenAI-compatible server
- `docs/` — operational notes and troubleshooting

## Start the server

After the model download and build finish:

```sh
./scripts/serve-qwen3.8.sh
```

The server listens only on this host at `http://127.0.0.1:8080` and exposes OpenAI-compatible endpoints under `/v1`.

## Download or resume the model

```sh
./scripts/download-qwen3.8.sh
```

The 16.7 GiB download is resumable. The model file remains local and is excluded from Git.

On Windows PowerShell, use `./scripts/download-qwen3.8.ps1` and `./scripts/serve-qwen3.8.ps1`. See [platform setup notes](docs/platform-setup.md) for build and GPU backend instructions on all supported platforms.

## Useful commands

```sh
# Verify the server is ready
curl http://127.0.0.1:8080/health

# Show the model(s) offered by the API
curl http://127.0.0.1:8080/v1/models
```

## References

- [Unsloth: Qwen3.8 local-running guide](https://unsloth.ai/docs/models/qwen3.8)
- [Qwen3.8 model collection on Hugging Face](https://huggingface.co/collections/Qwen/qwen38)
- [Unsloth Qwen3.8-27B GGUF repository](https://huggingface.co/unsloth/Qwen3.8-27B-GGUF)
