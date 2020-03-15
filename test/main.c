#include "my_alloc.h"


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
