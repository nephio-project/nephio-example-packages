# cluster

## Description

This package provides a blueprint manifest to deploy a kind cluster using cluster api

The package contains some defaults but can be changed through the kpt pipeline
- pod cidrBlocks: 192.168.0.0/16
- service cidrBlocks: 10.128.0.0/12
- service domain: cluster.local
- kubernetes version: v1.26.3
- workers: 3

The package has some host dependencies:
- /opt/cni/bin for accessing the cni(s)
- /var/run/docker.sock for the docker socket