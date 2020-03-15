cmake_minimum_required(VERSION 3.15)
project(test C)

set(CMAKE_C_STANDARD 11)
include_directories(/usr/include)
set(CMAKE_CXX_FLAGS_RELEASE "-O3")

add_executable(test main.c my_alloc.h my_alloc.c)
target_link_libraries(test my_alloc)

