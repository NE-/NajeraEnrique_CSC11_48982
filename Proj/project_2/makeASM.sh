#!/bin/sh
#compile
echo "Compiling..."
echo
as -g -o main.o main.s
gcc -g -c wallet.s
as -g -o random.o random.s
as -g -o randomDie.o randomDie.s
gcc -g -c gSelect.s
as -g -o help.o help.s
as -g -o errorMsgs.o errorMsgs.s
echo
echo "Linking..."
gcc -o main.EXE main.o wallet.o random.o randomDie.o gSelect.o help.o errorMsgs.o

echo
echo "Cleaning up..."
echo
rm -vf *.o
echo
echo "Running..."
echo
./main.EXE
echo

