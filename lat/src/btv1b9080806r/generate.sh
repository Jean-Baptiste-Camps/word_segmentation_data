#!/bin/bash
boudams dataset convert plain-text ./train Abbr_Train10pagesabbr.txt --max_char_length 150 --random_keep 0 --noise_char_random 0
boudams dataset generate ../../tsv/btv1b9080806r_paper train/*.txt  --max_char_length 150 --train 0.9 --test 0.0
# HACK for problem with boudams split - get back one line
cat ../../tsv/btv1b9080806r_paper/test.tsv ../../tsv/btv1b9080806r_paper/train.tsv >> TEMP.TSV
rm ../../tsv/btv1b9080806r_paper/test.tsv
mv TEMP.TSV ../../tsv/btv1b9080806r_paper/train.tsv
# And now test data
boudams dataset convert plain-text ./test Abbr_Testpage11abbr.txt --max_char_length 150 --random_keep 0 --noise_char_random 0
boudams dataset generate . test/*.txt  --max_char_length 150 --train 0.00 --test 0.99999
mv test.tsv ../../tsv/btv1b9080806r_paper/test.tsv
rm *.tsv
