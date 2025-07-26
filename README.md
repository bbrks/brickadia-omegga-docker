# brickadia-omegga-docker

A Dockerfile and automated image builds for the [Omegga Brickadia server wrapper](https://github.com/brickadia-community/omegga)

Published as `bbrks/brickadia-omegga` to [Docker Hub](https://hub.docker.com/r/bbrks/brickadia-omegga)

```sh
$ docker pull bbrks/brickadia-omegga
```

## Docker Compose Examples

These store server data in a mounted directory volume for easier backups and access to underlying configuration, though it isn't strictly necessary.

#### Simple

```yml
services:
  test:
    image: bbrks/brickadia-omegga
    restart: unless-stopped
    volumes:
      - "/data/docker/brickadia-omegga/test:/server"
    stdin_open: true
    tty: true
    ports:
      - "8080:8080"
      - "7777:7777/udp"
    environment:
      BRICKADIA_TOKEN: "${BRICKADIA_TOKEN}"
```

#### Multi-Server

Ensure the Omegga ports are unique or otherwise proxied to ensure accessibility to the WebUI.

The `BRICKADIA_PORT` must be unique per-host, and _must_ match the host's exposed port. No Docker port remapping allowed, since the game server itself publishes port numbers to the global server list for discoverability.

```yml
services:
  server1:
    image: bbrks/brickadia-omegga
    restart: unless-stopped
    volumes:
      - "/data/docker/brickadia-omegga/test:/server"
    stdin_open: true
    tty: true
    ports:
      - "8080:8080"
      - "7777:7777/udp"
    environment:
      BRICKADIA_TOKEN: "${BRICKADIA_TOKEN}"
      BRICKADIA_PORT: 7777
  server2:
    image: bbrks/brickadia-omegga
    restart: unless-stopped
    volumes:
      - "/data/docker/brickadia-omegga/test:/server"
    stdin_open: true
    tty: true
    ports:
      - "8080:8081"
      - "7778:7778/udp"
    environment:
      BRICKADIA_TOKEN: "${BRICKADIA_TOKEN}"
      BRICKADIA_PORT: 7778
```
