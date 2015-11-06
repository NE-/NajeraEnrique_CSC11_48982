echo "Assembling..."
as -g -o main.o main.s
as -g -o spin.o spin.s
as -g -o random.o random.s
as -g -o help.o help.s
as -g -o player.o player.s

echo "Linking..."
gcc -o project main.o spin.o random.o help.o player.o

echo "Cleaning..."
echo
rm *.o
echo
echo "Running..."
echo
./project

