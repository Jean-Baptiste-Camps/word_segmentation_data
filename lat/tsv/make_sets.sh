#!/bin/bash
# btv and Oriflamms
cat oriflamms/* btv1b9080806r_paper/train.tsv >> exper2_train.tsv
cat exper2_train.tsv PL/* >> exper3_train.tsv
#cat */train.tsv */unknown.tsv > train.tsv
#cat */dev.tsv > dev.tsv
#cat */test.tsv > test.tsv
