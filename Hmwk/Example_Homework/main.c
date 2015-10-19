/*
 * File:    main.c
 * Author   Enrique Najera
 * Purpose: Convert cout/cin -> printf/scanf,
 *                  variables to registers,
 *                  constructs to labels and goto's,
 *          then split out the functions into other files.
 * 23 October 2015
 */

//SYS_LIBS
#include <stdio.h>

//USER_LIBS
#include "problem1.h"
#include "problem2.h"

// Start method main
int main()
{
    //Declare Variables
    int R1 = 0,
        R2 = 0,
        R3 = 0;

    do
    {
        printf("Input beginning and end of temperature range\n");
        scanf("%d", &R1);
        scanf("%d", &R2);
        printf("If range is degree Centigrade input 1\n");
        printf("If range is degree Fahrenheit input 2\n");
        scanf("%d", &R3);

        switch(R3)
        {
            case 1: _problem1(R1, R2); break;
            case 2: _problem2(R1, R2);
        }
    }while( R3 > 0 && R3 < 3);

    //SYS_EXIT
    return 0;
}// End method main
