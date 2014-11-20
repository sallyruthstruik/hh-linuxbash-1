#!/bin/bash

#------------ Задача 1 -------------------
printf "\nMean and Quantiles of resume code=200 for 18.01\n------------------------------------------------\n"

#выделяем нужные данные
cat test.log | grep -E "2013-01-18 12:.*/resume[^ ]* 200.*" |grep -P "(\d+\.\d+)" -o | sort > temp.txt;

# #общее время успешных обращений
echo "Total time: "$(cat temp.txt | paste -sd+ | bc);

# #среднее значение
echo "Mean "$(cat temp.txt | awk '{a += $1 } END {print a/NR}');

count_rows=$(cat temp.txt | wc -l);

middle_row=$(echo $count_rows*0.5 | bc | awk '{printf("%d\n",$0+=$0<0?0:0.9)}')

# #медиана 
echo "Median: "$(cat temp.txt | sed -n $middle_row"p"); 


# #95 квантиль
kw95=$(echo $count_rows*0.95 | bc | awk '{printf("%d\n",$0+=$0<0?0:0.9)}')

echo "95 quantile: "$(cat temp.txt | sed -n $kw95"p"); 

# #99 квантиль
kw99=$(echo $count_rows*0.99 | bc | awk '{printf("%d\n",$0+=$0<0?0:0.9)}')

echo "99 quantile: "$(cat temp.txt | sed -n $kw99"p"); 

#----------- Задача 2 -------------------

printf "\n Mean and Median of resume id=43 for 18.01\n------------------------------------------------\n"


#получаем данные
cat test.log | grep -E "2013-01-18.*/resume[^ ]*id=43[^ ]*" |grep -P "(\d+\.\d+)" -o | sort > temp.txt;

count_rows=$(cat temp.txt | wc -l);
middle_row=$(echo $count_rows*0.5 | bc | awk '{printf("%d\n",$0+=$0<0?0:0.9)}')

echo "Mean: "$(cat temp.txt | awk '{a += $1 } END {print a/NR}');
echo "Median: "$(cat temp.txt | sed -n $middle_row"p")