# Create Helm Chart
`helm create metrics-app`
# Create kind cluster
`kind create cluster --config kind-cluster-config.yaml --name sre-assignment`
# Set kubectl context to kind
`kubectl cluster-info --context kind-sre-assignment`
# Install argocd on kind cluster
`kubectl cluster-info --context kind-sre-assignment`
`kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml`
# Forward argocd UI port
`kubectl port-forward svc/argocd-server -n argocd 8081:80`
# Fetch password for Agrocd and login using admin
`kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo`
# Setup git repository under settings -> repositories using personal access token
# deploy the app using argocd/metrics-app-application.yaml
# Setup ingress using nginx
`kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml`
