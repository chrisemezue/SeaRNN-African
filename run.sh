#!/bin/bash


for type in 'mle' 'l2s'
do 
    sbatch job.sh fr bbj $type
    sbatch job.sh fr ewe $type
    sbatch job.sh en ibo $type
done



# Submitted batch job 4672546
# Submitted batch job 4672547
# Submitted batch job 4672548
# Submitted batch job 4672549
# Submitted batch job 4672550
# Submitted batch job 4672551