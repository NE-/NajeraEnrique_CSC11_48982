/*
 * File:    problem2.h
 * Author   Enrique Najera
 * Purpose: Split function into another file.
 *          Also F° to C°
 * 23 October 2015
 */

#ifndef PROBLEM2_H
#define PROBLEM2_H

// Start method problem2
void _problem2(int R1, int R2)
{
    printf("Display Degree Fahrenheit to Degree Centigrade\n");
    printf("Fahrenheit  Centigrade\n");
    for (int R0 = R1; R0 <= R2; R0++)
    {
        int R4 = 5.0/9.0*(R0-32);
        printf("%6d %12d\n", R0, R4);
    }
}// End method problem2

#endif // PROBLEM2_H
