# Platform setup

This project supports macOS, Linux, and Windows through [llama.cpp](https://github.com/ggml-org/llama.cpp). The 27B Q4 model needs roughly 17 GB of RAM/VRAM; 32 GB total memory is the practical starting point.

## macOS (Apple Silicon)

Metal is enabled by default. Install Xcode Command Line Tools, then build:

```sh
git clone https://github.com/ggml-org/llama.cpp.git
cmake -S llama.cpp -B llama.cpp/build -DBUILD_SHARED_LIBS=OFF -DGGML_METAL=ON
cmake --build llama.cpp/build --config Release -j
```

Use `./scripts/download-qwen3.8.sh` and `./scripts/serve-qwen3.8.sh`.

## Linux

Install a C++ compiler, CMake, Git, and libcurl development headers. Then select a backend:

```sh
# NVIDIA GPU (CUDA)
cmake -S llama.cpp -B llama.cpp/build -DBUILD_SHARED_LIBS=OFF -DGGML_CUDA=ON

# CPU-only
cmake -S llama.cpp -B llama.cpp/build -DBUILD_SHARED_LIBS=OFF -DGGML_CUDA=OFF

cmake --build llama.cpp/build --config Release -j
```

Use the same shell scripts as macOS: `./scripts/download-qwen3.8.sh` and `./scripts/serve-qwen3.8.sh`.

## Windows

Install Git, CMake, and Visual Studio 2022 Build Tools with the **Desktop development with C++** workload. In PowerShell:

```powershell
git clone https://github.com/ggml-org/llama.cpp.git
cmake -S llama.cpp -B llama.cpp/build -DBUILD_SHARED_LIBS=OFF
cmake --build llama.cpp/build --config Release
```

For NVIDIA CUDA, install a supported CUDA Toolkit and add `-DGGML_CUDA=ON` to the CMake configuration command. Use the included PowerShell helpers:

```powershell
.\scripts\download-qwen3.8.ps1
.\scripts\serve-qwen3.8.ps1
```

If PowerShell blocks a local script, use `Set-ExecutionPolicy -Scope Process Bypass` for that current session, then run it again.
