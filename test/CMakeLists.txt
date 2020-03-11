cmake_minimum_required(VERSION 3.15)
project(test C)

set(CMAKE_C_STANDARD 11)
include_directories(/usr/include)

add_executable(test main.c)
target_link_libraries(test my_alloc)