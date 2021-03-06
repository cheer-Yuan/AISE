#include "alloc.h"

//variables compteurs
static size_t byte, kb, mb, gb;

//variables globales qui enregistrent le début et la fin du chaine
header_t* head_chaine;
header_t* tail_chaine;

//variable qui bloque la mémoire pour éviter les conflits dans un processus multithread
pthread_mutex_t mutex_lock;

//l'alignement de la mémoire par 8 bytes car en
size_t align(size_t total)
{
    if(total % 8 == 0) return total;
    return ((total >> 3 ) + 1) << 3;
}

//fonction malloc
void* malloc(size_t size)
{
    //initialisation
	header_t* header;
	void* bloc;
	size_t total_size = size + sizeof(header_t);    //la taille totale à allouer
    total_size = align(total_size);

	//bloquer
	pthread_mutex_lock(&mutex_lock);

	//chercher un bloc de memoire libre existant dans le chaine, tech FF
	header_t* courant = head_chaine;
	while(courant)
	{

	    //chercher un bloc libre dans le chaine
		if (courant->head.is_free && courant->head.size >= size)    //trouvé
        {

		    header = courant;
            pthread_mutex_unlock(&mutex_lock);  //débloquer

            return(void*)(header + 1);  //pour retourner, on saute l'adresse qui enregistre l'union dans le bloc
        }
		courant = courant->head.next;
	}


	//si on ne trouve aucun bloc libre dans le chaine, on alloue un bloc via mmap
	bloc = mmap(0 , total_size,  PROT_READ | PROT_WRITE, MAP_ANON | MAP_SHARED, 0, 0);
	if(bloc == MAP_FAILED)  //si on échoue d'allouer le bloc
	{
		pthread_mutex_unlock(&mutex_lock);  //débloquer
		printf("Allocation failed\n");
		return NULL;
	}
	
	header = bloc;
	header->head.size = size;   //enregistrer la taille du bloc
	header->head.is_free = 0;   //marquer non disponible
	header->head.next = NULL;   //mettre à la fin du chaine donc prochine bloc = null


	if(!head_chaine)   //si c'est premier bloc du chaine
		head_chaine = header;
	if(tail_chaine) tail_chaine->head.next = header;    //s'il existe un ancienne fin du chaine, le mettre en devant ce bloc
	tail_chaine = header;  //renouveler la fin du chiane
	pthread_mutex_unlock(&mutex_lock);  //débloquer

	//printf("%zu, %d", header->head.size, header->head.is_free);


	return(void*)(header + 1);
}


//fonction calloc
void* calloc(size_t num , size_t size)
{
	if(!num || !size)    //les paramètres doivent etre différent à zéro
	{   
	    printf("Invalid parameters of calloc\n");
		return NULL;
	}

    void* bloc;
	size_t total_size = num * size; //taille totale à allouer
 
	//test mul overflow
	if(size != total_size / num) 
    {
	    printf("Overflow\n");
	    return NULL;
    }
	
	bloc = malloc(total_size);

	if(!bloc)   //échec d'allocation
	{
	    printf("Allocation failed\n");
		return NULL ;
	}

	memset(bloc, 0, total_size);    //mettre à zéro
	return bloc;
}	


//fonction realloc
void* realloc(void* bloc , size_t size)
{

	header_t* header;
	void* new_bloc;

	if(!bloc || !size)  //paramètres invalides
	{
		return NULL;
	}

	header = (header_t*)bloc - 1;

	if(header->head.size >= size)   //si on veut un bloc plus petit, on retourne le meme bloc
	{
	    printf("Impossible to reallocate a smaller memory\n");
		return bloc ;
	}

	new_bloc = malloc(size); //allouer un nouveau bloc
	if(new_bloc)
	{   //copier coller le contenu dans les anciennes adresses vers les nouvelles et free l'ancien bloc
		memcpy(new_bloc, bloc, header->head.size);
		free(bloc);
	}

	return new_bloc;
}


//fonction free
void free(void* bloc)
{
	header_t* header;
	header = (header_t*)bloc - 1;   //le début de l'adresse du bloc à librer
	header->head.is_free = 1;       //marquer disponible
	munmap(header,sizeof(header_t) + header->head.size);  //free la taille de mémoire allouée au bloc
}



//compter la taille de mémoire allouée
void profiler(int size)
{
    int real_size = size + 32;
    if(real_size >= 1024 || real_size <= -1024)
    {
        kb += real_size / 1024;
        byte += real_size % 1024;
    }
    else byte += real_size;

    if (byte >= 1024)
    {
        kb += 1;
        byte = byte % 1024;
    }
    if (kb >= 1024)
    {
        mb += 1;
        kb = kb % 1024;
    }
    if (mb >= 1024)
    {
        gb += 1;
        mb = mb % 1024;
    }

    if(byte < 0)
    {
        kb -= 1;
        byte += 1024;
    }

    printf("Memory used : %zu bytes, %zu kb, %zu mb, %zu gb", byte, kb, mb, gb);
}

//initialiser les comptuers
void profiler_init()
{
    byte = kb = mb = gb = 0;
}

