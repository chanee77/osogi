#!/bin/bash
# ex3-8.sh

# 1) DB 폴더 확인 & 없으면 생성
if [ ! -d "DB" ]; then
    echo "DB 폴더가 없어 새로 만듭니다."
    mkdir DB
else
    echo "DB 폴더가 이미 존재합니다."
fi

# 2) DB 폴더 안에서 임의의 5개 파일 생성
cd DB

echo "DB 폴더 안에 파일 5개를 생성합니다."
for i in {1..5}; do
    touch "file${i}.txt"
done

# 3) 생성된 5개 파일 압축
echo "파일들을 db.tar.gz 로 압축합니다."
tar -czf db.tar.gz file*.txt

# 4) 다시 상위 폴더로 이동
cd ..

# 5) train 폴더 생성 (없으면 생성)
if [ ! -d "train" ]; then
    echo "train 폴더를 생성합니다."
    mkdir train
fi

# 6) train 폴더 안에 DB 파일들을 링크로 연결
echo "train 폴더에 DB/file*.txt 심볼릭 링크를 생성합니다."
for i in {1..5}; do
    # 이미 링크가 있으면 다시 만들지 않도록 -sf 대신 -s 로 사용
    if [ ! -e "train/file${i}.txt" ]; then
        ln -s "$(pwd)/DB/file${i}.txt" "train/file${i}.txt"
    fi
done

echo "작업 완료."
