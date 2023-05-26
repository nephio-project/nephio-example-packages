# cluster-capi

## Description

cluster-api package to deploy cluster api

## generate

```
clusterctl generate provider --core cluster-api:v1.1.5 > cluster-api-core.yaml
clusterctl generate provider --bootstrap kubeadm:v1.1.5 > cluster-api-bootstrap.yaml
clusterctl generate provider --control-plane kubeadm:v1.1.5 > cluster-api-control-plane.yaml
```