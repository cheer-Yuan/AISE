#include <stdio.h>
#include "alloc.h"

int main(int argc, char *argv[])
{
    int* A = my_malloc(1024);
    my_free(A);
}
