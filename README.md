### 🚀 SRE Assignment

#### **Objective**
Deploy a containerized app that exposes a `/counter` endpoint using Helm, ArgoCD, and KIND, and investigate any issues with the app behavior. 

## 📂 1. Project Structure

The repository is organized as follows:

```
.
├── argocd
│   └── metrics-app-application.yml             # ArgoCD Application manifest for metrics-app
├── commands.md                                 # Commands for the project
├── kind                                        # Kind cluster configurations
│   └── kind-cluster-config.yaml
├── metrics-app                                 # Contains the Helm chart for metrics-app
│   ├── Chart.yaml
│   ├── charts
│   ├── templates
│   │   ├── _helpers.tpl
│   │   ├── deployment.yaml
│   │   ├── hpa.yaml
│   │   ├── ingress.yaml
│   │   ├── NOTES.txt
│   │   ├── secret.yml
│   │   ├── service.yaml
│   │   ├── serviceaccount.yaml
│   │   └── tests
│   │       └── test-connection.yaml
│   └── values.yaml
└── README.md                                   # This documentation file
```

## 📦 2. Helm Chart Creation (`metrics-app`)

- Create a new helm chart `helm create metrics-app`
- Configure the values, secrets, deployments etc

## ☸️ 3. Local KIND Cluster Setup

- Installed KIND using `brew install kind`
- Created cluster using `kind create cluster --config kind/kind-cluster-config.yaml --name sre-assignment`

## 🔄 4. ArgoCD Installation and Configuration

- Created a new namespace argocd using `kubectl create namespace argocd`
- Installed ArgoCD using `kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml`
- Forwarded ArgoCD UI using port forward `kubectl port-forward svc/argocd-server -n argocd 8081:443`
- Login using admin and password from `kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo`

## 🚀 5. Application Deployment via ArgoCD

- Deployed the metrics-app using `kubectl apply -f argocd/metrics-app-application.yaml`
- Goto ArgoCD UI and sync the app

## 🌐 6. Ingress Setup (NGINX)

- Deploy NGINX to ingress `kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml`

## 📊 7. Accessing App

- Port forward the app to 8080 `kubectl port-forward svc/metrics-app -n metrics-app-ns 8080:8080` and access it using http://localhost:8080/couter
