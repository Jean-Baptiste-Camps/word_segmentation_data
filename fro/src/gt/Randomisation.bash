#/bin/b ash	-------⌫--|
# Mis e enp l ace	-⌫---⌫|-|-⌫-⌫--|
on nettoye	-|------|
#rmtrai n/train.tabdeu/ deu.tab test/tes t.tab	--|----⌫----------|----⌫------|--------⌫----|
#On est partis	--|--|-----|
foriin *.tsudo	--||-|----|-|
printf\n>>	-----|-|-|
train /train.tab	-----⌫---------|
printf\n>>deu/deu.tab	-----|-|-|----------|
printf\n>>test/test. tab	-----|-|-|----------⌫--|
#oncal cule lenombretotal	--|---⌫---|-|-----|----|
readlines fi lename<<<	---|----|--⌫-----|--|
#10%decelle s-ci	---|-|-----⌫---|
pourcentage=$(($lin es / $diu ))	-------------------⌫-||---|-|
#O nprendun	--⌫|----|-|
no mbrealéatoire	--⌫---|---------|
entre1et lenombr etot aldelignes	----||-|-|-----⌫|---⌫-|-|-----|
#(moins20% pou rne	|-----|--|---⌫|-|
pasde ́borderdufichi er)	--|--⌫------|-|-----⌫--|
alea=$ (s huf -i	------⌫--⌫--|-|
1-$(($lin es-($pourcent age*2)))	----|----⌫-||----------⌫-------|
#ech o $alea	----⌫|----|
#On pr enddeux	--|--⌫--|---|
p ortions de1 0%-consécut iueshélas	-⌫------|-|-⌫-||---------⌫---|-----|
#Onpourrait amélioreren en	|-|-------|---------|-|-|
prenantà 2endroitsdi f f ére nts	------|-||-------|--⌫-⌫-⌫----⌫--|
#Iem etsc equip re ́c ède	--|-⌫--|-⌫|--|-⌫--⌫--⌫---|
monalé adanstrain	--|----⌫|---|----|
hea d -n$al ea$i>>train/train.tab	---⌫|-|---⌫-|-|-|--------------|
#Le s 10% quisuiuen tdans deu	---⌫|--|--|------⌫|---|--|
$(($a lea+ $pourcentage) ) $i |tail	-----⌫--||-------------⌫|-||---|
- n$pourc entage>>deu/deu.tab	-⌫|------⌫-----|-|----------|
#Les 10%qui	---|--|--|
suiuent dans test	------|---|---|
head-n$ (($alea +$pourcentage + $pourcentage ) )$i	---|-|-⌫------||-----------||------------⌫-⌫|-|
|tail- n $pourcentage>>test/t e st.tab	|---|-⌫|-----------|-|------⌫-⌫-----|
#Ce quireste ànouueau	--|--|----|-|------|
reste=$(($lines-($a l e a+$pource n tage +$pourcentage)	--------------||---⌫-⌫-⌫||-------⌫-⌫---||------------|
pr i ntf \n >> train/ train.tab	--⌫-⌫--|-|-|------⌫--------|
tail-n$reste $i >>train/ t rai n.tab	---|-|-----|-|-|------⌫-⌫---⌫----|
#Etma in tenantquelques u érificat ions	--|--⌫--⌫-----|-------|-⌫---------⌫---|
readlinesTrainfilename <<< $ (w c- l	---|---------|-------|--|-⌫--⌫|-⌫|
tr ain/ train.t ab)	--⌫----⌫-------⌫--|
readlinesDeu	---|-------|
f ilen ame <<<$ ( wc-ldeu/d eu.tab)	-⌫----⌫--|--|-⌫-⌫-|-|-----⌫------|
readlinesTestfilename << < $(wc-ltest/test.tab)	---|--------|-------|--⌫|---|-|-------------|
total=$(($linesTr ain+ $ linesDe u +$line sTest))	-----------------⌫--||-⌫-------⌫|------⌫------|
printfTotal de s lign es $to ta l\n	-----|----|--⌫|----⌫-|---⌫--⌫--|
printfTrain$li nesTrai nsoite nuiron	-----|----|---⌫-------⌫|---|-⌫-----|
$(($linesTrain * 100/	-------------||--||
$ tot al))\n	-⌫---⌫-----|
printfDeu$linesDeusoit enuiron	-----|--|--------|---|------|
$(($line sDeu *100 /$ t otal))\ n	--------⌫---||--||-⌫-⌫---|---⌫|
p rin tfTes t $linesTestsoit	-⌫---⌫-|---⌫|---------|---|
enuiron$(($linesTest* 100/ $t otal	------|------------||--||--⌫---|
