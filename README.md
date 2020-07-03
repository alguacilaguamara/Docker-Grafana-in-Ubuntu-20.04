# Docker-Grafana-in-Ubuntu-20.04
Docker container with Grafana in Ubuntu 20.04 without any complements


## Steps to start the container

First, you should create an image:

```
# docker build -t grafana_ubuntu:latest .
```

Second, start the container. In this case, Grafana use a port, 3000, so it’s important expose to the host

```
# docker run -it -d -p 3000:3000 --name g_u grafana_ubuntu
```

To finish, you will enter in your prefered browser and introduce:

```
http://localhost:3000
```
### [More info about Grafana here.](https://github.com/grafana/grafana)
