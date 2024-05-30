#!/bin/bash

int l = -1                      // l, r — левая и правая границы
    int r = len(a)    
    while l < r - 1                // Запускаем цикл
        m = (l + r) / 2            // m — середина области поиска
        if a[m] < key
            l = m
        else 
            r = m                  // Сужение границ
    return r

runs=10

right=500000
left=1
while [ "$left" -lt "$((right - 1))" ]; do
    medium=$((left+right)/2)
    
    if [["$runs" -eq 0]]
    

    bash newmem.sh "$medium"
    runs=$((runs-1))
    if [[$? -eq 0]]; then
        left=$right
    else
        right=$medium
    fi
done

echo "answer: $right"