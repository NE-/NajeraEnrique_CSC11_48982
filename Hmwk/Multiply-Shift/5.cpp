/* 
 * File:    5.cpp
 * Author:  Enrique Najera
 * Purpose: Calculate area given the radius  radius->2 Byte, 
 *          conversion->2 Bytes, 
 *          Result->1 Byte then output area
 *          radius=6.5
 * 23 September 2015
 */
 
// SYS_LIBS
#include <iostream> 

// Namespaces
using namespace std;

// Global Constants
const float PI = 3.14159f;

// Start method main
int main(int argc, char *argv[])
{
    // Declare Variables
    int area   = 0;
    float radius  = 6.5;
    
    // Start conversion
    // A = πr²
    area = PI * (radius * radius);
    
    // Output result
    cout << "Area of radius " << radius << " is " << area << endl;
    
    // SYS_EXIT
    return 0;
} // End method main
