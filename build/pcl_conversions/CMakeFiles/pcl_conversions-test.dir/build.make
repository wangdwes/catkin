# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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
CMAKE_SOURCE_DIR = /home/dawei/catkin-ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/dawei/catkin-ws/build

# Include any dependencies generated for this target.
include pcl_conversions/CMakeFiles/pcl_conversions-test.dir/depend.make

# Include the progress variables for this target.
include pcl_conversions/CMakeFiles/pcl_conversions-test.dir/progress.make

# Include the compile flags for this target's objects.
include pcl_conversions/CMakeFiles/pcl_conversions-test.dir/flags.make

pcl_conversions/CMakeFiles/pcl_conversions-test.dir/test/test_pcl_conversions.cpp.o: pcl_conversions/CMakeFiles/pcl_conversions-test.dir/flags.make
pcl_conversions/CMakeFiles/pcl_conversions-test.dir/test/test_pcl_conversions.cpp.o: /home/dawei/catkin-ws/src/pcl_conversions/test/test_pcl_conversions.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /home/dawei/catkin-ws/build/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object pcl_conversions/CMakeFiles/pcl_conversions-test.dir/test/test_pcl_conversions.cpp.o"
	cd /home/dawei/catkin-ws/build/pcl_conversions && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/pcl_conversions-test.dir/test/test_pcl_conversions.cpp.o -c /home/dawei/catkin-ws/src/pcl_conversions/test/test_pcl_conversions.cpp

pcl_conversions/CMakeFiles/pcl_conversions-test.dir/test/test_pcl_conversions.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/pcl_conversions-test.dir/test/test_pcl_conversions.cpp.i"
	cd /home/dawei/catkin-ws/build/pcl_conversions && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /home/dawei/catkin-ws/src/pcl_conversions/test/test_pcl_conversions.cpp > CMakeFiles/pcl_conversions-test.dir/test/test_pcl_conversions.cpp.i

pcl_conversions/CMakeFiles/pcl_conversions-test.dir/test/test_pcl_conversions.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/pcl_conversions-test.dir/test/test_pcl_conversions.cpp.s"
	cd /home/dawei/catkin-ws/build/pcl_conversions && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /home/dawei/catkin-ws/src/pcl_conversions/test/test_pcl_conversions.cpp -o CMakeFiles/pcl_conversions-test.dir/test/test_pcl_conversions.cpp.s

pcl_conversions/CMakeFiles/pcl_conversions-test.dir/test/test_pcl_conversions.cpp.o.requires:
.PHONY : pcl_conversions/CMakeFiles/pcl_conversions-test.dir/test/test_pcl_conversions.cpp.o.requires

pcl_conversions/CMakeFiles/pcl_conversions-test.dir/test/test_pcl_conversions.cpp.o.provides: pcl_conversions/CMakeFiles/pcl_conversions-test.dir/test/test_pcl_conversions.cpp.o.requires
	$(MAKE) -f pcl_conversions/CMakeFiles/pcl_conversions-test.dir/build.make pcl_conversions/CMakeFiles/pcl_conversions-test.dir/test/test_pcl_conversions.cpp.o.provides.build
.PHONY : pcl_conversions/CMakeFiles/pcl_conversions-test.dir/test/test_pcl_conversions.cpp.o.provides

pcl_conversions/CMakeFiles/pcl_conversions-test.dir/test/test_pcl_conversions.cpp.o.provides.build: pcl_conversions/CMakeFiles/pcl_conversions-test.dir/test/test_pcl_conversions.cpp.o

# Object files for target pcl_conversions-test
pcl_conversions__test_OBJECTS = \
"CMakeFiles/pcl_conversions-test.dir/test/test_pcl_conversions.cpp.o"

# External object files for target pcl_conversions-test
pcl_conversions__test_EXTERNAL_OBJECTS =

