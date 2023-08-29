# gitea

## Description

Gitea package to deploy a gitea server in a gitea namespace

# OpenShift

When deploying this kpt package on OpenShift, you have to supply a specific SecurityContext because Gitea expect a specific `fsGroup` and `uid` that aren't in the tolerated range of OpenShift. To do so, apply the following manifests, that will create an SCC, a Role and a RoleBinding.

```
echo "kind: SecurityContextConstraints
metadata:
  name: gitea
allowHostDirVolumePlugin: false
allowHostIPC: false
allowHostNetwork: false
allowHostPID: false
allowHostPorts: false
allowPrivilegeEscalation: true
allowPrivilegedContainer: false
allowedCapabilities: null
apiVersion: security.openshift.io/v1
defaultAddCapabilities: null
fsGroup:
  type: RunAsAny
priority: 10
readOnlyRootFilesystem: false
requiredDropCapabilities:
- MKNOD
runAsUser:
  type: RunAsAny
seLinuxContext:
  type: MustRunAs
supplementalGroups:
  type: RunAsAny
users: []
volumes:
- configMap
- downwardAPI
- emptyDir
- persistentVolumeClaim
- projected
- secret
---
apiVersion: rbac.authorization.k8s.io/v1
kind: Role
metadata:
  name: gitea-role
  namespace: gitea
rules:
- apiGroups:
  - security.openshift.io 
  resourceNames:
  - gitea
  resources:
  - securitycontextconstraints 
  verbs: 
  - use
---
apiVersion: rbac.authorization.k8s.io/v1
kind: RoleBinding
metadata:
  name: gitea-rolebinding
  namespace: gitea
subjects:
- kind: ServiceAccount
  name: default
roleRef:
  kind: Role
  name: gitea-role
  apiGroup: rbac.authorization.k8s.io
" | kubectl apply -f -
```