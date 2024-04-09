# React- Application
# Git Repository Clone
- Copy the git repo url: https://github.com/sriram-R-krishnan/devops-build to the local machine
# Using Command git clone
- make dir to the local machine
**Commands**
1. create the folder in local machine
      cd D:\
      mkdir capstone
      git clone https://github.com/sriram-R-krishnan/devops-build
      ![images](https://github.com/JeevaArasu/devops_build/blob/dev/images/Screenshot%202024-04-07%20231057.png)

# Dockerize the given application
**Commands** 

2. Dockerfile:
```
# create new docker file
  	 vi Dockerfile
   	 FROM nginx:latest
  	 COPY .  /usr/share/nginx/html/
  	 EXPOSE  80
  	 CMD [“nginx”, “-g”, “daemon off;”]
	 :wq! (# to save the file)
``` 
3. docker-comppose.yml
```
 # create new docker-compose file
   	 vi docker-compose.yml
	 version: ‘3’
	 services:
	 	capstone: 
		build: 
			context: .
			dockerfile: Dockerfile
		ports:
		    - “80:80”
	 :wq! (# to save the file)
```
# Bash script
**Commands** 

4. build.sh
 ```
 #create build.sh
	  vi build.sh
	   #!/bin/bash
	   docker build -t capstone .
	   docker run -d –name react-app -p 80:80 capstone
	   :wq!( # to save the file)
```
5. deploy.sh
```
 #create build.sh
	 vi deploy.sh
	 #!/bin/bash
  	 echo "Logging in to Docker Hub..."
  	 docker login -u $DOCKER_USERNAME  -p $DOCKER_PASS
    	 if [[ $GIT_BRANCH == "origin/master" ]]; then
    	 docker tag capstone jeevaarasu/prod:cap
    	 docker push jeevaarasu/prod:cap
  	 elif [[ $GIT_BRANCH == "origin/dev" ]]; then
    	 docker tag capstone jeevaarasu/dev:app
    	 docker push jeevaarasu/dev:app
	 fi
	 :wq!( # to save the file)
```
# Docker Hub
- Create two repositories 
	- Prod:[Prod-private repo](https://hub.docker.com/repository/docker/jeevaarasu/prod/)
	- DEV:[DEV-public repo](https://hub.docker.com/repository/docker/jeevaarasu/dev/)
	  ![images](https://github.com/JeevaArasu/devops_build/blob/dev/images/Screenshot%202024-04-08%20213115.png)
# Jenkins
 6. To install jenkins
    
**Commands** 
```
- Install java:
	 sudo apt install openjdk-17-jdk  -y 
- Install jenkins
  	 sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
	 https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
  	 echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  	 https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  	 /etc/apt/sources.list.d/jenkins.list > /dev/null
  	 sudo apt-get update
  	 sudo apt-get install jenkins -y
  	 sudo usermod -aG docker jenkins
  	 sudo  systemctl restart jenkins
```
- Complete the setup wizard of Jenkins.
  ![images](https://github.com/JeevaArasu/devops_build/blob/dev/images/Screenshot%202024-04-08%20224559.png)
  ![images](https://github.com/JeevaArasu/devops_build/blob/dev/images/Screenshot%202024-04-08%20224725.png)
- Create a new project with pipeline.
  ![images](https://github.com/JeevaArasu/devops_build/blob/dev/images/Screenshot%202024-04-08%20225000.png)
  ![images](https://github.com/JeevaArasu/devops_build/blob/dev/images/Screenshot%202024-04-08%20225042.png)
- Build output:-
  - Push from Dev branch:
  	   ![images](https://github.com/JeevaArasu/devops_build/blob/dev/images/Screenshot%202024-04-08%20233642.png)
  	   ![images](https://github.com/JeevaArasu/devops_build/blob/dev/images/Screenshot%202024-04-08%20233732.png)
  - Images push to dev repo
  	   ![images](https://github.com/JeevaArasu/devops_build/blob/dev/images/Screenshot%202024-04-08%20234425.png)
  - Enable continous triggers for Github webhook:
    	   ![images](https://github.com/JeevaArasu/devops_build/blob/dev/images/Screenshot%202024-04-08%20234113.png)
  - Push from Master branch:
	  ![images](https://github.com/JeevaArasu/devops_build/blob/dev/images/Screenshot%202024-04-08%20234304.png)
          ![images](https://github.com/JeevaArasu/devops_build/blob/dev/images/Screenshot%202024-04-08%20234335.png)
   - Images push to prod repo
   	  ![images](https://github.com/JeevaArasu/devops_build/blob/dev/images/Screenshot%202024-04-08%20234459.png)
       	
# AWS
- Launch EC2 instance type t2.micro & create the Security group
  ![images](https://github.com/JeevaArasu/devops_build/blob/dev/images/Screenshot%202024-04-09%20230525.png)
  ![images](https://github.com/JeevaArasu/devops_build/blob/dev/images/Screenshot%202024-04-09%20230346.png)
- Deploy the created application
  	- Login the server via ssh and clone the github url repo
  	- deploy the application and it accessble from diifernt who ever have public ip.
**Access from mobile**
   ![images](https://github.com/JeevaArasu/devops_build/blob/dev/images/WhatsApp%20Image%202024-04-09%20at%2023.11.38_d23d146f.jpg)
**Access from GUI**
  ![images](https://github.com/JeevaArasu/devops_build/blob/dev/images/Screenshot%202024-04-09%20230244.png)
  
  

