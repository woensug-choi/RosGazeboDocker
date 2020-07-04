# rosgazebodocker
ros gazebo desktop docker file

git clone https://github.com/woensug-choi/ROSGazeboDocker
cd ROSGazeboDocker
docker build -t ros-gazebo-desktop .

mkdir data
cd data

docker run -it --rm --name=ros_gazebo_desktop -m=4g -p 6080:80 -p 5901:5901 -p 5902:22 -v $PWD/data:/home/ubuntu/data -e RESOLUTION=1280x720 -e USER=ubuntu -e PASSWORD=ubuntu ros-gazebo-deskto

# View screen with browser 'http://localhost:6080'
# ssh with terminal 'ssh ubuntu@localhost -p 5902'
