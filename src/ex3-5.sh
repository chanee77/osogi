#!/bin/bash
# ex3-5.sh

# 내부 함수: ls 명령어를 실행하면서
# 스크립트에 전달된 인자들을 그대로 옵션으로 사용
run_ls() {
    # 함수로 들어온 모든 인자 모으기
    local opts="$*"

    echo "실행 명령어: ls $opts"
    # eval을 써서 옵션들이 제대로 해석되도록 함
    eval "ls $opts"
}

# 스크립트에 넘긴 인자들을 그대로 함수에 넘김
run_ls "$@"
