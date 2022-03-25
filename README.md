# dockerFile ubuntu 18.02 cuda10.2 ,python tensorflow gpu


# instrucions

to build this image you need a Nvida graphics card and ubuntu OS

# install docker on your host OS
![My Remote Image](https://profile.es/wp-content/media/image.png)
### Step 1: Updating the Software Repository
sudo apt update
### Step 2: Downloading Dependencies
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common

### Step 3: Adding Docker’s GPG Key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

### Step 4: Installing the Docker Repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"

### Step 5: Installing the Latest Docker
sudo apt update
sudo apt-get install docker-ce

### version docker
docker --version

### Step6 : Enable Docker Service 
sudo systemctl start docker
sudo systemctl enable docker
sudo systemctl status docker

# Nvida container Toolkit en ubuntu20.04 instalacion 
![My Remote Image](https://developer.nvidia.com/blog/wp-content/uploads/2018/05/dgx-docker-625x592.png)

curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | apt-key add - 

curl -s -L https://nvidia.github.io/nvidia-docker/ubuntu20.04/nvidia-docker.list >/etc/apt/sources.list.d/nvidia-docker.list 

apt update 

apt -y install nvidia-container-toolkit 

systemctl restart docker 

# buildDocker
sudo docker build -t XXx:name
