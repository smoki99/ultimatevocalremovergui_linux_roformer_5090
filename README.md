# UVR5 Fork — `linux_roformer_5090_support`

<img src="https://raw.githubusercontent.com/Anjok07/ultimatevocalremovergui/master/gui_data/img/UVR_v5.6.png?raw=true" />

**This is a Linux-optimized fork of [Ultimate Vocal Remover GUI v5.6](https://github.com/Anjok07/ultimatevocalremovergui) with Roformer support, tested on NVIDIA RTX 5090 Ti (32GB VRAM).**

## About This Fork

This fork focuses on:
- **Linux-first** installation and usage (Ubuntu/Debian-based systems)
- **Python 3.12** compatibility fixes
- **NVIDIA RTX 5090 Ti** GPU optimization (CUDA 12.8)
- **Roformer** model support with all dependencies
- Simplified requirements for tested Linux environments

Based on [Anjok07/ultimatevocalremovergui v5.6.0](https://github.com/Anjok07/ultimatevocalremovergui) — original core developers:
- [Anjok07](https://github.com/anjok07)
- [aufr33](https://github.com/aufr33)

**Support the original project:** [Donate](https://www.buymeacoffee.com/uvr5)

## Quickstart (Linux)

### Prerequisites
- **OS:** Ubuntu 22.04+ or compatible Debian-based Linux
- **GPU:** NVIDIA GPU with CUDA support (tested on RTX 5090 Ti with 32GB VRAM)
- **Python:** 3.12.x
- **System packages:** `ffmpeg`, `python3-pip`, `python3-tk`, `python3-venv`

### Installation

1. **Install system dependencies:**
   ```bash
   sudo apt update && sudo apt upgrade -y
   sudo apt install -y ffmpeg python3-pip python3-tk python3-venv
   ```

2. **Clone this repository:**
   ```bash
   git clone https://github.com/smoki99/ultimatevocalremovergui_linux_roformer_5090.git
   cd ultimatevocalremovergui_linux_roformer_5090
   ```

3. **Create and activate virtual environment:**
   ```bash
   python3 -m venv venv
   source venv/bin/activate
   ```

4. **Install PyTorch with CUDA 12.8 support:**
   ```bash
   pip install torch==2.9.1 torchvision torchaudio --index-url https://download.pytorch.org/whl/cu128
   ```

5. **Install remaining dependencies:**
   ```bash
   pip install -r requirements.txt
   ```

6. **Run UVR:**
   ```bash
   python UVR.py
   ```

### Model Downloads

Models are **not included** in this repository to keep the size manageable. Download models through the GUI:
- Launch UVR (`python UVR.py`)
- Click **"Download Center"** in the GUI
- Select and download the models you need (Roformer, MDX-Net, Demucs, VR Architecture, etc.)

Models will be saved to `models/` directory automatically.

### GPU Notes (RTX 5090 Ti)

- **32GB VRAM** allows processing large files with high segment/window sizes
- GPU acceleration is enabled by default for all compatible models
- For optimal performance, use these settings:
  - **Segment Size:** 512 (or higher for large VRAM)
  - **Batch Size:** 16-32 (adjust based on model and file size)
  - Enable **GPU Conversion** in settings (enabled by default)

### Roformer Support

This fork includes full support for Roformer models with required dependencies:
- `transformers==4.57.1`
- `timm==1.0.22`
- `rotary_embedding_torch==0.8.9`

Roformer models can be downloaded via the Download Center in the GUI.

## About the Original Project

Ultimate Vocal Remover GUI uses state-of-the-art source separation models to remove vocals from audio files. The core developers trained all models provided (except Demucs v3 and v4 4-stem models).

### Key Features
- Multiple AI architectures: VR Architecture, MDX-Net, Demucs, Roformer
- GPU acceleration for faster processing
- Batch processing support
- Ensemble mode for combining models
- Time-stretch and pitch-shift tools (requires Rubber Band)

## Troubleshooting

### Common Issues

- **FFmpeg errors:** Ensure `ffmpeg` is installed: `sudo apt install ffmpeg`
- **CUDA/GPU not detected:** Verify PyTorch CUDA installation:
  ```bash
  python -c "import torch; print(torch.cuda.is_available())"
  ```
  Should return `True`. If not, reinstall PyTorch with CUDA 12.8 support.
- **Memory allocation errors:** Lower segment/window sizes in settings
- **Import errors:** Ensure virtual environment is activated: `source venv/bin/activate`

### Issue Reporting

For issues specific to this Linux fork, please check the repository issues page.

For general UVR issues, refer to the [original repository](https://github.com/Anjok07/ultimatevocalremovergui/issues).

## License

The **Ultimate Vocal Remover GUI** code is [MIT-licensed](LICENSE). 

- **Please Note:** This fork maintains the same MIT license as the original project. For all third-party application developers who wish to use the original models, please honor the MIT license by providing credit to UVR and its developers.

## Credits

### Original UVR Credits
- [ZFTurbo](https://github.com/ZFTurbo) - Created & trained the weights for the new MDX23C models.
- [DilanBoskan](https://github.com/DilanBoskan) - Your contributions at the start of this project were essential to the success of UVR. Thank you!
- [Bas Curtiz](https://www.youtube.com/user/bascurtiz) - Designed the official UVR logo, icon, banner, and splash screen.
- [tsurumeso](https://github.com/tsurumeso) - Developed the original VR Architecture code.
- [Kuielab & Woosung Choi](https://github.com/kuielab) - Developed the original MDX-Net AI code.
- [Adefossez & Demucs](https://github.com/facebookresearch/demucs) - Developed the original Demucs AI code.
- [KimberleyJSN](https://github.com/KimberleyJensen) - Advised and aided the implementation of the training scripts for MDX-Net and Demucs. Thank you!
- [Hv](https://github.com/NaJeongMo/Colab-for-MDX_B) - Helped implement chunks into the MDX-Net AI code. Thank you!

## Contributing

- This is a fork focused on Linux compatibility and optimization. For contributions to the original UVR project, please visit the [original repository](https://github.com/Anjok07/ultimatevocalremovergui).
- For Linux-specific improvements or fixes, feel free to submit pull requests to this fork.

## References
- [1] Takahashi et al., "Multi-scale Multi-band DenseNets for Audio Source Separation", https://arxiv.org/pdf/1706.09588.pdf
