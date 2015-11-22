# Makes and runs C and asm code
# Compile C then asm
echo "Assembling..."
as -o blink.o blink.s
echo

echo "Compiling..."
gcc -o blinkC blink.c -lwiringPi
gcc -o blinkA blink.o -lwiringPi
echo

echo "Running C version"
echo
./blinkC
echo
echo "End C version"
echo

echo "Running asm version"
echo
./blinkA
echo
echo "End asm version"
echo

echo "Cleaning up..."
rm *.o blinkC blinkA
echo

