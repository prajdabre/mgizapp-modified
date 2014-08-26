#!/bin/bash

MGIZA=/home/raj/Downloads/mgizapp/
mkdir corpus
mkdir giza.fwd
mkdir giza.inv
cp $1 $2 corpus/

$MGIZA/bin/plain2snt corpus/$1 corpus/$2
$MGIZA/bin/mkcls -n1 -c100 -pcorpus/$1  -Vcorpus/$1.vcb.classes
$MGIZA/bin/mkcls -n1 -c100 -pcorpus/$2  -Vcorpus/$2.vcb.classes
$MGIZA/bin/snt2cooc corpus/$1_$2.cooc corpus/$2.vcb corpus/$1.vcb corpus/$1_$2.snt
$MGIZA/bin/snt2cooc corpus/$2_$1.cooc corpus/$1.vcb corpus/$2.vcb corpus/$2_$1.snt
$MGIZA/bin/mgiza configgiza.fwd -outputfileprefix giza.fwd/$1_$2.dict -coocurrencefile corpus/$1_$2.cooc -corpusfile corpus/$1_$2.snt -targetvocabularyfile corpus/$2.vcb -sourcevocabularyfile corpus/$1.vcb
$MGIZA/bin/mgiza configgiza.rev -outputfileprefix giza.inv/$2_$1.dict -coocurrencefile corpus/$2_$1.cooc -corpusfile corpus/$2_$1.snt -targetvocabularyfile corpus/$1.vcb -sourcevocabularyfile corpus/$2.vcb
