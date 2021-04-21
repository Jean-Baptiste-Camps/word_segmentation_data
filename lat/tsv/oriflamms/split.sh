#!/bin/bash
shuf oriflamms_abbr.tsv | split -a1 -d -l $(( $(wc -l <oriflamms_abbr.tsv ) * 80 / 100 )) - output
split output1 -a1 -d -l $(( $(wc -l <output1 ) * 51 / 100 ))
mv output0 train.tsv
mv x0 dev.tsv
mv x1 test.tsv
rm output1

