#!/bin/bash
echo "Logging in to Docker Hub..."
echo "$DOCKER_PASS" | docker login -u "$DOCKER_USERNAME" --password-stdin docker.io

if [[ $GIT_BRANCH == "origin/master" ]]; then
docker tag capstone jeevaarasu/react-app
docker push jeevaarasu/react-app
elif [[ $GIT_BRANCH == "dev" ]]; then
docker tag capstone jeevaarasu/dev-app
docker push jeevaarasu/dev-app
fi
