/* 
 * File:    3.cpp
 * Author:  Enrique Najera
 * Purpose: Convert area to radius^2  area->2 Byte, 
 *          conversion->2 Bytes, 
 *          Result->1 Byte then output radius^2
 *          area = 113.4
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
    float area  = 113.4f;
    int radius  =      0;
    
    // Start conversion
    // A = πr² -> r² = A / π
    radius = sqrt( (area / PI) );
    
    // Output result
    cout << "Radius squared of area " << area << " is " << radius * radius << endl;
    
    // SYS_EXIT
    return 0;
} // End method main
