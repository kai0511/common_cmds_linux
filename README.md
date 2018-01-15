# common used shell commands 

## AWK

### Some Basic Usage

- add "word" at the begining of each line
``` 
awk ‘{print “word”,$0}’ file.txt
```

- extract the second field
```
awk -F '|' '{print $2}' file.txt 
```

- filter out the line whose second field contains specific characters, variables could be used, see the second the line, but var must be defined somewhere before, please notice that the quotation is used to indicate variable used
``` 
awk -F '|' '$2~/268435456/' file.txt 
awk -F '|' '$2~/’”$var”’/' file.txt
```

- add quotation aroud specific field
```
awk -F '|' '{printf "\047%s\047\n" ,$2}' file.txt
```

- print lines from 2 to 5
```
awk 'NR==2,NR==5{print $0}' file.txt
```

### Advanced Usage
- use mode operation to direct text to different files 
```
awk -F'|' '{if($2%127==0){print $0>>"0.txt"} else if($2%127==1){print $0>>"1.txt"}}' file.txt
awk -F"|" '{a=($2%127); print $0>>a}' file.txt
```

- count the ocurrence
```
awk -F"|" '{a[$2]++}END{for(i in a)print i,a[i]}' file.txt
```

- print those line whose specific field ocurres more than once
```
awk –F’|’ ‘a[$2]++’ file.txt
```

- print those line whose specific field ocurres only once
```
awk –F’|’ ‘!a[$2]++’ file.txt
```

- intersection between two files
```
awk 'NR==FNR{a[$1]++} NR>FNR {if($1 in a) print $0}' file_a.txt file_b.txt
```

- group by according specific field and find the intersection with another file
```
awk 'NR==FNR{b[$1]+=$2;a[$1]++} NR>FNR {if($1 in a) print $0,b[$1]}' file_a.txt file_b.txt
```

- concatenate two files, similar ```paste``` command
```
awk 'NR==FNR {a[FNR]=$0} NR>FNR { print $0,a[FNR]}' file_a.txt file_b.txt
```

- complementation
```
awk -F"|" 'NR==FNR{a[$0]++} NR>FNR {if(!($0 in a)) print $0}' file_a.txt file_b.txt > file_c.log
```
