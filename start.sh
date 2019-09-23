pip install jupyterlab
pip install tensorflow-gpu==2.0.0-beta1 -q

if [ ! -d "$DIRECTORY" ]; then
  git clone https://github.com/HawkAaron/warp-transducer
  export CUDA_HOME=/usr/local/cuda; cd warp-transducer; mkdir build; cd build; cmake -DCUDA_TOOLKIT_ROOT_DIR=$CUDA_HOME -DCMAKE_CXX_FLAGS=-D_GLIBCXX_USE_CXX11_ABI=0 ..; make
  export CUDA_HOME=/usr/local/cuda; cd /content/warp-transducer/tensorflow_binding; python setup.py install
  rm -r warp-transducer
fi

jupyter nbconvert --to python ODT.ipynb
python3 ODT.ipynb
