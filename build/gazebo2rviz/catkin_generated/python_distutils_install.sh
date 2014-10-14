#!/bin/sh -x

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

cd "/home/dawei/catkin-ws/src/gazebo2rviz"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
/usr/bin/env \
    PYTHONPATH="/home/dawei/catkin-ws/install/lib/python2.7/dist-packages:/home/dawei/catkin-ws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/dawei/catkin-ws/build" \
    "/usr/bin/python" \
    "/home/dawei/catkin-ws/src/gazebo2rviz/setup.py" \
    build --build-base "/home/dawei/catkin-ws/build/gazebo2rviz" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/dawei/catkin-ws/install" --install-scripts="/home/dawei/catkin-ws/install/bin"
