execute_process(COMMAND "/home/dawei/catkin-ws/build/robot_model/resource_retriever/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/dawei/catkin-ws/build/robot_model/resource_retriever/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
