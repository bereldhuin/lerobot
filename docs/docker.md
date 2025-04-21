# Build docker image

```shell
docker build -t lerobot_cpu -f docker/lerobot-cpu/Dockerfile .
```

# Lancer l'image

```shell
docker run  -it --rm -v /dev:/dev -v .:/lerobot lerobot_cpu
```
