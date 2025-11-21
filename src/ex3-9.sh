#!/bin/bash
# ex3-9.sh

DB="DB.txt"

# DB 파일 없으면 생성
if [ ! -f "$DB" ]; then
    touch "$DB"
fi

while true; do
    echo "==================="
    echo "1) 팀원 정보 추가"
    echo "2) 팀원과 한 일 기록"
    echo "3) 팀원 검색"
    echo "4) 수행 내용 검색"
    echo "5) 종료"
    echo "==================="
    read -p "선택: " choice

    case "$choice" in

        1)
            # 팀원 정보 추가
            read -p "팀원 이름: " name
            read -p "생일 또는 전화번호: " info
            echo "[팀원] $name - $info" >> "$DB"
            echo "저장 완료."
            ;;

        2)
            # 팀원이 한 기록 추가
            read -p "날짜(YYYY-MM-DD): " date
            read -p "내용: " content
            echo "[기록] $date - $content" >> "$DB"
            echo "기록 완료."
            ;;

        3)
            # 이름으로 검색 (부분 일치)
            read -p "검색할 팀원 이름: " target
            echo "=== 검색 결과 ==="
            # grep 결과를 변수로 받아서 비어있는지도 체크
            result=$(grep "$target" "$DB")
            if [ -z "$result" ]; then
                echo "일치하는 팀원 정보가 없습니다."
            else
                echo "$result"
            fi
            ;;

        4)
            # 날짜로 검색 (부분 일치)
            read -p "검색할 날짜(YYYY-MM-DD): " keydate
            echo "=== 검색 결과 ==="
            result=$(grep "$keydate" "$DB")
            if [ -z "$result" ]; then
                echo "해당 날짜의 기록이 없습니다."
            else
                echo "$result"
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

