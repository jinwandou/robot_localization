#!/bin/bash

#************************ test_ukf_localization_node_bag3 ***************************

#Command to run roscore
cmd1="source /opt/ros/melodic/setup.sh; roscore; exec /bin/bash"

#Command torRun ros1_bridge
cmd2="source ~/ros2_ws/install/setup.bash; source /opt/ros/melodic/setup.bash; ros2 run ros1_bridge dynamic_bridge --bridge-all-topics; exec /bin/bash"

#Command to play .bag from ROS1
cmd3="source /opt/ros/melodic/setup.bash; rosparam set /use_sim_time true; rosbag play ~/rl_ws_crystal/src/robot_localization/test/test3.bag --clock -d 5; exec /bin/bash"

#Command to launch TestCase launch.py
cmd4="source ~/rl_ws_crystal/install/setup.bash; ros2 launch robot_localization test_ukf_localization_node_bag3.launch.py; exec /bin/bash"

gnome-terminal --tab -t "roscore" -- /bin/bash -c "$cmd1" 
sleep 1
gnome-terminal --tab -t "ros1_bridge" -- /bin/bash -c "$cmd2"
gnome-terminal --tab -t "bag" -- /bin/bash -c "$cmd3" 
gnome-terminal --tab -t "TestCase_launch" -- /bin/bash -c "$cmd4"