/home/dawei/catkin-ws/devel/lib/pcl_conversions/pcl_conversions-test: pcl_conversions/CMakeFiles/pcl_conversions-test.dir/test/test_pcl_conversions.cpp.o
/home/dawei/catkin-ws/devel/lib/pcl_conversions/pcl_conversions-test: pcl_conversions/CMakeFiles/pcl_conversions-test.dir/build.make
/home/dawei/catkin-ws/devel/lib/pcl_conversions/pcl_conversions-test: gtest/libgtest.so
/home/dawei/catkin-ws/devel/lib/pcl_conversions/pcl_conversions-test: /opt/ros/indigo/lib/libroscpp.so
/home/dawei/catkin-ws/devel/lib/pcl_conversions/pcl_conversions-test: /usr/lib/x86_64-linux-gnu/libboost_signals.so
/home/dawei/catkin-ws/devel/lib/pcl_conversions/pcl_conversions-test: /usr/lib/x86_64-linux-gnu/libboost_filesystem.so
/home/dawei/catkin-ws/devel/lib/pcl_conversions/pcl_conversions-test: /opt/ros/indigo/lib/librosconsole.so
/home/dawei/catkin-ws/devel/lib/pcl_conversions/pcl_conversions-test: /opt/ros/indigo/lib/librosconsole_log4cxx.so
/home/dawei/catkin-ws/devel/lib/pcl_conversions/pcl_conversions-test: /opt/ros/indigo/lib/librosconsole_backend_interface.so
/home/dawei/catkin-ws/devel/lib/pcl_conversions/pcl_conversions-test: /usr/lib/liblog4cxx.so
/home/dawei/catkin-ws/devel/lib/pcl_conversions/pcl_conversions-test: /usr/lib/x86_64-linux-gnu/libboost_regex.so
/home/dawei/catkin-ws/devel/lib/pcl_conversions/pcl_conversions-test: /opt/ros/indigo/lib/libxmlrpcpp.so
/home/dawei/catkin-ws/devel/lib/pcl_conversions/pcl_conversions-test: /opt/ros/indigo/lib/libroscpp_serialization.so
/home/dawei/catkin-ws/devel/lib/pcl_conversions/pcl_conversions-test: /opt/ros/indigo/lib/librostime.so
/home/dawei/catkin-ws/devel/lib/pcl_conversions/pcl_conversions-test: /usr/lib/x86_64-linux-gnu/libboost_date_time.so
/home/dawei/catkin-ws/devel/lib/pcl_conversions/pcl_conversions-test: /opt/ros/indigo/lib/libcpp_common.so
/home/dawei/catkin-ws/devel/lib/pcl_conversions/pcl_conversions-test: /usr/lib/x86_64-linux-gnu/libboost_system.so
/home/dawei/catkin-ws/devel/lib/pcl_conversions/pcl_conversions-test: /usr/lib/x86_64-linux-gnu/libboost_thread.so
/home/dawei/catkin-ws/devel/lib/pcl_conversions/pcl_conversions-test: /usr/lib/x86_64-linux-gnu/libpthread.so
/home/dawei/catkin-ws/devel/lib/pcl_conversions/pcl_conversions-test: /usr/lib/x86_64-linux-gnu/libconsole_bridge.so
/home/dawei/catkin-ws/devel/lib/pcl_conversions/pcl_conversions-test: pcl_conversions/CMakeFiles/pcl_conversions-test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable /home/dawei/catkin-ws/devel/lib/pcl_conversions/pcl_conversions-test"
	cd /home/dawei/catkin-ws/build/pcl_conversions && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/pcl_conversions-test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
pcl_conversions/CMakeFiles/pcl_conversions-test.dir/build: /home/dawei/catkin-ws/devel/lib/pcl_conversions/pcl_conversions-test
.PHONY : pcl_conversions/CMakeFiles/pcl_conversions-test.dir/build

pcl_conversions/CMakeFiles/pcl_conversions-test.dir/requires: pcl_conversions/CMakeFiles/pcl_conversions-test.dir/test/test_pcl_conversions.cpp.o.requires
.PHONY : pcl_conversions/CMakeFiles/pcl_conversions-test.dir/requires

pcl_conversions/CMakeFiles/pcl_conversions-test.dir/clean:
	cd /home/dawei/catkin-ws/build/pcl_conversions && $(CMAKE_COMMAND) -P CMakeFiles/pcl_conversions-test.dir/cmake_clean.cmake
.PHONY : pcl_conversions/CMakeFiles/pcl_conversions-test.dir/clean

pcl_conversions/CMakeFiles/pcl_conversions-test.dir/depend:
	cd /home/dawei/catkin-ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/dawei/catkin-ws/src /home/dawei/catkin-ws/src/pcl_conversions /home/dawei/catkin-ws/build /home/dawei/catkin-ws/build/pcl_conversions /home/dawei/catkin-ws/build/pcl_conversions/CMakeFiles/pcl_conversions-test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : pcl_conversions/CMakeFiles/pcl_conversions-test.dir/depend

