# UVR5 Fork — linux_roformer_5090_support

This is a personal fork of Ultimate Vocal Remover GUI (v5.6) maintained to run on Linux systems with Roformer support and tested on an NVIDIA GeForce RTX 5090 Ti (32GB VRAM). The goal of this fork is to provide clean Linux-first install instructions, Roformer compatibility, and to keep the repository free of local virtual environments and model weights (these are downloaded at runtime via the app's Download Center).

Branch: `linux_roformer_5090_support`

Key notes about this fork
- Target platform: Linux (Debian/Ubuntu and Arch-based tested)
- GPU: NVIDIA (tested on RTX 5090 Ti with CUDA/cuDNN)
- Roformer support: included and tested
- This fork intentionally removes Windows-specific instructions and bundles. The repo's `.gitignore` excludes `venv/` and `models/` to avoid committing large binaries and environment files.

If you want the official upstream project, see: https://github.com/Anjok07/ultimatevocalremovergui

## Quickstart — Recommended (tested)
These steps assume you already forked this repo to your GitHub account and cloned your fork locally.

1) Clone your fork and checkout the branch:

```bash
git clone https://github.com/YOUR_USERNAME/ultimatevocalremovergui.git
cd ultimatevocalremovergui
git checkout linux_roformer_5090_support
```

2) Create and activate a Python 3.12 virtual environment (recommended):

```bash
python3.12 -m venv venv
source venv/bin/activate
python -m pip install --upgrade pip setuptools wheel
```

3) Install PyTorch (tested with CUDA 12.8 / cu128). Replace the URL if you need a different CUDA version.

```bash
python -m pip install --upgrade "torch==2.9.1+cu128" --extra-index-url https://download.pytorch.org/whl/cu128
```

4) Install the remaining Python dependencies from this fork's `requirements.txt`:

```bash
pip install -r requirements.txt
```

5) Start the app:

```bash
python UVR.py
```

6) Models: this fork does not commit large model files. Use the app GUI Settings → Download Center to fetch models (Roformer, Apollo, MDX, Demucs, etc.), or place downloaded model files under `models/`.

## Notes & Tips for RTX 5090 Ti
- With 32GB VRAM you can increase model window/segment sizes, use ensembles, or run larger Roformer variants. Monitor GPU usage with `nvidia-smi`.
- If you need a different PyTorch CUDA build, install the appropriate torch wheel per PyTorch instructions.

## What changed in this fork
- Linux-specific fixes to avoid importing Windows-only DirectML packages
- Replaced deprecated Pillow calls for Python 3.12 compatibility
- Wrapped playsound import to avoid failure on systems without that package
- `.gitignore` updated to exclude `venv/` and `models/`

## Troubleshooting
- If pip reports "This environment is externally managed", use a virtual environment (do NOT remove system files).
- If the GPU isn't used, ensure you installed a CUDA-enabled PyTorch wheel (see step 3) and that `torch.cuda.is_available()` returns True.

## License and upstream
This fork preserves the same MIT license as the upstream project. For upstream releases, model credits, and community support please refer to the original repo: https://github.com/Anjok07/ultimatevocalremovergui

---

If you'd like I can also add an automated script `install_linux.sh` that installs the recommended PyTorch wheel and dependencies for your environment.
