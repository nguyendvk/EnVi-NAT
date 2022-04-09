ORG_DATASET=$1
CKP1=$2
CKP2=$3
rm -rf $CKP1 $CKP2
python wordseg_VI.py $ORG_DATASET $CKP1
fairseq-preprocess --source-lang en --target-lang vi \
    --trainpref $CKP1/train --validpref $CKP1/valid --testpref $CKP1/test \
    --destdir $CKP2 \
    --workers 20
