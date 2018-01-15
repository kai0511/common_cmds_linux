# common used shell commands 

## AWK

### Some Basic Usage

``` shell
awk ‘{print “word”,$0}’ file.txt
```
add "word" at the begining of each line

- awk -F '|' '{print $2}' file.txt # extract the second field

- awk -F '|' '$2~/268435456/' file.txt # filter out the line whose second field contains specific characters, , see the second the line

- awk -F '|' '$2~/’”$var”’/' file.txt  - variables could be used, but var must be defined somewhere before, please notice that ''' is used to indicate variable used

awk -F '|' '{printf "\047%s\047\n" ,$2}' file.txt #






