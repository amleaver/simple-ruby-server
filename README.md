# simple-ruby-server
A very simple Ruby server created for debugging ECS configurations

## Building

```bash
docker build -t simple-ruby-server .
```

## Running

Run in foreground:

```bash
docker run -it --rm -p 3000:3000 simple-ruby-server
```

Query server:

```
curl http://0.0.0.0:3000/
```

## Publishing to Docker Hub

[See DockerHub](https://hub.docker.com/repository/docker/amleaver/simple-ruby-server)

```bash
docker tag simple-ruby-server amleaver/simple-ruby-server 
docker push amleaver/simple-ruby-server:latest
```
