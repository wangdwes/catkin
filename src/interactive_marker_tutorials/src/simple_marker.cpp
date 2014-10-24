#include <ros/ros.h>
#include <tf/transform_broadcaster.h>
#include <interactive_markers/interactive_marker_server.h>

void processFeedback(
    const visualization_msgs::InteractiveMarkerFeedbackConstPtr &feedback )
{

  static tf::TransformBroadcaster broadcaster;
  tf::Transform transform(
    tf::Quaternion(
      feedback->pose.orientation.x,
      feedback->pose.orientation.y,
      feedback->pose.orientation.z,
      feedback->pose.orientation.w),
    tf::Vector3(
      feedback->pose.position.x,
      feedback->pose.position.y,
      feedback->pose.position.z));

  broadcaster.sendTransform(tf::StampedTransform(
    transform,
    ros::Time::now(),
    "world",
    "palm"));

}

int main(int argc, char** argv)
{
  ros::init(argc, argv, "robotiq_gripper_mover");

  // create an interactive marker server on the topic namespace simple_marker
  interactive_markers::InteractiveMarkerServer server("robotiq_gripper");

  // create an interactive marker for our server
  visualization_msgs::InteractiveMarker int_marker;
  int_marker.header.frame_id = "/palm";
  int_marker.name = "robotiq_gripper";
  int_marker.description = "Robotiq Gripper";

  visualization_msgs::InteractiveMarkerControl rotate_control;
  rotate_control.name = "move_x";
  rotate_control.interaction_mode =
      visualization_msgs::InteractiveMarkerControl::MOVE_AXIS;

  int_marker.controls.push_back(rotate_control);
//  server.insert(int_marker, &processFeedback);
  server.applyChanges();

  

  // start the ROS main loop
  ros::spin();
}
// %Tag(fullSource)%
