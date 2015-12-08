#!/bin/sh
#Compile
echo "compiling components..."
echo
g++ -o c2.out component_2.cpp
g++ -o c3.out component_3.cpp
g++ -o c4.out component_4.cpp
as -g -o component_5.o component_5.s
gcc -o c5 component_5.o
g++ -o c6.out component_6.cpp
#Run
echo
echo "Running component_2.cpp"
./c2.out
echo
echo "Running component_3.cpp"
./c3.out
echo
echo "Running component_4.cpp"
./c4.out
echo
echo "Running component_5.s"
./c5
echo
echo "Running component_6.cpp"
./c6.out
echo
echo "Component_7.s ran ERROR: selected processor does not support ARM mode 'v...'"
echo
#Clean
echo
echo "Cleaning up..."
echo
rm *.out *.o c5
echo

