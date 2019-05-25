#!/bin/bash
docker rm -f centos-pg96
docker rmi -f centos-pg96
docker build -t centos-pg96 .