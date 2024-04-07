#!/bin/bash

docker build -t capstone .

docker run -d -it --name reactapp -p 80:80 capstone

docker-compose down || true

docker-compose up -d
