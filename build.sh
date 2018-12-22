#!/usr/bin/env bash

set -uae

mkdir -p build

nasm -felf64 -o build/main.o main.asm
ld -g -o build/main build/main.o
./build/main
