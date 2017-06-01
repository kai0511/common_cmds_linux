 # download all pdf files in 1 depth from the link and put them directly under current folder
 wget -A pdf -r -l 1 -nd http://people.eecs.berkeley.edu/~jordan/prelims/  
 
 # Continue getting a partially-downloaded file
 wget -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE92nnn/GSE92742/suppl/GSE92742_Broad_LINCS_Level5_COMPZ.MODZ_n473647x12328.gctx.gz
 
 # merge mutiple pdf files into one, the last one is the output file.
 pdfunite chapter2.pdf chapter3.pdf itpm.pdf
 
 # sort multiple columns of a file
 # -t the separator of different columns
 # -k sort according which column
 # -nr sort numerically and inversely
 sort -t',' -k2 -nr svm_result.out | awk -F',' '$3==1{print $0}'  # print the row whose third column is 1
 sort -t',' -k2 -nr svm_result.out |awk -F',' 'BEGIN{n=0; printf "no., Drug_cell.line, pred_prob\n"}$3==0{n++; print n","$1","$2}'
 
 # install python packages using pip in a specific directory
 pip2.7 install tensorflow -t ~/.local/lib/python2.7/site-packages/
 pip2.7 install  $TF_BINARY_URL -t ~/.local/lib/python2.7/site-packages/
