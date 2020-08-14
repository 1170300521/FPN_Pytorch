#!/bin/bash
cd /opt/data/private/terminal/FPN_Pytorch
source  ~/anaconda3/etc/profile.d/conda.sh

export PATH=/opt/data/private/cuda-9.0/bin:$PATH
export LD_LIBRARY_PATH=/opt/data/private/cuda-9.0/lib64:$LD_LIBRARY_PATH
nvcc --version

conda activate th1.1

python trainval_net.py exp_name --dataset coco --net res101 --bs 2 --nw 4 --lr 1e-3 --epochs 12 --save_dir weights --cuda --use_tfboard True
python test_net.py exp_name --dataset coco --net res101 --checksession 1 --checkepoch 11 --checkpoint 117265 --cuda --load_dir weights
conda deactivate 
