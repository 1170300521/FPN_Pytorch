#!/bin/bash
cd /opt/data/private/terminal/FPN_Pytorch
source ~/anaconda3/etc/profile.d/conda.sh 

export PATH=/opt/data/private/cuda-9.0/bin:$PATH
export LD_LIBRARY_PATH=/opt/data/private/cuda-9.0/lib64:$LD_LIBRARY_PATH
nvcc --version

echo "before load fpn"
conda activate fpn
echo "after load fpn"

python trainval_net.py exp_name --dataset pascal_voc --net res101 --bs 2 --nw 4 --lr 1e-3 --epochs 12 --save_dir weights --cuda --use_tfboard True
conda deactivate
