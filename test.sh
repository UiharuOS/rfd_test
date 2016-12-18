#!/bin/sh

nasm -o build/mbr.bin mbr.S
nasm -f elf32 -o build/boot.o boot.S
gcc -m32 -c -o build/rfd.o rfd.c
ld -m elf_i386 -e main -o build/boot.bin build/boot.o build/rfd.o
nasm -o build/hello.bin hello.S

dd if=./build/mbr.bin of=/home/neo1218/bochs/exhd60M.img count=1 seek=0 conv=notrunc
dd if=./build/boot.bin of=/home/neo1218/bochs/exhd60M.img count=8 seek=1 conv=notrunc
dd if=./build/hello.bin of=/home/neo1218/bochs/exhd60M.img count=1 seek=10 conv=notrunc

