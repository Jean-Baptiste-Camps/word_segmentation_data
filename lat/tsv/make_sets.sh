#!/bin/bash
# btv and Oriflamms
rm exper2_train.tsv
rm exper3_train.tsv
cat oriflamms/* btv1b9080806r_abbr/train.tsv >> exper2_train.tsv
cat btv1b9080806r_expan/train.tsv PL/* >> exper3_train.tsv
#cat */train.tsv */unknown.tsv > train.tsv
#cat */dev.tsv > dev.tsv
#cat */test.tsv > test.tsv
