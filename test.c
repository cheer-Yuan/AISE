//
// Created by cheerfulliu on 10/03/2020.
//


#include <memory.h>
#include <stdlib.h>

void main()
{
    int* A = (int*)calloc(8, sizeof(int));
    A[7] = 9;
    for (int i = 0; i < 7; ++i) printf("%d\n", A[i]);
}