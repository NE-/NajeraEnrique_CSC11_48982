#!/bin/sh
#compile
echo "Compiling..."
echo
as -g -o main.o main.s
as -g -o random.o random.s
as -g -o randomDie.o randomDie.s
as -g -o gSelect.o gSelect.s
as -g -o help.o help.s
echo
echo "Linking..."
gcc -o main.EXE main.o random.o randomDie.o gSelect.o help.o
echo
echo "Cleaning up..."
echo
rm -vf *.o
echo
echo "Running..."
echo
./main.EXE
echo

