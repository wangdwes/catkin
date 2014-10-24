#include <ros/ros.h>
#include <urdf/model.h>
#include <sensor_msgs/JointState.h>
#include <tf/tf.h>
#include <tf/transform_broadcaster.h>
#include <tf/transform_listener.h>
#include <interactive_markers/interactive_marker_server.h>

// 1. parse the <rosparam:robot_description> and generate a model.
// 2. for each joint, create an interactive marker. 
// 3. initialize the marker with proper position and orientation, 
//    taking the current joint position into consideration.
// 4. set-up interactive control feedback.
// 5. find the position change on callback.
// 6. prepare a new message, with the changed position.

using namespace visualization_msgs;   

boost::shared_ptr<tf::TransformListener> tf_listener;
boost::shared_ptr<tf::TransformBroadcaster> tf_broadcaster;
boost::shared_ptr<interactive_markers::InteractiveMarkerServer> server;
boost::shared_ptr<ros::Publisher> joint_position_publisher;

void jointMarkerFeedback(
  const visualization_msgs::InteractiveMarkerFeedbackConstPtr &feedback) {

  // if the marker is installed on the gripper...
  if (feedback->marker_name == "base_link_marker") return; 

  // retrieving the joint_name...
  std::string joint_name = feedback->marker_name; 
  joint_name = joint_name.erase(joint_name.rfind("_marker"));

  // compute the angle and see if it's within the limits.
  tf::Quaternion current_tf_quaternion; tf::quaternionMsgToTF(feedback->pose.orientation, current_tf_quaternion);
  double current_joint_position = current_tf_quaternion.getAngle();

  // assemble a message and publish it!
  sensor_msgs::JointState message;
  message.name.push_back(joint_name);
  message.position.push_back(current_joint_position);

  joint_position_publisher->publish(message); // publish the position
  ROS_INFO("Missile away for %s with position = %lf", joint_name.c_str(), current_joint_position);

}

