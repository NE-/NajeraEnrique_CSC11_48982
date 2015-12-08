/*
 * File:    component_6.cpp
 * Author:  Enrique Najera
 * Purpose: Find terminal velocity of golf ball
 *          using floats as close to assembly as possible
 * 07 December 2015
 */
 
// SYS_LIBS
#include <stdio.h>

// Start method main
int main()
{
    // Declare Variables
    float R0 = 0.14f,      // Diameter
          R1 = 0.10125f,   // Weight
          R2 = 0.5f,       // Coefficient of Drag
          R3 = 0.0023679f, // Density of Air
          R4 = 0.0f,       // Holds product
          R5 = 1.0f;       // Increment value
          
    // Finding Vt       
    // -Simplify formula
    // --Vt = SQRT((8*Wt)/(pi * p * d² * Cd))
    R1 = 8 * R1;       // 8 * wt
    R3 = 3.14159 * R3; // pi * p
    R0 = R0 * R0;      // d²
    R2 = R0 * R2;      // d² * Cd
    R4 = R3 * R2;      // (pi*p) * (d² * Cd)
    R0 = R1 / R4;      // S (Lsh & Rsh doesn't work on C++ floats)
    goto _sqrt;
    
    _sqrt:
        // R0 is S
        // R1 = 1.0f;// int i = 1
        R2 = R0 / 2; // Xn
        R3 = 0.0f;   // Xn + 1
        R4 = R2;     // Temp
        
        // Xn != Xn + 1
        while (R2 != R3)
        {
            R2 = R4;               // Xn = temp 
            R3 = (R2 + (R0 / R2)); // (Xn + (S / Xn))
            R3 = R3 / 2;           // Divide by 2
            R4 = R3;               // Temp = Xn + 1
        }
        
    // Answer
    printf("Velocity = %f ft/sec\n", R2);
    
    // Finding q
    // -Formula
    // --q = 1/2(p * Vt²)
    // INIT R1 = p
    R1 = 0.0023679f;
    R2 = R2 * R2; // Vt²
    R1 = R1 * R2; // (p * Vt²)
    R0 = R1 / 2;  // (p * Vt²) / 2 --[[asm: R1>>=1--]]
    
    // Answer
    printf("Dynamic Pressure = %f lb/ft^2\n", R0);

    // SYS_EXIT
    return 0;
}// End method main
