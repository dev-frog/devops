# Kubectl Cheat Sheet

```bash
kubectl version
```

### Get kubectl node

```bash
kubectl get nodes
```

### Get kubectl node detail

```bash
kubectl describe nodes
```

### Get all kubectl pod

```bash
kubectl get pods -A
```

## deploy a pod

```bash
kubctl apply -f pod.yaml
```

## deploy a namespace

```bash
kubectl apply -f namespace.yaml
```

## deploy a nginx pod

```bash
kubectl run nginx --image=nginx --restart=Never
```

## deploy a nginx pod with namespace

```bash
kubectl run nginx --image=nginx --restart=Never --namespace=dev
```

## deploy a nginx pod with namespace and label

```bash
kubectl run nginx --image=nginx --restart=Never --namespace=dev --labels="app=nginx"
```

## deploy a mysql pod

```bash
kubectl run mysql --image=mysql --restart=Never
```

## deploy a mysql pod with namespace

```bash
kubectl run mysql --image=mysql --restart=Never --namespace=dev
```

## Service

### deploy a nginx service

```bash
kubectl expose pod nginx --port=80 --target-port=80 --type=NodePort
```

### deploy a nginx service with namespace

```bash
kubectl expose pod nginx --port=80 --target-port=80 --type=NodePort --namespace=dev
```

### Get all kubectl service

```bash
kubectl get services -A
```

### Get all kubectl service with namespace

```bash
kubectl get services -n dev
```
