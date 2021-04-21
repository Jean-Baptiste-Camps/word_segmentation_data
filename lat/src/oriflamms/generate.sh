#!/bin/bash
boudams dataset convert plain-text ./gt txt/*.txt --max_char_length 150 --random_keep 0 --noise_char_random 0
boudams dataset generate ../../tsv/oriflamms gt/*.txt  --max_char_length 150

