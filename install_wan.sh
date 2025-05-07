#!/bin/bash

# Create a new conda environment
echo "Creating conda environment 'wan_env'..."
conda create -n wan_env python=3.10 -y

# Activate the conda environment
echo "Activating conda environment 'wan_env'..."
conda activate wan_env

# Clone the Wan2.1 repository
echo "Cloning Wan2.1 repository..."
git clone https://github.com/Wan-Video/Wan2.1.git
cd Wan2.1

# Install core dependencies
echo "Installing core dependencies from requirements.txt..."
pip install -r requirements.txt

# Install huggingface_hub[cli] for model downloads
echo "Installing huggingface_hub[cli]..."
pip install huggingface_hub[cli]

# Download the T2V-14B model using huggingface-cli
echo "Downloading the T2V-14B model..."
huggingface-cli download Wan-Video/Wan2.1-T2V-14B --local-dir ./Wan2.1-T2V-14B

# --- Model Download Instructions ---
# The following are instructions for downloading other models listed in the README.
# You can uncomment and modify these lines to download additional models.

# Download the T2V-1.3B model:
# huggingface-cli download Wan-Video/Wan2.1-T2V-1.3B --local-dir ./Wan2.1-T2V-1.3B

# Download the I2V-14B model:
# huggingface-cli download Wan-Video/Wan2.1-I2V-14B --local-dir ./Wan2.1-I2V-14B

# Download the FLF2V-14B model:
# huggingface-cli download Wan-Video/Wan2.1-FLF2V-14B --local-dir ./Wan2.1-FLF2V-14B

# Alternatively, you can use the modelscope library for downloads as described in the README.
# pip install modelscope
# For example, to download T2V-14B using modelscope:
# from modelscope.hub.snapshot_download import snapshot_download
# snapshot_download('Wan-Video/Wan2.1-T2V-14B', cache_dir='./')
# Note: Using modelscope might require a Python script.

# --- End Model Download Instructions ---

echo "Installation and model download complete."
echo "To activate the environment, run: conda activate wan_env"
echo "To run the Gradio demos, navigate to the 'gradio' directory and run the desired script."
echo "For example, to run the T2V-14B demo: python gradio/t2v_14B_singleGPU.py"