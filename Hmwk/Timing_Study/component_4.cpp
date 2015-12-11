/*
 * File:    component_4.cpp
 * Author:  Enrique Najera
 * Purpose: Timing Study
 * 07 December 2015
 */
 
// SYS_LIBS
#include <stdio.h>
#include <ctime>

// Namespaces
using namespace std;

// Start method main
int main (int argc, char *argv[])
{
    // INIT Registers
    unsigned int
        R0 = 0x504816EE, // Diameter²           BP-36 WD32
        R1 = 0x19EB851E, // Weight              BP-32 WD32
        R2 = 0x8,        // Coefficient of Drag BP-04 WD01
        R3 = 0x9B2EC51,  // Density of Air      BP-36 WD28
        R4 = 0x3243F6A9, // Pi                  BP-28 WD32
        R5 = 0;          // Placeholder

	// For timing study
	clock_t start;
	float duration;

	start = clock();
        
    // Finding Vt       
    // -Simplify formula
    // --Vt = SQRT((8*Wt)/(pi * p * d² * Cd))
    R4 >>= 16;    // BP-12 WD16
    R3 >>= 12;    // BP-24 WD16
    R5 = R4 * R3; // BP-36 WD32
    
    R5 >>= 16;    // BP-20 WD16
    R0 >>= 16;    // BP-20 WD16
    
    R5 = R5 * R0; // BP-40 WD32
    R5 >>= 12;    // BP-28 WD16
    
    // MOV R0, R5 to prevent loss in asm
    R0 = R5; // BP-28 WD16

    // Divide
    goto _divMod;
           
_divMod:
    // R0 Denominator
    // R1 Numerator
    R2 = 1;  // Increment
    R3 = R1; // Holds mod
    R4 = 0;  // Holds quotient
    
    do
    {
        R0 <<= 1;
        R2 <<= 1;
    }while (R1 > R0);
    R0 >>= 1;
    R2 >>= 1;
    
    
    while(R1 >= R0)
    {
        R4 += R2;
        R1 -= R0;
        while (R2 > 1 && R0 > R1)
        {
            R2>>=1;
            R0>>=1;
        }
    }// End _divMod
        
    // SQRT
    goto _sqrt;
        
_sqrt: 
    R1 = R4; // S
    R0 = R1; // Xn
    R0>>=1;  // X0
    R3 = 0;  // Xn + 1
    R2 = R0; // temp
    
    // While Xn != Xn + 1
    while (R0 != R3)
    {
        R0 = R2; // Xn = temp
        R1 = R4; // INIT S always
        
        R3 = 0; // Used to hold quotient
        
        // S / Xn
        goto div_check;
        
        div:
            R3 = R3 + 1;  // Increment quotient
            R1 = R1 - R0; // Numerator - Denominator
        div_check:
            if (R1 >= R0)
                goto div;
        
        // (S/Xn) + Xn 
        R3 = R3 + R0; 
        
        // Divide by 2
        R3 >>= 1;
        R2 = R3; // Temp = Xn + 1
    }   
    
    // Answer    
    printf("Velocity = %d ft/sec\n", R0);
    
    // INIT Registers
    R0 = 0; // q
    R1 = 0x9B2EC51; // Density of Air BP-36 WD28
    R1 >>= 12;      // BP-24 WD16
    R4 = R4 * R1;   // (Vt² * p)
    R0 = R4;
    R0>>=1;         // Divide by 2
    R0>>=24;        // BP 0 WD08
    
    // Answer
    printf("Dynamic Pressure = %d lb/ft^2\n", R0);

    // Do something long
	for (int i = 0; i < 2000000; i++)
	{

	}

    // Calculate Duration
	clock_t end = clock();
	duration = ((float)end - (float)start) / CLOCKS_PER_SEC;
	// Output duration
	printf("Duration: %f\n", duration);
    
    // SYS_EXIT
    return 0;
} // End method main
