#!/bin/bash
MGIZA=/home/raj/Downloads/mgizapp/
mkdir new_corpus
mkdir new_giza.fwd
mkdir new_giza.inv
cp $1 $2 new_corpus/

cd new_corpus
$MGIZA/scripts/plain2snt-hasvcb.py ../corpus/$4.vcb ../corpus/$3.vcb $2 $1  $2_$1.snt $1_$2.snt  $2.vcb $1.vcb
$MGIZA/bin/mkcls -n2 -c50 -p$1  -V$1.vcb.classes
$MGIZA/bin/mkcls -n2 -c50 -p$2  -V$2.vcb.classes
$MGIZA/bin/snt2cooc $1_$2.cooc $2.vcb $1.vcb $1_$2.snt
$MGIZA/bin/snt2cooc $2_$1.cooc $1.vcb $2.vcb $2_$1.snt
cd ..
$MGIZA/bin/mgiza configgiza.fwd.new -outputfileprefix new_giza.fwd/$1_$2.dict -coocurrencefile new_corpus/$1_$2.cooc -corpusfile new_corpus/$1_$2.snt -targetvocabularyfile new_corpus/$2.vcb -sourcevocabularyfile new_corpus/$1.vcb -restart 9 -previoust giza.fwd/$3_$4.dict.t3.final -previousa giza.fwd/$3_$4.dict.a3.final -previousd giza.fwd/$3_$4.dict.d3.final -previousn giza.fwd/$3_$4.dict.n3.final -previousd4 giza.fwd/$3_$4.dict.d4.final

$MGIZA/bin/mgiza configgiza.inv.new -outputfileprefix new_giza.inv/$2_$1.dict -coocurrencefile new_corpus/$2_$1.cooc -corpusfile new_corpus/$2_$1.snt -targetvocabularyfile new_corpus/$1.vcb -sourcevocabularyfile new_corpus/$2.vcb -restart 9 -previoust giza.inv/$4_$3.dict.t3.final -previousa giza.inv/$4_$3.dict.a3.final -previousd giza.inv/$4_$3.dict.d3.final -previousn giza.inv/$4_$3.dict.n3.final -previousd4 giza.inv/$4_$3.dict.d4.final
