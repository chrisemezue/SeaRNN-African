import json
import os,sys
import parser
import pandas as pd
import argparse
import glob


SAVE_PATH='/home/mila/c/chris.emezue/SeaRNN-African/nmt_data'
FOLDER = '/home/mila/c/chris.emezue/SeaRNN-African/data/'
files = glob.glob(f'{FOLDER}/*-*')
def save_to_file(data,filename):
    with open(filename,'w+') as f:
        f.write('\n'.join(data))

for path in files:
    #path = args
    langs = path.split('.')[-1].split('-')
    assert len(langs)==2
    src,tgt = langs[0].strip(),langs[1].strip()

    df = pd.read_csv(path,sep='\t')
    df.dropna(inplace=True)

    src_data = df[src].values.tolist()

    tgt_data = df[tgt].values.tolist()

    assert len(src_data)== len(tgt_data)

    save_to_file(src_data,f'{SAVE_PATH}/{path.split("/")[-1]}.{src}')
    save_to_file(tgt_data,f'{SAVE_PATH}/{path.split("/")[-1]}.{tgt}')
    print(f'ALL DONE FOR {path}...')


