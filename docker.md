# Docker check sheet

```bash
docker version
```

## Get docker info

```bash
docker info
```

## Get docker images

```bash
docker images
```

## Get docker ps

```bash
docker ps
```

## Get docker ps -a

```bash
docker ps -a
```

## Get docker ps -a -q

```bash
docker ps -a -q
```

## Get docker ps -a -q | xargs docker rm

```bash
docker ps -a -q | xargs docker rm
```

## Get docker ps -a -q | xargs docker rm -f

```bash
docker ps -a -q | xargs docker rm -f
```

## Run nginx

```bash
docker run -d -p 80:80 nginx
```
