#!/bin/bash
echo "Logging in to Docker Hub..."
echo $DOCKER_PASS | docker login -u $DOCKER_USERNAME --password-stdin

if [[ $GIT_BRANCH == "origin/master" ]]; then
docker tag capstone jeevaarasu/react-app
docker push jeevaarasu/react-app
elif [[ $GIT_BRANCH == "origin/dev" ]]; then
docker tag capstone jeevaarasu/dev-app
docker push jeevaarasu/dev-app
fi
