# metallb-sandbox-config

## Description
Nephio Sandbox config for Metal LB

## Usage

### Fetch the package
`kpt pkg get REPO_URI[.git]/PKG_PATH[@VERSION] metallb-sandbox-config`
Details: https://kpt.dev/reference/cli/pkg/get/

### View package content
`kpt pkg tree metallb-sandbox-config`
Details: https://kpt.dev/reference/cli/pkg/tree/

### Apply the package
```
kpt live init metallb-sandbox-config
kpt live apply metallb-sandbox-config --reconcile-timeout=2m --output=table
```
Details: https://kpt.dev/reference/cli/live/
