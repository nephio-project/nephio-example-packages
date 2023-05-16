# gitea

## Description

Gitea package to deploy a gitea server in a gitea namespace

We assume there is 2 secrets created in the namespace where gitea gets deployed with the following parameters

```
cat <<EOF | kubectl apply -f - 
  apiVersion: v1
  kind: Secret
  metadata:
    name: gitea-postgresql
    namespace: gitea
    labels:
      app.kubernetes.io/name: postgresql
      app.kubernetes.io/instance: gitea
  type: Opaque
  data:
    postgres-password: "...."
    password: "...."
```

```
cat <<EOF | kubectl apply -f - 
  apiVersion: v1
  kind: Secret
  metadata:
    name: git-user-secret
    namespace: gitea
  type: kubernetes.io/basic-auth
  stringData:
    username: ...      
    password: ...
EOF
```