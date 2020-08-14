#!/bin/bash
cd /opt/data/private/terminal/FPN_Pytorch
source ~/anaconda3/etc/profile.d/conda.sh 

export PATH=/opt/data/private/cuda-9.0/bin:$PATH
export LD_LIBRARY_PATH=/opt/data/private/cuda-9.0/lib64:$LD_LIBRARY_PATH
nvcc --version

echo "before load fpn"
conda activate fpn
echo "after load fpn"
python test_net.py exp_name --dataset pascal_voc --net res101 --checksession 1 --checkepoch 11 --checkpoint 5010 --cuda --load_dir weights
conda deactivate
