/* 
 * File:    2.cpp
 * Author:  Enrique Najera
 * Purpose: Convert area to radius^2  area->1 Byte, 
 *          conversion->3 Bytes, 
 *          Result->1 Byte then output radius^2
 *          area = 110
 * 23 September 2015
 */
 
// SYS_LIBS
#include <iostream>
#include <math.h>   // Square root

// Namespaces
using namespace std;

// Global Constants
const float PI = 3.14159f;

// Start method main
int main(int argc, char *argv[])
{
    // Declare Variables
    char area  = 110;
    int radius =   0;
    
    // Start conversion
    // A = πr² -> r² = A / π
    radius = sqrt( (static_cast<int>(area) / PI) ) + 1;
    
    // Output result
    cout << "Radius squared of area " << static_cast<int>(area) 
                                      << " is " << radius * radius << endl;
    
    // SYS_EXIT
    return 0;
} // End method main
