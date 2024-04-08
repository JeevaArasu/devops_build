#!/bin/bash

docker stop reactapp || true
docker rm reactapp || true

docker build -t capstone .

docker run -d -it --name reactapp -p 80:80 capstone

