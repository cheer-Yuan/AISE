#include <stdio.h>
#include "alloc.h"

int main(int argc , char** argv){


    //appel malloc
    int* A;
    //A=my_malloc(5*sizeof(int));

    /*for(int i=0 ; i<5; i++){
        A[i]=2;
    }*/






    //appel free
    //my_free(A);




    A=calloc(5,sizeof(int));
    A[0]=5;


    for(int i=0;i<5;i++){

        printf("%d\n",A[i] );
    }


    A[6]=2;
    printf("%d\n",A[6] );

    /*A=my_realloc(A,8*sizeof(int));



    printf("apres realloc \n");

    for(int i=0;i<8;i++){

        printf("%p\n",&A[i] );
    }*/

    free(A);


}