# CMake generated Testfile for 
# Source directory: /home/dawei/catkin-ws/src/recycle/laser_geometry
# Build directory: /home/dawei/catkin-ws/build/recycle/laser_geometry
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
ADD_TEST(_ctest_laser_geometry_gtest_projection_test "/home/dawei/catkin-ws/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/indigo/share/catkin/cmake/test/run_tests.py" "/home/dawei/catkin-ws/build/test_results/laser_geometry/gtest-projection_test.xml" "--return-code" "/home/dawei/catkin-ws/devel/lib/laser_geometry/projection_test --gtest_output=xml:/home/dawei/catkin-ws/build/test_results/laser_geometry/gtest-projection_test.xml")
ADD_TEST(_ctest_laser_geometry_nosetests_test.projection_test.py "/home/dawei/catkin-ws/build/catkin_generated/env_cached.sh" "/usr/bin/python" "/opt/ros/indigo/share/catkin/cmake/test/run_tests.py" "/home/dawei/catkin-ws/build/test_results/laser_geometry/nosetests-test.projection_test.py.xml" "--return-code" "/usr/bin/cmake -E make_directory /home/dawei/catkin-ws/build/test_results/laser_geometry" "/usr/bin/nosetests-2.7 -P --process-timeout=60 /home/dawei/catkin-ws/src/recycle/laser_geometry/test/projection_test.py --with-xunit --xunit-file=/home/dawei/catkin-ws/build/test_results/laser_geometry/nosetests-test.projection_test.py.xml")
