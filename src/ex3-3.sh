#!/bin/bash
# ex3-3.sh

scores=()
grades=()

echo "점수를 여러 개 입력하세요 (종료: q)"

# 여러 점수 입력받기
while true; do
    read -p "점수: " s
    if [ "$s" = "q" ]; then
        break
    fi

    scores+=("$s")

    if [ "$s" -ge 90 ]; then
        grades+=("A")
    else
        grades+=("B")
    fi
done

echo
echo "개별 등급 출력:"
for i in "${!scores[@]}"; do
    echo "${scores[$i]}점 -> ${grades[$i]} 등급"
done

# 점수 하나도 안 넣고 q 눌렀을 때 대비
if [ "${#scores[@]}" -eq 0 ]; then
    exit 0
fi

# 평균 계산
sum=0
for sc in "${scores[@]}"; do
    sum=$((sum + sc))
done
avg=$((sum / ${#scores[@]}))

# 평균 등급 판정
if [ "$avg" -ge 90 ]; then
    avg_grade="A"
else
    avg_grade="B"
fi

echo
echo "평균 점수: $avg"
echo "평균 등급: $avg_grade"
