# nf-example-topology

## Description
An Example Network Function topology for Nephio that enables deployment of workload clusters 
running the free5gc UPF, SMF, and AMF network functions. Nephio supports deployment of arbitrary combinations
of these network functions to workload clusters.

## Usage

### Fetch the package
`kpt pkg get REPO_URI[.git]/PKG_PATH[@VERSION] nf-example-topology`

Details: https://kpt.dev/reference/cli/pkg/get/

### View package content
`kpt pkg tree nf-example-topology`

Details: https://kpt.dev/reference/cli/pkg/tree/

### Apply the package
```
kpt live init nf-example-topology
kpt live apply nf-example-topology --reconcile-timeout=2m --output=table
```
Details: https://kpt.dev/reference/cli/live/