int main(int argc, char **argv)
{
  ros::init(argc, argv, "gripper_control");
  ros::NodeHandle handle;

  urdf::Model model;
  std::string robot_description;

  if (!handle.getParam("/robot_description", robot_description)) {
    ROS_ERROR("Cannot find /robot_description on the parameter server!.");
    return -1; }

  if (!model.initString(robot_description)) {
    ROS_ERROR("Failed to parse urdf.");
    return -1; }

  server.reset(new interactive_markers::InteractiveMarkerServer("gripper_control"));
  tf_listener.reset(new tf::TransformListener(handle));
  tf_broadcaster.reset(new tf::TransformBroadcaster()); 

  visualization_msgs::InteractiveMarker marker;
  marker.header.frame_id = "palm";
  marker.name = "base_link_marker";
  marker.scale = 0.4;

  visualization_msgs::InteractiveMarkerControl control;
  control.always_visible = true;
  control.orientation.x = 1;
  control.orientation.y = 0;
  control.orientation.z = 0;
  control.orientation.w = 1;
  control.name = "rotate_x";
  control.interaction_mode = visualization_msgs::InteractiveMarkerControl::ROTATE_AXIS;
  marker.controls.push_back(control);
  control.name = "move_x";
  control.interaction_mode = visualization_msgs::InteractiveMarkerControl::MOVE_AXIS;
  marker.controls.push_back(control);

  control.orientation.x = 0;
  control.orientation.y = 1;
  control.orientation.z = 0;
  control.orientation.w = 1;
  control.name = "rotate_y";
  control.interaction_mode = visualization_msgs::InteractiveMarkerControl::ROTATE_AXIS;
  marker.controls.push_back(control);
  control.name = "move_y";
  control.interaction_mode = visualization_msgs::InteractiveMarkerControl::MOVE_AXIS;
  marker.controls.push_back(control);

  control.orientation.x = 0;
  control.orientation.y = 0;
  control.orientation.z = 1;
  control.orientation.w = 1;
  control.name = "rotate_z";
  control.interaction_mode = visualization_msgs::InteractiveMarkerControl::ROTATE_AXIS;
  marker.controls.push_back(control);
  control.name = "move_z";
  control.interaction_mode = visualization_msgs::InteractiveMarkerControl::MOVE_AXIS;
  marker.controls.push_back(control);

  server->insert(marker, &jointMarkerFeedback);
  server->applyChanges();

  // attempt to obtain the initial joint states...
  ROS_INFO("Attempting to obtain current joint states by listening to /joint_states.");
  boost::shared_ptr<sensor_msgs::JointState const> initial_joint_states = 
    ros::topic::waitForMessage<sensor_msgs::JointState>("/joint_states", ros::Duration(10));

  // and store them in a decent map structure.
  std::map<std::string, double> initial_joint_positions;
  if (initial_joint_states != NULL) {
    for (int index = 0; index < initial_joint_states->name.size(); index++) {
      initial_joint_positions.insert(std::pair<std::string, double>(
        initial_joint_states->name[index], initial_joint_states->position[index])); } }

  // Iterate through all the joints in this model and create an interactive marker
  // for each of them. Note that we would have to retrieve the initial poses of
  // the joints in order to make sure that the joint positions as we know here
  // are synchronized with whatever that's happening outside. 

  for (std::map<std::string, boost::shared_ptr<urdf::Joint> >::iterator iter
    = model.joints_.begin(); iter != model.joints_.end(); iter++) {

    // Instantiate an interactive marker. The marker.header.stamp field must be left zero,
    // c.f.: http://docs.ros.org/indigo/api/visualization_msgs/html/msg/InteractiveMarker.html
    InteractiveMarker marker;
    marker.header.frame_id = iter->second->parent_link_name;
    marker.name = iter->first + "_marker";
    marker.scale = 0.03;

    // Get the default transformation from the parent link to the joint. 
    urdf::Pose pose = iter->second->parent_to_joint_origin_transform;
    marker.pose.position.x = pose.position.x;
    marker.pose.position.y = pose.position.y;
    marker.pose.position.z = pose.position.z;
    marker.pose.orientation.x = pose.rotation.x;
    marker.pose.orientation.y = pose.rotation.y;
    marker.pose.orientation.z = pose.rotation.z;
    marker.pose.orientation.w = pose.rotation.w;

    // Create an interactive marker control for axis rotation w.r.t. local x-axis. 
    visualization_msgs::InteractiveMarkerControl control;
    control.name = iter->first + "_control";
    control.always_visible = true;
    control.interaction_mode = visualization_msgs::InteractiveMarkerControl::ROTATE_AXIS;

    // The control always rotates with respect to the local x-axis. 
    // so we have to assign some quaternion to control.orientation such that 
    // iter->second->axis can be transformed to the local x-axis. 
    tf::Vector3 local_rotation_axis(1.0, 0.0, 0.0);
    tf::Vector3 joint_axis(iter->second->axis.x, iter->second->axis.y, iter->second->axis.z);
    tf::Quaternion local_frame( 
      local_rotation_axis.cross(joint_axis).normalized(),
      acos(local_rotation_axis.dot(joint_axis)));
    tf::quaternionTFToMsg(local_frame, control.orientation); 

    // If the joint has a non-zero initial position, we'll have to tinker 
    // with marker.pose.orientation a little bit.
    try {
      tf::Quaternion marker_pose_tf_quaternion;
      tf::quaternionMsgToTF(marker.pose.orientation, marker_pose_tf_quaternion);
      tf::quaternionTFToMsg(tf::Quaternion(
          tf::quatRotate(marker_pose_tf_quaternion, joint_axis),
          initial_joint_positions.at(iter->first)),
        marker.pose.orientation); }
    catch (std::exception e) {
      ROS_INFO("Cannot obtain the joint state of %s: %s", iter->first.c_str(), e.what()); }

    // Register the control with the marker, and the marker with the server. 
    marker.controls.push_back(control); 
    server->insert(marker, &jointMarkerFeedback); 
    server->applyChanges();

    ROS_INFO("%s created.", control.name.c_str());
  }

  ros::Publisher pub = handle.advertise<sensor_msgs::JointState>
    ("interactive_control_feedback", 1000);
  joint_position_publisher.reset(&pub);
 
  ROS_INFO("gripper_control spinning!");
  ros::spin();

  return 0;
}


