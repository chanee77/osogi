#!/bin/bash

# ex3-0.sh

echo 'MYENV="Hello Shell"' >> ~/.bashrc
source ~/.bashrc

echo "환경변수 MYENV 값: $MYENV"

unset MYENV
echo "해제 후 MYENV 값: $MYENV"

