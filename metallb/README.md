# metallb

## Description
metallb package to deploy [MetalLB](https://metallb.universe.tf/)

MetalLB services require an IPAddressPool and BGPAdvertisement/L2Advertisement
Custom Resources, the following example defines a pool of IP Addresses as well
as a L2 configuration.

```yaml
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: example
  namespace: metallb-system
spec:
  addresses:
  - 172.18.0.0/20
---
apiVersion: metallb.io/v1beta1
kind: L2Advertisement
metadata:
  name: example
  namespace: metallb-system
```
