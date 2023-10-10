# nephio-vcsr-pkg

## Description
sample description

## Usage

### Fetch the package
`kpt pkg get REPO_URI[.git]/PKG_PATH[@VERSION] nephio-vcsr-pkg`
Details: https://kpt.dev/reference/cli/pkg/get/

### View package content
`kpt pkg tree nephio-vcsr-pkg`
Details: https://kpt.dev/reference/cli/pkg/tree/

### Apply the package
```
kpt live init nephio-vcsr-pkg
kpt live apply nephio-vcsr-pkg --reconcile-timeout=2m --output=table
```
Details: https://kpt.dev/reference/cli/live/
