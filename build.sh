#!/bin/bash
docker-compose down || true
docker build -t capstone .

docker run -d -it --name reactapp -p 80:80 capstone
