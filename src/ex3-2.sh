#!/bin/bash
# ex3-2.sh

echo "x 값을 여러 개 입력하세요 (종료: q)"

while true; do
    read -p "x = " x
    [[ $x == "q" ]] && break

    y=$(echo "0.5 * $x * $x" | bc -l)
    echo "y = $y"
done

