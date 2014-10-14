# CMake generated Testfile for 
# Source directory: /home/dawei/catkin-ws/src/recycle/laser_assembler
# Build directory: /home/dawei/catkin-ws/build/recycle/laser_assembler
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
ADD_TEST(_ctest_laser_assembler_gtest_test_assembler "/home/dawei/catkin-ws/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/indigo/share/catkin/cmake/test/run_tests.py" "/home/dawei/catkin-ws/build/test_results/laser_assembler/gtest-test_assembler.xml" "--return-code" "/home/dawei/catkin-ws/devel/lib/laser_assembler/test_assembler --gtest_output=xml:/home/dawei/catkin-ws/build/test_results/laser_assembler/gtest-test_assembler.xml")
ADD_TEST(_ctest_laser_assembler_rostest_test_test_laser_assembler.launch "/home/dawei/catkin-ws/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/indigo/share/catkin/cmake/test/run_tests.py" "/home/dawei/catkin-ws/build/test_results/laser_assembler/rostest-test_test_laser_assembler.xml" "--return-code" "/opt/ros/indigo/share/rostest/cmake/../../../bin/rostest --pkgdir=/home/dawei/catkin-ws/src/recycle/laser_assembler --package=laser_assembler --results-filename test_test_laser_assembler.xml /home/dawei/catkin-ws/src/recycle/laser_assembler/test/test_laser_assembler.launch ")
