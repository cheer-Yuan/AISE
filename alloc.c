#include "alloc.h"
#include <sys/types.h>
#include <sys/mman.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <pthread.h>

static size_t bytes, kbs, mbs, gbs;

//variables globales qui enregistrent le début et la fin du chaine
header_t* head_chaine;
header_t* tail_chaine;

//variable qui bloque la mémoire pour éviter les conflits dans un processus multithread
pthread_mutex_t mutex_lock;

//fonction malloc
void* my_malloc(size_t size)
{
    //initialisation
	header_t* header;
	void* bloc;
	size_t total_size = size + sizeof(header_t);    //la taille totale à allouer

	//bloquer
	pthread_mutex_lock(&mutex_lock);

	//chercher un bloc de memoire libre existant dans le chaine
	header_t* courant = head_chaine;
	while(courant)
	{   //chercher un bloc libre dans le chaine
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
	
	return(void*)(header + 1);
}


//fonction calloc
void* my_calloc(size_t num , size_t size)
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
	
	bloc = my_malloc(total_size);

	if(!bloc)   //échec d'allocation
	{
	    printf("Allocation failed\n");
		return NULL ;
	}

	memset(bloc, 0, total_size);    //mettre à zéro
	return bloc;
}	


//fonction realloc
void* my_realloc(void* bloc , size_t size)
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

	new_bloc = my_malloc(size); //allouer un nouveau bloc
	if(new_bloc)
	{   //copier coller le contenu dans les anciennes adresses vers les nouvelles et free l'ancien bloc
		memcpy(new_bloc, bloc, header->head.size);
		my_free(bloc);
	}

	return new_bloc;
}


//fonction free
void my_free(void* bloc)
{
	header_t* header;
	header = (header_t*)bloc - 1;   //le début de l'adresse du bloc à librer
	munmap(header,sizeof(header_t) + header->head.size);  //free la taille de mémoire allouée au bloc
}



