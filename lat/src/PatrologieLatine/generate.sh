#!/bin/bash
boudams dataset convert plain-text ./gt ./PLnettoye/*.txt --max_char_length 150 --random_keep 0 --noise_char_random 0
boudams dataset generate ../../tsv/PL gt/*.txt  --max_char_length 150 --train 0.9 --test 0.05

