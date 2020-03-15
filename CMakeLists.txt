cmake_minimum_required(VERSION 3.10)
project(projet C)

set(CMAKE_C_STANDARD 11)


set(SOURCE_FILES alloc.h alloc.c)

#flag d'optimisation
set(CMAKE_CXX_FLAGS_RELEASE "-O3")

#définir le path d'output des fichier de bibliothèque générés
SET(LIBRARY_OUTPUT_PATH "${PROJECT_BINARY_DIR}/lib")

#générer la bibliothèque dynamique
add_library(my_alloc SHARED ${SOURCE_FILES})

#générer la bibliothèque statique
add_library(my_alloc_sta STATIC ${SOURCE_FILES})
#renomer la bibliothèque statique vu que l'on veut les deux aient le meme nom
SET_TARGET_PROPERTIES(my_alloc_sta PROPERTIES OUTPUT_NAME "my_alloc")

#installer la bibliothèque sous le path du système
install(TARGETS my_alloc my_alloc_sta LIBRARY DESTINATION /usr/lib ARCHIVE DESTINATION /usr/lib)

#insaller le ficher .h pour faire #include
install(FILES alloc.h DESTINATION /usr/include/)

#lier les fichiers
add_executable(projet main.c alloc.c alloc.h)
