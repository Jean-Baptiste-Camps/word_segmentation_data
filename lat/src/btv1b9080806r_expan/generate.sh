#!/bin/bash
#############
#For now, with dev boudams: 
#convert("datasets/btv1b9080806r_expan/*.txt", "datasets/btv1b9080806r_expan/out", max_char_length=150, random_keep=0, noise_char_random=0)
# from boudams.dataset.base
# split("datasets/btv1b9080806r_expan/out/train_DixFolios.txt", "datasets/btv1b9080806r_expan/split", (1, 0,0), 150)
# split("datasets/btv1b9080806r_expan/out/dev_DixFolios.txt", "datasets/btv1b9080806r_expan/split", (0, 1,0), 150)
# split("datasets/btv1b9080806r_expan/out/test_Folio11.txt", "datasets/btv1b9080806r_expan/split", (0, 0, 1), 150)
# check("./datasets/btv1b9080806r_expan/split", (1,1,1), 150)
#############
#cp gt/train_DixFolios.txt ../../tsv/btv1b9080806r_expan/train.tsv
#cp gt/dev_DixFolios.txt ../../tsv/btv1b9080806r_expan/dev.tsv
#cp gt/test_Folio11.txt ../../tsv/btv1b9080806r_expan/test.tsv
