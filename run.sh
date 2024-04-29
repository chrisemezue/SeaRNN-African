#!/bin/bash


for type in 'mle' 'l2s'
do 
    sbatch job.sh fr bbj $type
    sbatch job.sh fr ewe $type
    sbatch job.sh en ibo $type
done