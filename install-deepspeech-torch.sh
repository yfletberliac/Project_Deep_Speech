# This is also available as an AMI in us-east-1d (N. Virginia): ami-cad09edd
#
# Source: https://github.com/SeanNaren/deepspeech.torch/wiki/Installation



# Install various packages
sudo apt-get update
sudo apt-get upgrade -y # choose “install package maintainers version”
sudo apt-get install -y build-essential python-pip python-dev git python-numpy swig python-dev default-jdk zip zlib1g-dev

# Install Torch
git clone https://github.com/torch/distro.git ~/torch --recursive
cd ~/torch; bash install-deps;
./install.sh
cd

# Refresh the env variables (that were set when installing Torch)
source ~/.bashrc

# Install CUDA 7.5
wget http://developer.download.nvidia.com/compute/cuda/7.5/Prod/local_installers/cuda_7.5.18_linux.run
sudo chmod +x ./cuda_7.5.18_linux.run
sudo ./cuda_7.5.18_linux.run

# Set env variables (in .bashrc located at ~/.bashrc)
export PATH=/usr/local/cuda-7.5/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-7.5/lib64:$LD_LIBRARY_PATH

# Refresh (again) the env variables
source ~/.bashrc

# Luarocks installs
luarocks install cutorch
luarocks install cunn
luarocks install cunnx

# Install Baidu warp-ctc library
luarocks install http://raw.githubusercontent.com/baidu-research/warp-ctc/master/torch_binding/rocks/warp-ctc-scm-1.rockspec

# Audio Library for Torch
sudo apt-get install libfftw3-dev
sudo apt-get install sox libsox-dev libsox-fmt-all
luarocks install https://raw.githubusercontent.com/soumith/lua---audio/master/audio-0.1-0.rockspec

# Optim, numeric optimization package for Torch
luarocks install optim

# rnn, Recurrent Neural Network library for Torch
luarocks install rnn

# lua---nnx, an extension to Torch's nn package:
luarocks install nnx

# xlua, a set of useful extensions to Lua
luarocks install xlua

# threads, threads for Lua and LuaJIT
luarocks install threads

# lua---parallel, a (simple) parallel computing framework for Lua
luarocks install parallel

# nngraph, Graph Computation for nn
luarocks install nngraph

# LMDB for Torch used for online training
git clone https://github.com/LMDB/lmdb
cd lmdb/libraries/liblmdb/
make
sudo make install

git clone https://github.com/eladhoffer/lmdb.torch
cd lmdb.torch
luarocks make

# Or do the following on Ubuntu 14.04
sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev

# Several updates
luarocks install cutorch
luarocks install torch
luarocks install nn
luarocks install dpnn

###
# Here install cuDNN V5 through this link https://developer.nvidia.com/cudnn
# Check that libcudnn.so.5 and libcudnn.so are in /usr/local/cuda/lib64/
###

# Set environnement variables
export LD_LIBRARY_PATH=/usr/local/cuda/lib64/libcudnn.so:$LD_LIBRARY_PATH
export CUDNN_PATH=/usr/local/cuda/lib64/libcudnn.so.5

# Install lua bindings for cuDNN R5
luarocks install https://raw.githubusercontent.com/soumith/cudnn.torch/master/cudnn-scm-1.rockspec

# Finally clone the CTCSpeechRecognition repo
git clone https://github.com/SeanNaren/CTCSpeechRecognition.git


