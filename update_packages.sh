#!/usr/bin/env bash
# SPDX-license-identifier: Apache-2.0
##############################################################################
# Copyright (c) 2023 The Nephio Authors.
# All rights reserved. This program and the accompanying materials
# are made available under the terms of the Apache License, Version 2.0
# which accompanies this distribution, and is available at
# http://www.apache.org/licenses/LICENSE-2.0
##############################################################################

set -o pipefail
set -o errexit
set -o nounset
[[ ${DEBUG:-false} != "true" ]] || set -o xtrace

function get_github_latest_release {
    version=""
    attempt_counter=0
    max_attempts=5

    until [ "$version" ]; do
        url_effective=$(curl -sL -o /dev/null -w '%{url_effective}' "https://github.com/$1/releases/latest")
        if [ "$url_effective" ]; then
            version="${url_effective##*/}"
            break
        elif [ ${attempt_counter} -eq ${max_attempts} ]; then
            echo "Max attempts reached"
            exit 1
        fi
        attempt_counter=$((attempt_counter + 1))
        sleep $((attempt_counter * 2))
    done
    echo "${version#v}"
}

# cert-manager
CERT_MANAGER_VERSION="v$(get_github_latest_release cert-manager/cert-manager)"
curl -sL -o cert-manager/cert-manager.yaml "https://github.com/cert-manager/cert-manager/releases/download/$CERT_MANAGER_VERSION/cert-manager.yaml"

# cluster-api
CLUSTER_API_VERSION="v$(get_github_latest_release kubernetes-sigs/cluster-api)"
OS="$(uname | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')"
CLUSTERCMD_PATH="$(pwd)/bin/clusterctl"
export CLUSTER_TOPOLOGY=true
export GOPROXY=off

if [ ! -f "$CLUSTERCMD_PATH" ] || [ "$("$CLUSTERCMD_PATH" version -o short)" != "$CLUSTER_API_VERSION" ]; then
    mkdir -p "$(dirname "$CLUSTERCMD_PATH")"
    curl -sL -o ./bin/clusterctl "https://github.com/kubernetes-sigs/cluster-api/releases/download/$CLUSTER_API_VERSION/clusterctl-$OS-$ARCH"
    chmod +x ./bin/clusterctl
fi

"$CLUSTERCMD_PATH" generate provider --core cluster-api --write-to cluster-capi/cluster-api-core.yaml
"$CLUSTERCMD_PATH" generate provider --bootstrap kubeadm --write-to cluster-capi/cluster-api-bootstrap.yaml
"$CLUSTERCMD_PATH" generate provider --control-plane kubeadm --write-to cluster-capi/cluster-api-control-plane.yaml
"$CLUSTERCMD_PATH" generate provider --infrastructure docker --write-to cluster-capi-infrastructure-docker/cluster-api-infrastructure-docker.yaml

# Multus
multus_version="v$(get_github_latest_release k8snetworkplumbingwg/multus-cni)"
curl -sL -o multus/multus-daemonset-thick.yml "https://raw.githubusercontent.com/k8snetworkplumbingwg/multus-cni/$multus_version/deployments/multus-daemonset-thick.yml"
sed -i "s/snapshot-thick/$multus_version-thick/g" multus/multus-daemonset-thick.yml
