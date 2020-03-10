#ifndef _LIB_ALLOC_
#define _LIB_ALLOC_
#include <sys/types.h>


//variable pour occuper une place pour header dans l'union
typedef char ALIGN[32];

//cette unoin relie tous les bloc alloués et compose un chaine
union header{
	struct{
	size_t size;    //la taille du bloc, taille = 8 bytes
	unsigned is_free;   //si le bloc est vide et donc disponible, taille = 2 bytes
	union header* next;     //pointeur vers le prochain bloc dans le chaine
    } head;

    ALIGN stub;
};

typedef union header header_t;

void *my_malloc(size_t size);
void *my_realloc(void *p,size_t size);
void my_free(void *p);
void *my_calloc(size_t number,size_t size);

#endif