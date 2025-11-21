#!/bin/bash
# ex3-7.sh

while true; do
    echo "==================="
    echo "1) 사용자 정보"
    echo "2) CPU 사용률 확인"
    echo "3) 메모리 사용량 확인"
    echo "4) 디스크 사용량 확인"
    echo "5) 종료"
    echo "==================="
    read -p "선택: " choice

    case "$choice" in

        1)
            echo "[사용자 정보]"
            who
            ;;

        2)
            echo "[CPU 사용률]"
            # GPU가 없는 환경(VM)에서는 top 사용
            top -b -n 1 | head -n 15
            ;;

        3)
            echo "[메모리 사용량]"
            free -h
            ;;

        4)
            echo "[디스크 사용량]"
            df -h
            ;;

        5)
            echo "종료합니다."
            exit 0
            ;;

        *)
            echo "잘못된 입력입니다."
            ;;
    esac

    echo
done
