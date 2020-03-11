cmake_minimum_required(VERSION 3.10)
project(projet C)

set(CMAKE_C_STANDARD 11)

set(SOURCE_FILES alloc.h alloc.c)
SET(LIBRARY_OUTPUT_PATH "${PROJECT_BINARY_DIR}/lib")

add_library(my_alloc SHARED ${SOURCE_FILES})
add_library(my_alloc_sta STATIC ${SOURCE_FILES})
SET_TARGET_PROPERTIES(my_alloc_sta PROPERTIES OUTPUT_NAME "my_alloc")
install(TARGETS my_alloc my_alloc_sta LIBRARY DESTINATION /usr/lib ARCHIVE DESTINATION /usr/lib)
install(FILES alloc.h DESTINATION /usr/include/)

add_executable(projet main.c alloc.c alloc.h)

#make install