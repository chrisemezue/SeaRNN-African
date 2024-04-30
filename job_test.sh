#!/bin/bash
#SBATCH --job-name=searnn
#SBATCH --gres=gpu:v100:1
#SBATCH --mem=100G
#SBATCH --time=48:00:00
#SBATCH --partition=long
#SBATCH --error=/home/mila/c/chris.emezue/SeaRNN-African/slurm/slurmerror_%j.txt
#SBATCH --output=/home/mila/c/chris.emezue/SeaRNN-African/slurm/slurmoutput_%j.txt


###########cluster information above this line
module load python/3.5
module load cuda/9.0 
source ~/scratch/searnn-env/bin/activate

#virtualenv --system-site-packages ~/scratch/searnn-env
export PYTHONUNBUFFERED=1
cd /home/mila/c/chris.emezue/SeaRNN-African
# Start training
bash scripts/test.sh $1 $2 $3
# bash scripts/training.sh fr bbj
# bash scripts/training.sh fr ewe mle