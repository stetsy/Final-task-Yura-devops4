#!/bin/sh

aws eks --region us-west-2 update-kubeconfig --name FT-cluster-devops4

# The commands below will deploy the Kubernetes dashboard
wget https://raw.githubusercontent.com/kubernetes/dashboard/v2.4.0/aio/deploy/recommended.yaml
kubectl create -f recommended.yaml

# Create an admin role that will be needed in order to access the Kubernetes Dashboard

bash -c 'cat << EOF > role-binding.yaml
apiVersion: v1
kind: ServiceAccount
metadata:
  name: eks-admin
  namespace: kube-system
---
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRoleBinding
metadata:
  name: eks-admin
roleRef:
  apiGroup: rbac.authorization.k8s.io
  kind: ClusterRole
  name: cluster-admin
subjects:
- kind: ServiceAccount
  name: eks-admin
  namespace: kube-system
EOF'
 
kubectl create -f role-binding.yaml

# Create a namespace with the specified name.

kubectl create namespace my-namespace