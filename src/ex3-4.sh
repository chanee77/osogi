#!/bin/bash
# ex3-4.sh

scores=()

while true; do
    echo "==================="
    echo "1) 과목 성적 추가"
    echo "2) 입력된 모든 점수 보기"
    echo "3) 평균 점수 확인"
    echo "4) 평균 등급(GPA) 변환"
    echo "5) 종료"
    echo "==================="
    read -p "선택: " choice

    case "$choice" in

        1)
            read -p "점수 입력: " s
            scores+=("$s")
            echo "추가됨!"
            ;;

        2)
            if [ "${#scores[@]}" -eq 0 ]; then
                echo "입력된 점수가 없습니다."
            else
                echo "=== 저장된 점수 ==="
                for v in "${scores[@]}"; do
                    echo "$v"
                done
            fi
            ;;

        3)
            if [ "${#scores[@]}" -eq 0 ]; then
                echo "점수가 없습니다."
            else
                sum=0
                for v in "${scores[@]}"; do
                    sum=$((sum + v))
                done
                avg=$(( sum / ${#scores[@]} ))
                echo "평균 점수: $avg"
            fi
            ;;

        4)
            if [ "${#scores[@]}" -eq 0 ]; then
                echo "점수가 없습니다."
            else
                sum=0
                for v in "${scores[@]}"; do
                    sum=$((sum + v))
                done
                avg=$(( sum / ${#scores[@]} ))

                if [ "$avg" -ge 90 ]; then
                    echo "평균 등급: A"
                elif [ "$avg" -ge 80 ]; then
                    echo "평균 등급: B"
                elif [ "$avg" -ge 70 ]; then
                    echo "평균 등급: C"
                elif [ "$avg" -ge 60 ]; then
                    echo "평균 등급: D"
                else
                    echo "평균 등급: F"
                fi
            fi
            ;;

        5)
            echo "종료합니다."
            exit 0
            ;;

        *)
            echo "잘못 입력했습니다."
            ;;
    esac

    echo
done
