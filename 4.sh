#!/bin/bash

#------------ Задача 1 -------------------

#выделяем нужные данные
# cat test.log | grep -E "2013-01-18 12:.*/resume" |grep -P "(\d+\.\d+)" -o > temp.txt;

cat test.log | grep -P "(\d+\.\d+)" -o | sort > temp.txt;


# #общее время успешных обращений
# cat temp.txt | paste -sd+ | bc;

# #среднее значение
# cat temp.txt | awk '{a += $1 } END {print a/NR}';

count_rows=$(cat temp.txt | wc -l);

# middle_row=$(expr $count_rows / 2);

# echo $middle_row;

# #медиана 
# cat temp.txt | sed -n $middle_row"p"; 


# #95 квантиль
kw95=$(echo $count_rows*0.95 | bc | awk '{printf("%d\n",$0+=$0<0?0:0.9)}')

echo "95 quantile: "$(cat temp.txt | sed -n $kw95"p"); 

# #99 квантиль
kw99=$(echo $count_rows*0.99 | bc | awk '{printf("%d\n",$0+=$0<0?0:0.9)}')

echo "99 quantile: "$(cat temp.txt | sed -n $kw99"p"); 


echo $kw95;