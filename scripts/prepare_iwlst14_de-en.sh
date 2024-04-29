#!/bin/bash
DATA_ROOT=/home/mila/c/chris.emezue/SeaRNN-African/nmt_data


# fr-bbj
echo '############################ fr-bbj ############################'
python -m datasets.preprocess_nmt -train_src ${DATA_ROOT}/train.fr-bbj.fr -train_tgt ${DATA_ROOT}/train.fr-bbj.bbj -valid_src ${DATA_ROOT}/dev.fr-bbj.fr -valid_tgt ${DATA_ROOT}/dev.fr-bbj.bbj -save_data ${DATA_ROOT}/iwlst14_fr-bbj_train_dev -lower -shuffle 0 -sort_data 0 -seq_length 50 -src_vocab_size 32009 -tgt_vocab_size 22822
python -m datasets.preprocess_nmt -train_src ${DATA_ROOT}/train.fr-bbj.fr -train_tgt ${DATA_ROOT}/train.fr-bbj.bbj -valid_src ${DATA_ROOT}/test.fr-bbj.fr -valid_tgt ${DATA_ROOT}/test.fr-bbj.bbj -save_data ${DATA_ROOT}/iwlst14_fr-bbj_train_test -lower -shuffle 0 -sort_data 0 -seq_length 50 -src_vocab ${DATA_ROOT}/iwlst14_fr-bbj_train_dev.src.dict -tgt_vocab ${DATA_ROOT}/iwlst14_fr-bbj_train_dev.tgt.dict


# fr-ewe
echo '############################ fr-ewe ############################'
python -m datasets.preprocess_nmt -train_src ${DATA_ROOT}/train.fr-ewe.fr -train_tgt ${DATA_ROOT}/train.fr-ewe.ewe -valid_src ${DATA_ROOT}/dev.fr-ewe.fr -valid_tgt ${DATA_ROOT}/dev.fr-ewe.ewe -save_data ${DATA_ROOT}/iwlst14_fr-ewe_train_dev -lower -shuffle 0 -sort_data 0 -seq_length 50 -src_vocab_size 32009 -tgt_vocab_size 22822
python -m datasets.preprocess_nmt -train_src ${DATA_ROOT}/train.fr-ewe.fr -train_tgt ${DATA_ROOT}/train.fr-ewe.ewe -valid_src ${DATA_ROOT}/test.fr-ewe.fr -valid_tgt ${DATA_ROOT}/test.fr-ewe.ewe -save_data ${DATA_ROOT}/iwlst14_fr-ewe_train_test -lower -shuffle 0 -sort_data 0 -seq_length 50 -src_vocab ${DATA_ROOT}/iwlst14_fr-ewe_train_dev.src.dict -tgt_vocab ${DATA_ROOT}/iwlst14_fr-ewe_train_dev.tgt.dict


# en-ibo
echo '############################ en-ibo ############################'
python -m datasets.preprocess_nmt -train_src ${DATA_ROOT}/train.en-ibo.en -train_tgt ${DATA_ROOT}/train.en-ibo.ibo -valid_src ${DATA_ROOT}/dev.en-ibo.en -valid_tgt ${DATA_ROOT}/dev.en-ibo.ibo -save_data ${DATA_ROOT}/iwlst14_en-ibo_train_dev -lower -shuffle 0 -sort_data 0 -seq_length 50 -src_vocab_size 32009 -tgt_vocab_size 22822
python -m datasets.preprocess_nmt -train_src ${DATA_ROOT}/train.en-ibo.en -train_tgt ${DATA_ROOT}/train.en-ibo.ibo -valid_src ${DATA_ROOT}/test.en-ibo.en -valid_tgt ${DATA_ROOT}/test.en-ibo.ibo -save_data ${DATA_ROOT}/iwlst14_en-ibo_train_test -lower -shuffle 0 -sort_data 0 -seq_length 50 -src_vocab ${DATA_ROOT}/iwlst14_en-ibo_train_dev.src.dict -tgt_vocab ${DATA_ROOT}/iwlst14_en-ibo_train_dev.tgt.dict
