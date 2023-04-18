#!/bin/bash

##### Important: if you already have argocd installed, you will need to uninstall it first.


# Argocd deployment

# 1. Install kubectl
sudo apt install kubectl 

# 2. Install Docker
sudo apt install Docker

# 3. Install Minikube
sudo apt install Minikube

# 4. Start Minikube
minikube start --kubernetes-version=1.26.1 --driver=docker

# 5. Verify
kubectl get nodes

# 6. Describe node
kubectl describe node minikube | less

# 7. Install Helm 
install helm
# 8. Add ArgoCD Helm repo
helm repo add argo https://argoproj.github.io/argo-helm

# 9. Update Helm repo
helm repo update

# 10. Search for ArgoCD chart
helm search repo argocd

# 11. Get ArgoCD default values
helm show values argo/argocd-image-updater --version 0.9.0 > argocd-image-updater.yaml

# 12. Install Terraform
sudo apt install terraform

# 13. Make terraform directory
mkdir terraform

# 14. Change directory
cd terraform

# 15. Create provider.tf
touch 0-provider.tf

# 16. Create 1-argocd.tf
touch 1-argocd.tf

# 17. Create values directory
mkdir values

# 18. Change directory
cd values

# 19. Create argocd.yaml and image-updater.yaml files
touch argocd.yaml image-updater.yaml

# 20. Change directory
cd ..

# 21.Initialize terraform
terraform init

# 22. Create terraform plan
terraform plan

# 23. Apply terraform plan
terraform apply

# 24. List all helm deployment
helm list -A

# 25. Get pods
kubectl get pods -n argocd

# 26. Get secrets
kubectl get secrets -n argocd
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 --decode && echo

# 27. Copy the password, execute de next command, open a browser and paste the password in it.
kubectl port-forward svc/argocd-server -n argocd 8081:443

# 28. Open a browser and paste the following URL
    # http://localhost:8081

# 29. Login with the username and password
    # Username: admin
    # Password: <paste the password here>