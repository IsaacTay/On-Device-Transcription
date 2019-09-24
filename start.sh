pip3 install jupyterlab -q
pip3 install tensorflow==2.0.0-beta1 -q

if [ ! -d warp-transducer ]; then
  git clone https://github.com/HawkAaron/warp-transducer
  export CUDA_HOME=/usr/local/cuda; cd warp-transducer; mkdir build; cd build; cmake -DCUDA_TOOLKIT_ROOT_DIR=$CUDA_HOME -DCMAKE_CXX_FLAGS=-D_GLIBCXX_USE_CXX11_ABI=0 ..; make
  export CUDA_HOME=/usr/local/cuda; cd ../tensorflow_binding; python3 setup.py install
  cd ../..
fi

jupyter nbconvert --to python ODT.ipynb
python3 ODT.py
