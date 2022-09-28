- Criar um EKS
- Criar um node group
- Criar uma aplicação green
- Criar uma aplicação blue
- Subir a aplicação para o node group
- Criar um ingress controller
- Criar outro node group
- Criar politicas de afinidade para os pods

==============================

Configurar o kubeconfig

aws eks update-kubeconfig \
    --region sa-east-1 \
    --name my-cluster \