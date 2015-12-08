/*
 * File:    component_2.cpp
 * Author:  Enrique Najera
 * Purpose: Find terminal velocity of golf ball
 *          using simple C++
 * 07 December 2015
 */
 
// SYS_LIBS
#include <iostream>
#include <math.h>   // sqrt()

// Namespaces
using namespace std;

// Start method main
int main (int argc, char *argv[])
{
    // Declare Variables
    float d  = 0.14f,      // Diameter
          wt = 0.10125f,   // Weight
          cd = 0.5f,       // Coefficient of Drag
          p  = 0.0023679f, // Density of Air
          vt = 0.0f,       // Velocity
          q  = 0.0f,       // Dynamic Pressure
          temp = 0;        // Holds answer before sqrt
       
    // Finding Vt       
    // -Simplify formula
    // --Vt = SQRT((8*Wt)/(pi * p * d² * Cd))
    temp = (8*wt) / (3.14159 * p * d * d * cd);
    vt = sqrt(temp);
    
    // Answer
    cout << "Velocity = " << vt << " ft/sec" << endl;
    
    // Finding q
    // -Formula
    // --q = 1/2(p * Vt²)
    q = (p * vt * vt) / 2;
    
    // Answer
    cout << "Dynamic Pressure = " << q << " lb/ft^2" << endl;

    // SYS_EXIT
    return 0;
}// End method main
