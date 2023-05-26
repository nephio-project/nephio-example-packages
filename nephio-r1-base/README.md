# nephio-r1-base

## Description
Base packages for the Nephio R1 Management Cluster

## Usage

### Fetch the package
`kpt pkg get REPO_URI[.git]/PKG_PATH[@VERSION] nephio-r1-base`
Details: https://kpt.dev/reference/cli/pkg/get/

### View package content
`kpt pkg tree nephio-r1-base`
Details: https://kpt.dev/reference/cli/pkg/tree/

### Apply the package
```
kpt live init nephio-r1-base
kpt live apply nephio-r1-base --reconcile-timeout=2m --output=table
```
Details: https://kpt.dev/reference/cli/live/
