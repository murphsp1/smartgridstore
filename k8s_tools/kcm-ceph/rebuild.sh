#!/bin/bash
set -ex
docker build -t btrdb/kubernetes-controller-manager-rbd:1.7.0 .
docker push btrdb/kubernetes-controller-manager-rbd:1.7.0
