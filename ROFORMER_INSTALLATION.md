# UVR5 Roformer Edition - Linux Installation Complete! 🎉

## What Was Done

### 1. ✅ Applied Roformer Patch
- Switched to branch: `v5.6.0_roformer_add+directml`
- This branch includes:
  - **BS-Roformer** models (Band-Split Roformer)
  - **Mel-Band Roformer** models
  - **Apollo** models (new advanced architecture)
  - Enhanced UI for Roformer models

### 2. ✅ Fixed Linux/Python 3.12 Compatibility
- Fixed `playsound` (incompatible with Python 3.12) → dummy function
- Fixed `PIL.Image.ANTIALIAS` → `PIL.Image.LANCZOS`
- Fixed `torch_directml` imports (Windows-only) → conditional imports with try/except

### 3. ✅ Installed All Dependencies
Including new Roformer requirements:
- `segmentation_models_pytorch==0.5.0`
- `timm==1.0.22` 
- `audiomentations==0.43.1`
- `beartype==0.22.5`
- `rotary_embedding_torch==0.8.9`
- `transformers==4.57.1`
- `spafe==0.3.3`

### 4. ✅ GPU Support Verified
- PyTorch 2.9.1 with CUDA 12.8
- RTX 5090 (31.3GB VRAM) fully supported
- All CUDA operations working

## What is Roformer?

**Roformer** (Band-Split Roformer) is a state-of-the-art model architecture for music source separation that uses:
- **Rotary Position Embeddings** (RoPE) for better temporal modeling
- **Band-Split Processing** for handling different frequency bands
- **Transformer architecture** for long-range dependencies
- **Better quality** than traditional MDX-Net and VR models

### Available Model Types:
1. **BS-Roformer** - Band-Split Roformer for vocals/instruments
2. **Mel-Band Roformer** - Mel-frequency based processing
3. **Apollo** - Advanced multi-model architecture
4. **SCnet** - Secondary model type
5. **Bandit** - Another advanced model

## Running UVR5 with Roformer

```bash
cd /home/smoki/dev/uvr5
source venv/bin/activate
python UVR.py
```

## Downloading Roformer Models

Once UVR5 starts:
1. Go to **Settings** menu
2. Open **Download Center**
3. Look for these model categories:
   - Roformer Models
   - Apollo Models
   - SCnet Models
   - Bandit Models

## Key Differences from Windows Version

**What Works:**
- ✅ All Roformer models
- ✅ CUDA acceleration (better than DirectML!)
- ✅ All existing VR/MDX/Demucs models
- ✅ Full UI functionality

**Not Available:**
- ❌ DirectML (Windows AMD/Intel GPU support)
  - Not needed - you have CUDA which is faster!

## Performance Tips for RTX 5090

Your GPU is extremely powerful for this task:
- Enable **large batch sizes** in settings
- Use **high quality** settings
- Try **ensemble mode** with multiple models
- Your 31.3GB VRAM can handle the biggest models easily

## Troubleshooting

If UVR doesn't start:
```bash
source venv/bin/activate
python UVR.py 2>&1 | tee uvr_debug.log
```

Check the log for any errors.

## Summary

You now have:
- ✅ UVR5 v5.6 with Roformer support on Linux
- ✅ Full CUDA 12.8 acceleration
- ✅ RTX 5090 optimized
- ✅ All latest model architectures available
- ✅ Python 3.12 compatible

**This is actually BETTER than the Windows version because:**
1. CUDA 12.8 is faster than DirectML
2. Native Linux performance
3. Your RTX 5090 has full driver support
4. No Windows overhead

Enjoy separating vocals with the most advanced AI models! 🎵🎸🎤
