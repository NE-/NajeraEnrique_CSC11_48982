/*
 * File:    problem1.h
 * Author   Enrique Najera
 * Purpose: Split function into another file.
 *          Also C° to F°
 * 23 October 2015
 */

#ifndef PROBLEM1_H
#define PROBLEM1_H

// Start method problem1
void _problem1(int R1, int R2)
{
    printf("Display Degree Centigrade to Degree Fahrenheit\n");
    printf("Fahrenheit  Centigrade\n");
    for (int R0 = R1; R0 <= R2; R0++)
    {
        int R4 = 9.0/5.0*R0+32;
        printf("%6d %12d\n", R4, R0);
    }
}// End method problem1

#endif // PROBLEM1_H
