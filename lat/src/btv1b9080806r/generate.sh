#!/bin/bash
#############
#For now, with dev boudams: 
#convert("datasets/btvbetc/*.txt", "datasets/btvbetc/out", max_char_length=150, random_keep=0, noise_char_random=0)
# generate("datasets/btvbetc/split", "datasets/btvbetc/out/train_DixFolios.txt", 150, 1, 0)
# from boudams.dataset.base
# split("datasets/btvbetc/out/train_DixFolios.txt", "datasets/btvbetc/split", (1, 0,0), 150)
# split("datasets/btvbetc/out/dev_DixFolios.txt", "datasets/btvbetc/split", (0, 1,0), 150)
# split("datasets/btvbetc/out/test_Folio11.txt", "datasets/btvbetc/split", (0, 0, 1), 150)
# check("./datasets/btvbetc/split", (1,1,1), 150)
#############
#cp gt/train_DixFolios.txt ../../tsv/btv1b9080806r_abbr/train.tsv
#cp gt/dev_DixFolios.txt ../../tsv/btv1b9080806r_abbr/dev.tsv
#cp gt/test_Folio11.txt ../../tsv/btv1b9080806r_abbr/test.tsv
