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
include CMakeFiles/projet.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/projet.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/projet.dir/flags.make

CMakeFiles/projet.dir/main.c.o: CMakeFiles/projet.dir/flags.make
CMakeFiles/projet.dir/main.c.o: ../main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cheerfulliu/Desktop/AISE/AISE/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/projet.dir/main.c.o"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/projet.dir/main.c.o   -c /home/cheerfulliu/Desktop/AISE/AISE/main.c

CMakeFiles/projet.dir/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/projet.dir/main.c.i"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cheerfulliu/Desktop/AISE/AISE/main.c > CMakeFiles/projet.dir/main.c.i

CMakeFiles/projet.dir/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/projet.dir/main.c.s"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cheerfulliu/Desktop/AISE/AISE/main.c -o CMakeFiles/projet.dir/main.c.s

CMakeFiles/projet.dir/main.c.o.requires:

.PHONY : CMakeFiles/projet.dir/main.c.o.requires

CMakeFiles/projet.dir/main.c.o.provides: CMakeFiles/projet.dir/main.c.o.requires
	$(MAKE) -f CMakeFiles/projet.dir/build.make CMakeFiles/projet.dir/main.c.o.provides.build
.PHONY : CMakeFiles/projet.dir/main.c.o.provides

CMakeFiles/projet.dir/main.c.o.provides.build: CMakeFiles/projet.dir/main.c.o


CMakeFiles/projet.dir/alloc.c.o: CMakeFiles/projet.dir/flags.make
CMakeFiles/projet.dir/alloc.c.o: ../alloc.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/cheerfulliu/Desktop/AISE/AISE/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/projet.dir/alloc.c.o"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/projet.dir/alloc.c.o   -c /home/cheerfulliu/Desktop/AISE/AISE/alloc.c

CMakeFiles/projet.dir/alloc.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/projet.dir/alloc.c.i"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/cheerfulliu/Desktop/AISE/AISE/alloc.c > CMakeFiles/projet.dir/alloc.c.i

CMakeFiles/projet.dir/alloc.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/projet.dir/alloc.c.s"
	/usr/bin/gcc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/cheerfulliu/Desktop/AISE/AISE/alloc.c -o CMakeFiles/projet.dir/alloc.c.s

CMakeFiles/projet.dir/alloc.c.o.requires:

.PHONY : CMakeFiles/projet.dir/alloc.c.o.requires

CMakeFiles/projet.dir/alloc.c.o.provides: CMakeFiles/projet.dir/alloc.c.o.requires
	$(MAKE) -f CMakeFiles/projet.dir/build.make CMakeFiles/projet.dir/alloc.c.o.provides.build
.PHONY : CMakeFiles/projet.dir/alloc.c.o.provides

CMakeFiles/projet.dir/alloc.c.o.provides.build: CMakeFiles/projet.dir/alloc.c.o


# Object files for target projet
projet_OBJECTS = \
"CMakeFiles/projet.dir/main.c.o" \
"CMakeFiles/projet.dir/alloc.c.o"

# External object files for target projet
projet_EXTERNAL_OBJECTS =

projet: CMakeFiles/projet.dir/main.c.o
projet: CMakeFiles/projet.dir/alloc.c.o
projet: CMakeFiles/projet.dir/build.make
projet: CMakeFiles/projet.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/cheerfulliu/Desktop/AISE/AISE/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Linking C executable projet"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/projet.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/projet.dir/build: projet

.PHONY : CMakeFiles/projet.dir/build

CMakeFiles/projet.dir/requires: CMakeFiles/projet.dir/main.c.o.requires
CMakeFiles/projet.dir/requires: CMakeFiles/projet.dir/alloc.c.o.requires

.PHONY : CMakeFiles/projet.dir/requires

CMakeFiles/projet.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/projet.dir/cmake_clean.cmake
.PHONY : CMakeFiles/projet.dir/clean

CMakeFiles/projet.dir/depend:
	cd /home/cheerfulliu/Desktop/AISE/AISE/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/cheerfulliu/Desktop/AISE/AISE /home/cheerfulliu/Desktop/AISE/AISE /home/cheerfulliu/Desktop/AISE/AISE/cmake-build-debug /home/cheerfulliu/Desktop/AISE/AISE/cmake-build-debug /home/cheerfulliu/Desktop/AISE/AISE/cmake-build-debug/CMakeFiles/projet.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/projet.dir/depend

