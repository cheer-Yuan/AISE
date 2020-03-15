//
// Created by cheerfulliu on 13/03/2020.
//

#include "my_alloc.h"




void test_small_chain(int num_bloc, int int_per_bloc)
{
    struct timespec start = {0, 0};
    struct timespec end = {0, 0};

    clock_gettime(CLOCK_REALTIME, &start);


    for(int i = 0; i < num_bloc; ++i)
    {
        int* example = (int*) malloc(int_per_bloc * sizeof(int));
    }
    //free(example);
    //example = NULL;

    clock_gettime(CLOCK_REALTIME, &end);

    printf("Test on our own function of malloc with optimisation flag -O3.\nTotal allocated : %f mb\nFunction called : %d times\nTotla time spend : %ld ms\n\n",
            (float)num_bloc * (float)int_per_bloc * 4 / 1024 / 1024,
            num_bloc,
           (end.tv_sec - start.tv_sec)*1000 + (end.tv_nsec - start.tv_nsec)/1000000 );

}

