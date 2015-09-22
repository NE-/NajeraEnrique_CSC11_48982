/*
 * File:    1.cpp
 * Author:  Enrique Najera
 * Purpose: Convert months to years  months->1 Byte, 
 *          conversion->3 Bytes, 
 *   		Result->1 Byte then output years
 *   		months = 88
 * 21 September 2015
 */

// SYS_LIBS
#include <iostream>

// Namespaces
using namespace std;

// Global Constants
const float MNTHTOYR = 1.0f / 12.0f; // 12 months per year

// Start method main
int main()
{
	// Declare Variables
	char mth = 88; // Holds value of the month

	// Output result
	cout << static_cast<int>( mth * MNTHTOYR ) << endl;

	//SYS_EXIT
	return 0;
} // End method main

