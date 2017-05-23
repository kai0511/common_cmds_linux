 # download all pdf files in 1 depth from the link and put them directly under current folder
 wget -A pdf -r -l 1 -nd http://people.eecs.berkeley.edu/~jordan/prelims/  
 
 # Continue getting a partially-downloaded file
 wget -c ftp://ftp.ncbi.nlm.nih.gov/geo/series/GSE92nnn/GSE92742/suppl/GSE92742_Broad_LINCS_Level5_COMPZ.MODZ_n473647x12328.gctx.gz
 
 # merge mutiple pdf files into one, the last one is the output file.
  pdfunite chapter2.pdf chapter3.pdf itpm.pdf
