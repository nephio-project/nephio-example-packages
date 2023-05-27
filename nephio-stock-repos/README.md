# nephio-stock-repos

## Description
Some stock external repositories to start with

## Usage

### Fetch the package
`kpt pkg get REPO_URI[.git]/PKG_PATH[@VERSION] nephio-stock-repos`
Details: https://kpt.dev/reference/cli/pkg/get/

### View package content
`kpt pkg tree nephio-stock-repos`
Details: https://kpt.dev/reference/cli/pkg/tree/

### Apply the package
```
kpt live init nephio-stock-repos
kpt live apply nephio-stock-repos --reconcile-timeout=2m --output=table
```
Details: https://kpt.dev/reference/cli/live/
