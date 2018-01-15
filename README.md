# common used shell commands 

## AWK

### Some Basic Usage

- add "word" at the begining of each line
``` awk
awk ‘{print “word”,$0}’ file.txt
```

- extract the second field
``` awk
awk -F '|' '{print $2}' file.txt 
```

- filter out the line whose second field contains specific characters, variables could be used, see the second the line, but var must be defined somewhere before, please notice that the quotation is used to indicate variable used
``` awk 
awk -F '|' '$2~/268435456/' file.txt 
awk -F '|' '$2~/’”$var”’/' file.txt
```

- add quotation aroud specific field
``` awk
awk -F '|' '{printf "\047%s\047\n" ,$2}' file.txt
```

- print lines from 2 to 5
``` awk
awk 'NR==2,NR==5{print $0}' file.txt
```

### Advanced Usage
- use mode operation to direct text to different files 
``` awk
awk -F'|' '{if($2%127==0){print $0>>"0.txt"} else if($2%127==1){print $0>>"1.txt"}}' file.txt
awk -F"|" '{a=($2%127); print $0>>a}' file.txt
```

- count the ocurrence
``` awk
awk -F"|" '{a[$2]++}END{for(i in a)print i,a[i]}' file.txt
```

- print those line whose specific field ocurres more than once
``` awk
awk –F’|’ ‘a[$2]++’ file.txt
```

- print those line whose specific field ocurres only once
``` awk
awk –F’|’ ‘!a[$2]++’ file.txt
```

- intersection between two files
``` awk
awk 'NR==FNR{a[$1]++} NR>FNR {if($1 in a) print $0}' file_a.txt file_b.txt
```

- group by according specific field and find the intersection with another file
``` awk
awk 'NR==FNR{b[$1]+=$2;a[$1]++} NR>FNR {if($1 in a) print $0,b[$1]}' file_a.txt file_b.txt
```

- concatenate two files, similar ```paste``` command
``` awk
awk 'NR==FNR {a[FNR]=$0} NR>FNR { print $0,a[FNR]}' file_a.txt file_b.txt
```

- complementation
``` awk
awk -F"|" 'NR==FNR{a[$0]++} NR>FNR {if(!($0 in a)) print $0}' file_a.txt file_b.txt > file_c.log
```

### examples
- count the occurrence of word in a file
``` awk 
awk '{
         for(i=1;i<=NF;i++){
             a[$i]+=1
         }
     }END 
     {
         for(i in a) print i, a[i]
     }' words.txt | sort -n -k 2 -r -t " "
```

- transpose a file, [here](https://leetcode.com/problems/transpose-file/)
``` awk
awk '{
        for(i=1;i<=NF;i++){
            if(NR == 1){  
                arr[i]=$i;
            }else{  
                arr[i]=arr[i]" "$i;
            }  
        }
    }
    END{
        for(i in arr) print arr[i]
    }' file.txt
```

- check whether a valid tel. number, [here](https://leetcode.com/problems/valid-phone-numbers/) 
``` awk
awk '$0 ~ /^[0-9]{3}-[0-9]{3}-[0-9]{4}$/ || $0 ~ /^\([0-9]{3}\)\s[0-9]{3}-[0-9]{4}$/ {print $0}' file.txt
```

- tenth line, [here](https://leetcode.com/problems/tenth-line/)
``` awk
awk 'FNR==10 {print $0}' file.txt
```

