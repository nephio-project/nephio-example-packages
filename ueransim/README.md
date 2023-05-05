# ueransim

## Description

Package representing UERANSIM microservices.

Package definition is based on [Towards5gs helm charts](https://github.com/Orange-OpenSource/towards5gs-helm), 
and service level configuration is preserved as defined there. This package requires further specialization.

### Services

UERANSIM project implements following services:

| Service | Description | Specialization |
| --- | --- | --- |
| gNB | it represents 5G RAN - gNodeB | N2/N3 reference points - IPs and NADs |
| UE | it represents 5G User Equipment | none for default service-level configuration |

Details: https://github.com/aligungr/UERANSIM

### Dependencies

- by default `UE` communicates with `gNB` via K8s `ClusterIP` service
    - it forces you to deploy both services on a single cluster, consider including `service mesh` in a multi-cluster scenario, or changing `UE` configuration (*`gnbSearchList`*)

### gNB Specialization

- `ngapIp` - it's N2 reference point, need to be aligned with `AMF` N2
- `gtpIp` - it's N3 reference point, need to be aligned with `UPF` N3
- `amfConfigs` - list of avaliable `AMF` NFs, be default it communicates with `AMF` via K8s `NodePort` service
- `NADs` need to be adjusted properly
- `k8s.v1.cni.cncf.io/networks` annotation need to be adjusted properly

## Usage

### Fetch the package

`kpt pkg get REPO_URI[.git]/PKG_PATH[@VERSION] ueransim`

Details: https://kpt.dev/reference/cli/pkg/get/

### View package content

`kpt pkg tree ueransim`

Details: https://kpt.dev/reference/cli/pkg/tree/

### Apply the package

```
kpt live init ueransim
kpt live apply ueransim --reconcile-timeout=2m --output=table
```

Details: https://kpt.dev/reference/cli/live/
