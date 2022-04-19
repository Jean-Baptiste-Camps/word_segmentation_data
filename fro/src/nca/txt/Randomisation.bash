#!/bin/bash
#Mise en place, on nettoye
#rm train/train.tab dev/dev.tab test/test.tab
#On est partis
for i in *.tsv; do
    printf "\n" >> train/train.tab;
    printf "\n" >> dev/dev.tab;
    printf "\n" >> test/test.tab;
    #on calcule le nombre total de lignes
    read lines filename <<< $(wc -l $i);
    div=10;
    #10% de celles-ci
    pourcentage=$(($lines / $div ));
    #On prend un nombre aléatoire entre 1 et le nombre total de lignes
    # (moins 20% pour ne pas déborder du fichier)
    alea=$(shuf -i 1-$(( $lines - ($pourcentage*2))) -n 1);
    #echo $alea
    #On prend deux portions de 10% - consécutives, hélas, mais bon. 
    # On pourrait améliorer en en prenant à 2 endroits différents
    #Je mets ce qui précède mon aléa dans train
    head -n $alea $i >> train/train.tab;
    #Les 10% qui suivent dans dev
    head -n $(($alea + $pourcentage)) $i | tail -n $pourcentage >> dev/dev.tab;
    #Les 10% qui suivent dans test
    head -n $(($alea + $pourcentage + $pourcentage)) $i | tail -n $pourcentage >> test/test.tab;
    #Ce qui reste à nouveau dans train
    reste=$(($lines - ($alea + $pourcentage + $pourcentage) ))
    printf "\n" >> train/train.tab;
    tail -n $reste $i >> train/train.tab;
done
#Et maintenant quelques vérifications:
read linesTrain filename <<< $(wc -l train/train.tab);
read linesDev filename <<< $(wc -l dev/dev.tab);
read linesTest filename <<< $(wc -l test/test.tab);
total=$(($linesTrain + $linesDev +$linesTest));
printf "Total des lignes: $total\n";
printf "Train: $linesTrain, soit environ $(($linesTrain  * 100 / $total))\n";
printf "Dev: $linesDev, soit environ $(($linesDev * 100 / $total ))\n";
printf "Test: $linesTest, soit environ $(($linesTest * 100 / $total ))\n";
