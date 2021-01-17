# drone_turtlebot_gazebo
필수 ros 패키지 :<br>
https://github.com/tu-darmstadt-ros-pkg/hector_localization<br>
https://github.com/tu-darmstadt-ros-pkg/hector_quadrotor<br>
https://github.com/tu-darmstadt-ros-pkg/hector_gazebo<br>
https://github.com/tu-darmstadt-ros-pkg/hector_models<br>
https://github.com/ROBOTIS-GIT/turtlebot3<br>
https://github.com/ROBOTIS-GIT/turtlebot3_simulations<br>
https://github.com/ROBOTIS-GIT/turtlebot3_msgs<br>

# Hector drone gazebo 작동법

    rosservice call /enable_motors "enable : true"
    
# Test

    rostopic pub -r 10 /drone1/cmd_vel geometry_msgs/Twist '{linear: {x: 0, y: 0.0, z: 1.0}, angular: {x: 0.0, y: 0.0, z: 0.0}}'
    
    
# Setting
Hector quadrotor 자체에 pid controller가 있기 때문에 주석처리한 뒤 본인의 controller를 만들면 된다.<br>

    cd /catkin_ws/src/hector_quadrotor/hector_quadrotor_gazebo/urdf
    
이동한 뒤<br>

    quadrotor_plugins.gazebo.xacro

controller 관련 소스 주석처리
