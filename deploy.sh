#!/bin/bash
echo "Logging in to Docker Hub..."
docker login -u $DOCKER_USERNAME -p $DOCKER_PASS
echo "$DOCKER_PASS" | docker login -u "$DOCKER_USERNAME" --password-stdin docker.io
if [[ $GIT_BRANCH == "origin/master" ]]; then
docker tag capstone jeevaarasu/prod:cap
docker push jeevaarasu/prod:cap
elif [[ $GIT_BRANCH == "origin/dev" ]]; then
docker tag capstone jeevaarasu/dev:app
docker push jeevaarasu/dev:app
fi
