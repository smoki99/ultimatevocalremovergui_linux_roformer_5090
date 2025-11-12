#!/bin/bash
set -e

echo "==================================="
echo "UVR5 Linux + Roformer Installation"
echo "==================================="

# Check Python version
PYTHON_VERSION=$(python3 --version 2>&1 | cut -d' ' -f2 | cut -d'.' -f1,2)
REQUIRED_VERSION="3.10"

if [ "$(printf '%s\n' "$REQUIRED_VERSION" "$PYTHON_VERSION" | sort -V | head -n1)" != "$REQUIRED_VERSION" ]; then
    echo "Error: Python 3.10+ required (found $PYTHON_VERSION)"
    exit 1
fi

echo "✓ Python $PYTHON_VERSION detected"

# Check CUDA
if ! command -v nvidia-smi &> /dev/null; then
    echo "⚠ Warning: nvidia-smi not found. GPU acceleration may not work."
    read -p "Continue anyway? (y/n) " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        exit 1
    fi
else
    echo "✓ NVIDIA GPU detected"
    nvidia-smi --query-gpu=name,driver_version,memory.total --format=csv,noheader | head -n1
fi

# Create venv
if [ ! -d "venv" ]; then
    echo ""
    echo "Creating virtual environment..."
    python3 -m venv venv
    echo "✓ Virtual environment created"
else
    echo "✓ Virtual environment already exists"
fi

# Activate venv
echo ""
echo "Activating virtual environment..."
source venv/bin/activate

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip setuptools wheel -q

# Install PyTorch with CUDA
echo ""
echo "Installing PyTorch with CUDA 12.8..."
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu128

# Install requirements
echo ""
echo "Installing dependencies..."
if [ -f "requirements-lock.txt" ]; then
    echo "Using locked versions for reproducibility..."
    pip install -r requirements-lock.txt
else
    echo "Using flexible versions..."
    pip install -r requirements.txt
fi

# Verify installation
echo ""
echo "==================================="
echo "Verifying installation..."
echo "==================================="

python3 << 'EOF'
import torch
import sys

print(f"Python: {sys.version.split()[0]}")
print(f"PyTorch: {torch.__version__}")
print(f"CUDA Available: {torch.cuda.is_available()}")

if torch.cuda.is_available():
    print(f"CUDA Version: {torch.version.cuda}")
    print(f"GPU: {torch.cuda.get_device_name(0)}")
    print(f"GPU Memory: {torch.cuda.get_device_properties(0).total_memory / 1024**3:.1f} GB")
else:
    print("⚠ Warning: CUDA not available. GPU acceleration will not work.")
EOF

echo ""
echo "==================================="
echo "Installation complete!"
echo ""
echo "To run UVR5:"
echo "  source venv/bin/activate"
echo "  python UVR.py"
echo "==================================="
