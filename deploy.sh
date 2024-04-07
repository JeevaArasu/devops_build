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
