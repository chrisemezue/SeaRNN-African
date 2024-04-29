#!/bin/bash

# The commands to reproduce the NMT results obtained in the paper follow:

OUTPUT_PATH='/home/mila/c/chris.emezue/scratch/searnn-output'
DATA_ROOT=/home/mila/c/chris.emezue/SeaRNN-African/nmt_data

src=$1
tgt=$2
type=$3

echo '####################'
echo $src
echo $tgt
echo $type
echo '####################'

MAX_ITER=10000

if [ $(type) = 'mle' ]; then
    echo 'mle training'

    # Train MLE with dropout
    python main_seq2seq.py --dataset nmt --dataroot ${DATA_ROOT}/iwlst14_${src}-${tgt}_train_dev.train.pt --loss bleu-smoothed --obj_normalization cell-global --revert_input_sequence --memory_size 256 --memory_size_encoder 256 --rnn_depth 1 --bidirectional --attention --attn_type sum-tanh --optim_method adam --learning_rate 1e-3 --anneal_learning_rate --lr_quantity_to_monitor dataset_specific_val --lr_quantity_mode max --lr_quantity_epsilon 1e-4 --lr_reduce_factor 0.5 --lr_min_value 1e-5  --lr_patience 5000 --lr_cooldown 10000 --lr_quantity_smoothness 1000 --max_iter $MAX_ITER --print_iter 1 --eval_iter 100 --save_iter 100 --eval_size 1500 --log_path ${OUTPUT_PATH}/${src}-${tgt} --dropout 0.3 --objective mle
else
    echo 'l2s training'
    # Train SeaRNN with dropout
    python main_seq2seq.py --dataset nmt --dataroot ${DATA_ROOT}/iwlst14_${src}-${tgt}_train_dev.train.pt --rollin gt --loss bleu-smoothed --reference_policy bleu1-best-suffix --obj_normalization cell-global --revert_input_sequence --memory_size 256 --memory_size_encoder 256 --rnn_depth 1 --bidirectional --attention --attn_type sum-tanh --num_cells_to_rollout 20 --sample_labels_uniform 0 --sample_labels_policy_topk 15 --sample_labels_neighbors 5 --optim_method adam --learning_rate 1e-3 --anneal_learning_rate --lr_quantity_to_monitor dataset_specific_val --lr_quantity_mode max --lr_quantity_epsilon 1e-4 --lr_reduce_factor 0.5 --lr_min_value 1e-5  --lr_patience 5000 --lr_cooldown 10000 --lr_quantity_smoothness 1000 --max_iter $MAX_ITER --print_iter 1 --eval_iter 100 --save_iter 100 --eval_size 1500 --rollout_batch_size 256 --log_path ${OUTPUT_PATH}/${src}-${tgt}-l2s --rollout mixed --objective kl --temperature 200 --dropout 0.3

fi

# Test these models
#python main_seq2seq.py --dataset nmt --dataroot /path/to/iwlst14_de-en_train_test.train.pt --revert_input_sequence --memory_size 256 --memory_size_encoder 256 --rnn_depth 1 --bidirectional --attention --attn_type sum-tanh --max_iter 0 --print_iter 1 --eval_iter 100 --save_iter 100 --eval_size 1500 --checkpoint_file /path/to/checkpoint_file.pth
