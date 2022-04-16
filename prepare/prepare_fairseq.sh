CUDA_VERSION=$1
rm -rf fairseq
pip install torch==1.10.1+$CUDA_VERSION torchvision==0.11.2+$CUDA_VERSION torchaudio==0.10.1 -f https://download.pytorch.org/whl/torch_stable.html
git clone https://github.com/pytorch/fairseq.git
cd fairseq
pip install --editable .
python setup.py build develop
cd ../
rm -rf apex
git clone https://github.com/NVIDIA/apex
cd apex
pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" \
  --global-option="--deprecated_fused_adam" --global-option="--xentropy" \
  --global-option="--fast_multihead_attn" ./