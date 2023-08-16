# flux-helm-controllers

## Description

kpt package for provisioning flux helm-controller and source-controller.

These controllers provide a mechanism to deploy existing helm charts from a given source.
See https://fluxcd.io/flux/ for more details.

## Usage

### Fetch the package
`kpt pkg get REPO_URI[.git]/PKG_PATH[@VERSION] flux-helm-controllers`
Details: https://kpt.dev/reference/cli/pkg/get/

### View package content
`kpt pkg tree flux-helm-controllers`
Details: https://kpt.dev/reference/cli/pkg/tree/

### Apply the package
```
kpt live init flux-helm-controllers
kpt live apply flux-helm-controllers --reconcile-timeout=2m --output=table
```
Details: https://kpt.dev/reference/cli/live/