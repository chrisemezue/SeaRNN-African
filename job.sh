#!/bin/bash
module load python/3.5
module load cuda/9.0 
source ~/scratch/searnn-env/bin/activate

#virtualenv --system-site-packages ~/scratch/searnn-env

cd /home/mila/c/chris.emezue/SeaRNN-African
# Start training
bash scripts/training.sh en ibo
# bash scripts/training.sh fr bbj
# bash scripts/training.sh fr ewe