# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/cheerfulliu/Desktop/AISE/AISE

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/cheerfulliu/Desktop/AISE/AISE/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/my_alloc.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/my_alloc.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/my_alloc.dir/flags.make

CMakeFiles/my_alloc.dir/alloc.c.o: CMakeFiles/my_alloc.dir/flags.make
CMakeFiles/my_alloc.dir/alloc.c.o: ../alloc.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cheerfulliu/Desktop/AISE/AISE/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/my_alloc.dir/alloc.c.o"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/my_alloc.dir/alloc.c.o   -c /home/cheerfulliu/Desktop/AISE/AISE/alloc.c

CMakeFiles/my_alloc.dir/alloc.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/my_alloc.dir/alloc.c.i"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cheerfulliu/Desktop/AISE/AISE/alloc.c > CMakeFiles/my_alloc.dir/alloc.c.i

CMakeFiles/my_alloc.dir/alloc.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/my_alloc.dir/alloc.c.s"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cheerfulliu/Desktop/AISE/AISE/alloc.c -o CMakeFiles/my_alloc.dir/alloc.c.s

CMakeFiles/my_alloc.dir/alloc.c.o.requires:

.PHONY : CMakeFiles/my_alloc.dir/alloc.c.o.requires

CMakeFiles/my_alloc.dir/alloc.c.o.provides: CMakeFiles/my_alloc.dir/alloc.c.o.requires
	$(MAKE) -f CMakeFiles/my_alloc.dir/build.make CMakeFiles/my_alloc.dir/alloc.c.o.provides.build
.PHONY : CMakeFiles/my_alloc.dir/alloc.c.o.provides

CMakeFiles/my_alloc.dir/alloc.c.o.provides.build: CMakeFiles/my_alloc.dir/alloc.c.o


# Object files for target my_alloc
my_alloc_OBJECTS = \
"CMakeFiles/my_alloc.dir/alloc.c.o"

# External object files for target my_alloc
my_alloc_EXTERNAL_OBJECTS =

lib/libmy_alloc.so: CMakeFiles/my_alloc.dir/alloc.c.o
lib/libmy_alloc.so: CMakeFiles/my_alloc.dir/build.make
lib/libmy_alloc.so: CMakeFiles/my_alloc.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cheerfulliu/Desktop/AISE/AISE/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking C shared library lib/libmy_alloc.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/my_alloc.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/my_alloc.dir/build: lib/libmy_alloc.so

.PHONY : CMakeFiles/my_alloc.dir/build

CMakeFiles/my_alloc.dir/requires: CMakeFiles/my_alloc.dir/alloc.c.o.requires

.PHONY : CMakeFiles/my_alloc.dir/requires

CMakeFiles/my_alloc.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/my_alloc.dir/cmake_clean.cmake
.PHONY : CMakeFiles/my_alloc.dir/clean

CMakeFiles/my_alloc.dir/depend:
	cd /home/cheerfulliu/Desktop/AISE/AISE/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cheerfulliu/Desktop/AISE/AISE /home/cheerfulliu/Desktop/AISE/AISE /home/cheerfulliu/Desktop/AISE/AISE/cmake-build-debug /home/cheerfulliu/Desktop/AISE/AISE/cmake-build-debug /home/cheerfulliu/Desktop/AISE/AISE/cmake-build-debug/CMakeFiles/my_alloc.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/my_alloc.dir/depend

