#!/usr/bin/env bash

set -uae

mkdir -p build

nasm -f elf -o build/main.o main.asm
ld -m elf_i386 -g -o build/main build/main.o
./build/main
