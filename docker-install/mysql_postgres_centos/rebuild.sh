#!/bin/bash
#build centos pg
docker rm -f centos-pg96
docker rmi -f centos-pg96
docker build -t centos-pg96 ./docker-postgresql
#build centos pg


docker-compose down
docker-compose up -d
