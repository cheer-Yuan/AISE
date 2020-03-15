//
// Created by cheerfulliu on 15/03/2020.
//
#include <stdlib.h>
#include <time.h>
#include <stdio.h>

void test_small_chain(int num_bloc, int int_per_bloc)
{
    struct timespec start = {0, 0};
    struct timespec end = {0, 0};

    clock_gettime(CLOCK_REALTIME, &start);


    for(int i = 0; i < num_bloc; ++i)
    {
        int* example = (int*)malloc(int_per_bloc * sizeof(int));
    }
    //free(example);
    //example = NULL;

    clock_gettime(CLOCK_REALTIME, &end);

    printf("Test on system function of malloc.\nTotal allocated : %f mb\nFunction called : %d times\nTotla time spend : %ld ms\n\n",
           (float)num_bloc * (float)int_per_bloc * 4 / 1024 / 1024,
           num_bloc,
           (end.tv_sec - start.tv_sec)*1000 + (end.tv_nsec - start.tv_nsec)/1000000 );

}

int main( )
{

    //3 kb par bloc * 1024 fois = 3 mb allouée au total
    test_small_chain(1024, (int)3 * 1024 / 4);

    //12 kb par bloc * 1024 fois = 12 mb allouée au total
    test_small_chain(1024, (int)12 * 1024 / 4);

    //12 kb par bloc * 4096 fois = 48 mb allouée au total
    test_small_chain(4096, (int)12 * 1024 / 4);

    return 0;
}