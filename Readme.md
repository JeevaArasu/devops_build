# React- Application
## Git Repository Clone
- Copy the git repo url: https://github.com/sriram-R-krishnan/devops-build to the local machine
### Using Command git clone
- make dir to the local machine
**Commands**
1. create the folder in local machine
      cd D:\
      mkdir capstone
      git clone https://github.com/sriram-R-krishnan/devops-build
      ![images](https://github.com/JeevaArasu/devops_build/blob/dev/images/Screenshot%202024-04-07%20231057.png)

#### Dockerize the given application
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
##### Bash script
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
  	 docker login -u jeevaarasu  -p dckr_pat_NXoExep3iTjubmqBCdmHgQ59faE
    	 if [[ $GIT_BRANCH == "origin/master" ]]; then
    	 docker tag capstone jeevaarasu/prod:cap
    	 docker push jeevaarasu/prod:cap
  	 elif [[ $GIT_BRANCH == "origin/dev" ]]; then
    	 docker tag capstone jeevaarasu/dev:app
    	 docker push jeevaarasu/dev:app
	 fi
	 :wq!( # to save the file)
```
###### Docker Hub
- Create two repositories 
	- Prod- private repo
   		Prod:[Prod-private repo](https://hub.docker.com/repository/docker/jeevaarasu/prod/)
	- Dev- public repo
   		DEV:[DEV-public repo](https://hub.docker.com/repository/docker/jeevaarasu/dev/)

###### Jenkins
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

- Create a new project with pipeline

