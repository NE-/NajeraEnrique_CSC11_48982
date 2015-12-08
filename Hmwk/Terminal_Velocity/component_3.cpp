/*
 * File:    component_3.cpp
 * Author:  Enrique Najera
 * Purpose: Find terminal velocity of golf ball
 *          using C++ & scaled integers
 * 07 December 2015
 */
 
// SYS_LIBS
#include <iostream>

// Namespaces
using namespace std;

// Start method main
int main (int argc, char *argv[])
{
    // Declare Variables
    unsigned int 
        d2 = 0x504816EE, // Diameter²           BP-36 WD32
        wt = 0x19EB851E, // Weight              BP-32 WD32
        cd = 0x8,        // Coefficient of Drag BP-04 WD01
        p  = 0x9B2EC51,  // Density of Air      BP-36 WD28
        pi = 0x3243F6A9, // Pi                  BP-28 WD32
        vt = 0,          // Velocity
        q  = 0,          // Dynamic Pressure
        nAtor = 0,       // Holds numerator
        dAtor = 0;       // Holds denominator

        
    // Finding Vt       
    // -Simplify formula
    // --Vt = SQRT((8*Wt)/(pi * p * d² * Cd))
    nAtor = wt;
    
    // Shift 16 for 32 bit product
    pi >>= 16;      // BP-12 WD16
    p  >>= 12;      // BP-24 WD16
    
    dAtor = pi * p; // BP-36 WD32
    
    // Shift 16 for 32 bit quotient
    dAtor >>= 16; // BP-20 WD16
    d2    >>= 16; // BP-20 WD16
    
    dAtor *= d2;  // BP-40 WD32
    dAtor >>= 12; // BP-28 WD16
    
    // Divide
    vt = nAtor / dAtor;
    
    // SQRT
    int s    = vt;
    int xn   = s / 2; // X0
    int xnp1 = 0;
    int temp = xn;
    
    while (xn != xnp1)
    {
        xn = temp;
        xnp1 = (xn + (s/xn));
        xnp1>>=1;             // Divide by 2
        temp = xnp1;
    }
    
    // Answer (Xn to save Vt for Finding q)
    cout << "Velocity = " << xn << " ft/sec" << endl;
    
    // Finding q
    // -Formula
    // --q = 1/2(p * Vt²)
    vt *= p;  // (p * Vt²)
    q = vt;
    q >>= 1;  // Divide by 2
    q >>= 24; // BP 0 WD08
    
    // Answer
    cout << "Dynamic Pressure = " << q << " lb/ft^2" << endl;
    
    // SYS_EXIT
    return 0;
}// End method main
