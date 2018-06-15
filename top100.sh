#!/bin/bash

for d in antidepression antipsycho depressionANDanxiety scz
do
    cd ~/GE_result/$d ||return
    
    for i in svm_result.out glmnet_result.out keras_deep_learning_${d}_prediction.out 
    do 
        f_name=$(echo $i|awk -F'.' '{print $1}'); 
        sort -t',' -k2 -nr $i|\
        awk -F',' 'BEGIN{n=0; printf "no., drug_cell.line, pred_prob\n"}$3==0{n++; print n","$1","$2}'|\
        head -n 101 > "~/GE_result/top100/${d}_${f_name}_top100.csv"; done
done

# skip the first line and sort using intergrated sort in awk
for dir in hypertension diabetes; do
    files=$(ls $(dir)/*Res.csv)
    echo "($dir)/"$files
    for f in files; do
        awk 'NR==1{print $0;next}{print $0|"sort -t',' -k3 -nr"}'  "$(dir)/"$f > "ranked_result/"$(echo $f|awk -F / '{print $2}')
        echo "$(dir)/"$f
    done
done
