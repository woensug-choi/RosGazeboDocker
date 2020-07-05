# RosGazeboDocker
Ubuntu 18.04 + ROS Melodic + Gazebo 9 + VNC docker file

# Installation
```
git clone https://github.com/woensug-choi/ROSGazeboDocker

cd ROSGazeboDocker

sudo docker build -t ros-gazebo-desktop .

mkdir data
```
if no docker error
```
sudo apt install docker.io
sudo systemctl start docker
```
if 'sudo systemctl start docker' error, try 'sudo /etc/init.d/docker start'

# Run
```
docker run -it --rm --name=ros_gazebo_desktop -m=4g -p 6080:80 -p 5901:5900 -p 5902:22 -v $PWD/data:/home/ubuntu/data:delegated -e RESOLUTION=1280x720 -e USER=ubuntu -e PASSWORD=ubuntu ros-gazebo-deskto
```
# VNC and SSH
View screen with browser 'http://localhost:6080'

Use VNC client to connect through localhost:5901

To SSH from other host or other machines,
run 'service ssh start' in server terminal to start ssh server
run 'ssh ubuntu@localhost -p 5902' from client
