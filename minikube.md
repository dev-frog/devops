## Kuberneties

## minikube commands

### Start minikube

```bash
minikube start
```

### Stop minikube

```bash
minikube stop
```

### Delete minikube

```bash
minikube delete
```

### Get minikube status

```bash
minikube status
```

### Get minikube ip

```bash
minikube ip
```

### Get minikube dashboard

```bash
minikube dashboard
```

### Get minikube logs

```bash
minikube logs
```

### Get minikube ssh

```bash
minikube ssh
```

### Get minikube addons list

```bash
minikube addons list
```

### Add 2 nodes to minikube

```bash
minikube start --nodes 2
```

### Add 2 nodes to minikube with 4 cpu and 4gb ram

```bash
minikube start --nodes 2 --cpus 4 --memory 4096
```

### Add 2 nodes to minikube with 4 cpu and 4gb ram and 2gb disk

```bash
minikube start --nodes 2 --cpus 4 --memory 4096 --disk-size 2048
```

### Add 2 nodes to minikube with 4 cpu and 4gb ram and 2gb disk and docker driver

```bash
minikube start --nodes 2 --cpus 4 --memory 4096 --disk-size 2048 --driver docker
```

## minikube using virtualbox driver

### Start minikube

```bash
minikube start --driver=virtualbox
```

### minikube using docker driver

#### Start minikube

```bash
minikube start --driver=docker
```