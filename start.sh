pip3 install jupyterlab -q

TF_INSTALL=${TF_INSTALL:-2}
if [ ${TF_INSTALL} -eq 1 ]; then
  pip3 install tensorflow==2.0.0-beta1 -q
elif [ ${TF_INSTALL} -eq 2 ]; then
  pip3 install tensorflow-gpu=2.0.0
fi

if [ ! -d warp-transducer ]; then
  git clone https://github.com/HawkAaron/warp-transducer
  export CUDA_HOME=/usr/local/cuda; cd warp-transducer; mkdir build; cd build; cmake -DCUDA_TOOLKIT_ROOT_DIR=$CUDA_HOME ..; make
  cd ../tensorflow_binding; pip3 install -e .
  cd ../..
fi

jupyter nbconvert --to python ODT.ipynb
python3 ODT.py
