#!/bin/bash
echo "Logging in to Docker Hub..."
sudo docker login -u $DOCKER_USERNAME -p $DOCKER_PASS

if [[ $GIT_BRANCH == "origin/master" ]]; then
docker tag capstone jeevaarasu/react-app
docker push jeevaarasu/react-app
elif [[ $GIT_BRANCH == "origin/dev" ]]; then
docker tag capstone jeevaarasu/dev-app
docker push jeevaarasu/dev-app
fi
