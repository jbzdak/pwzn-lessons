# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.0

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
CMAKE_SOURCE_DIR = /home/jb/dydakyka/pwzd/cpp-ex/sort-ctypes

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/jb/dydakyka/pwzd/cpp-ex/sort-ctypes/build

# Include any dependencies generated for this target.
include CMakeFiles/test.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/test.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/test.dir/flags.make

CMakeFiles/test.dir/src/test.cpp.o: CMakeFiles/test.dir/flags.make
CMakeFiles/test.dir/src/test.cpp.o: ../src/test.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jb/dydakyka/pwzd/cpp-ex/sort-ctypes/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/test.dir/src/test.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test.dir/src/test.cpp.o -c /home/jb/dydakyka/pwzd/cpp-ex/sort-ctypes/src/test.cpp

CMakeFiles/test.dir/src/test.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test.dir/src/test.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/jb/dydakyka/pwzd/cpp-ex/sort-ctypes/src/test.cpp > CMakeFiles/test.dir/src/test.cpp.i

CMakeFiles/test.dir/src/test.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test.dir/src/test.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/jb/dydakyka/pwzd/cpp-ex/sort-ctypes/src/test.cpp -o CMakeFiles/test.dir/src/test.cpp.s

CMakeFiles/test.dir/src/test.cpp.o.requires:
.PHONY : CMakeFiles/test.dir/src/test.cpp.o.requires

CMakeFiles/test.dir/src/test.cpp.o.provides: CMakeFiles/test.dir/src/test.cpp.o.requires
	$(MAKE) -f CMakeFiles/test.dir/build.make CMakeFiles/test.dir/src/test.cpp.o.provides.build
.PHONY : CMakeFiles/test.dir/src/test.cpp.o.provides

CMakeFiles/test.dir/src/test.cpp.o.provides.build: CMakeFiles/test.dir/src/test.cpp.o

CMakeFiles/test.dir/src/sort.cpp.o: CMakeFiles/test.dir/flags.make
CMakeFiles/test.dir/src/sort.cpp.o: ../src/sort.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/jb/dydakyka/pwzd/cpp-ex/sort-ctypes/build/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object CMakeFiles/test.dir/src/sort.cpp.o"
	/usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/test.dir/src/sort.cpp.o -c /home/jb/dydakyka/pwzd/cpp-ex/sort-ctypes/src/sort.cpp

CMakeFiles/test.dir/src/sort.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/test.dir/src/sort.cpp.i"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/jb/dydakyka/pwzd/cpp-ex/sort-ctypes/src/sort.cpp > CMakeFiles/test.dir/src/sort.cpp.i

CMakeFiles/test.dir/src/sort.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/test.dir/src/sort.cpp.s"
	/usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/jb/dydakyka/pwzd/cpp-ex/sort-ctypes/src/sort.cpp -o CMakeFiles/test.dir/src/sort.cpp.s

CMakeFiles/test.dir/src/sort.cpp.o.requires:
.PHONY : CMakeFiles/test.dir/src/sort.cpp.o.requires

CMakeFiles/test.dir/src/sort.cpp.o.provides: CMakeFiles/test.dir/src/sort.cpp.o.requires
	$(MAKE) -f CMakeFiles/test.dir/build.make CMakeFiles/test.dir/src/sort.cpp.o.provides.build
.PHONY : CMakeFiles/test.dir/src/sort.cpp.o.provides

CMakeFiles/test.dir/src/sort.cpp.o.provides.build: CMakeFiles/test.dir/src/sort.cpp.o

# Object files for target test
test_OBJECTS = \
"CMakeFiles/test.dir/src/test.cpp.o" \
"CMakeFiles/test.dir/src/sort.cpp.o"

# External object files for target test
test_EXTERNAL_OBJECTS =

test: CMakeFiles/test.dir/src/test.cpp.o
test: CMakeFiles/test.dir/src/sort.cpp.o
test: CMakeFiles/test.dir/build.make
test: CMakeFiles/test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable test"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/test.dir/build: test
.PHONY : CMakeFiles/test.dir/build

CMakeFiles/test.dir/requires: CMakeFiles/test.dir/src/test.cpp.o.requires
CMakeFiles/test.dir/requires: CMakeFiles/test.dir/src/sort.cpp.o.requires
.PHONY : CMakeFiles/test.dir/requires

CMakeFiles/test.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/test.dir/cmake_clean.cmake
.PHONY : CMakeFiles/test.dir/clean

CMakeFiles/test.dir/depend:
	cd /home/jb/dydakyka/pwzd/cpp-ex/sort-ctypes/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/jb/dydakyka/pwzd/cpp-ex/sort-ctypes /home/jb/dydakyka/pwzd/cpp-ex/sort-ctypes /home/jb/dydakyka/pwzd/cpp-ex/sort-ctypes/build /home/jb/dydakyka/pwzd/cpp-ex/sort-ctypes/build /home/jb/dydakyka/pwzd/cpp-ex/sort-ctypes/build/CMakeFiles/test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/test.dir/depend

