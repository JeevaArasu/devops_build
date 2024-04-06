#!/bin/bash

docker build -t capstone .

docker run -d -it --name reactapp -p 80:80 capstone

docker login -u $DOCKER_USERNAME -p $DOCKER_PASS



