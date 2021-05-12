#!/bin/bash
#boudams dataset convert plain-text ./gt *.txt --max_char_length 150 --random_keep 0 --noise_char_random 0
#For now, with dev boudams: 
#convert("datasets/btvbetc/*.txt", "datasets/btvbetc/out", max_char_length=150, random_keep=0, noise_char_random=0)
cp gt/train_DixFolios.txt ../../tsv/btv1b9080806r_abbr/train.tsv
cp gt/dev_DixFolios.txt ../../tsv/btv1b9080806r_abbr/dev.tsv
cp gt/test_Folio11.txt ../../tsv/btv1b9080806r_abbr/test.tsv
