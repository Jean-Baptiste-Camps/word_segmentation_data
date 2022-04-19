#/bin/bash
#Mise en place on nettoye
#rm train/train.tab deu/deu.tab test/test.tab
#On est partis
for i in *.tsu do
    printf \n >> train/train.tab
    printf \n >> deu/deu.tab
    printf \n >> test/test.tab
    #on calcule le nombre total de lignes
    read lines filename <<< $(wc -l $i)
    diu=10
    #10% de celles-ci
    pourcentage=$(($lines / $diu ))
    #On prend un nombre aléatoire entre 1 et le nombre total de lignes
    # (moins 20% pour ne pas déborder du fichier)
    alea=$(shuf -i 1-$(( $lines - ($pourcentage*2))) -n 1)
    #echo $alea
    #On prend deux portions de 10% - consécutiues hélas mais bon. 
    # On pourrait améliorer en en prenant à 2 endroits différents
    #Ie mets ce qui précède mon aléa dans train
    head -n $alea $i >> train/train.tab
    #Les 10% qui suiuent dans deu
    head -n $(($alea + $pourcentage)) $i | tail -n $pourcentage >> deu/deu.tab
    #Les 10% qui suiuent dans test
    head -n $(($alea + $pourcentage + $pourcentage)) $i | tail -n $pourcentage >> test/test.tab
    #Ce qui reste à nouueau dans train
    reste=$(($lines - ($alea + $pourcentage + $pourcentage) ))
    printf \n >> train/train.tab
    tail -n $reste $i >> train/train.tab
done
#Et maintenant quelques uérifications
read linesTrain filename <<< $(wc -l train/train.tab)
read linesDeu filename <<< $(wc -l deu/deu.tab)
read linesTest filename <<< $(wc -l test/test.tab)
total=$(($linesTrain + $linesDeu +$linesTest))
printf Total des lignes $total\n
printf Train $linesTrain soit enuiron $(($linesTrain  * 100 / $total))\n
printf Deu $linesDeu soit enuiron $(($linesDeu * 100 / $total ))\n
printf Test $linesTest soit enuiron $(($linesTest * 100 / $total ))\n
