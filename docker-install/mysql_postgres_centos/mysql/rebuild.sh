#!/bin/bash
docker rm -f centos-mysql57;
docker rmi -f centos-mysql57;
docker build -t centos-mysql57 .