#include "my_alloc.h"


int main( )
{

    //3 kb par bloc * 1024
    test_small_chain(1024, (int)3 * 1024 / 4);
    exit(0);
}
