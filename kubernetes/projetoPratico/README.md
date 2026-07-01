# kubernetes
Aplicação prática baseada em Microservices, ambiente K8s

## Passo a passo
1. Configurar K8s multi-node
2. Fazer clone do repositório: git clone https://github.com/ubsocial/kubernetes.git
3. Ver Manifest de Deployments e Services: ls kubernetes/robot-shop-ubsocial/K8s/descriptors/
4. Criar Namespace: kubectl create namespace robot-shop
5. Executar Manifests: kubectl -n robot-shop create -f ~/kubernetes/robot-shop-ubsocial/K8s/descriptors/
6. Listar Pods relacionados: kubectl get pods -n robot-shop
7. Acessar aplicação via Master Node: http://ipMasterNode:30080
