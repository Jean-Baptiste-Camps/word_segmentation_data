#!/bin/bash
boudams dataset convert --mode advanced-space sentence ./PLnettoye/*.txt ./gt --mode-ratios "keep-space=.3&fake-space=.10" --min-chars 10
boudams dataset generate --max_char_length 150 --train .9 --test .05 ../../tsv/PL .gt/*.txt

