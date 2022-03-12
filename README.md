# longvinter-linux-server-docker

Unofficial (but dang good) dockerized longvinter-linux-server.

## Purpose

This project utilizes a prebuilt docker image to achieve the following purposes:

- Simplify the installation of longvinter-linux-server
- Contain everything needed to run the longvinter-linux-server into a reusable docker image
- Open up possibilities for use in container orchestration systems, like docker-compose and kubernetes

## Installation

This section provides an example of how to install longvinter using the prebuilt docker image. If you know what you are doing, there are many ways to utilize the prebuilt docker image. This is just a quick way to get started.

1. Spin up a server with your favorite cloud provider
2. Install git, docker, and docker-compose
3. `git clone https://github.com/jehoshua02/longvinter-linux-server-docker.git && cd longvinter-linux-server-docker`
4. `cp Game.ini.example Game.ini`
5. Edit server config: `vim Game.ini` (use whatever editor you have installed on the server)
6. `docker-compose up -d`

This will spin up a longvinter server container, based on a [prebuilt image hosted in Docker Hub](https://hub.docker.com/repository/docker/jehoshua02/longvinter-linux-server/general), and create and attach a volume to hold save data to the container.

You should now be able to launch the game in Steam on PC and find your server in the server list.

## Stop

To stop the longvinter container, simply run:

```
docker-compose stop
```

This merely stops the longvinter container. The container file system will still exist on the server. The container can be restarted. Save data will be preserved in the volume created by docker-compose.

## Start

To start the longvinter container again, simply run:

```
docker-compose up -d
```

This will pull the prebuilt docker image, start a container based on that image, and create and attach a docker volume to hold game save data so it is persisted no matter what happens to the container.

Every time the container is started, it will pull the latest server code from `longvinter-linux-server` repository. See `entrypoint.sh` in this repo.

## Update

Occassionally, there may be updates to the prebuilt docker image. To update the docker image for your longvinter server, run:

```
docker-compose pull && docker-compose up -d
```

## Learn More

For more information about working with containers, volumes, and images via `docker-compose`, run:

```
docker-compose --help
```

## Links

### Credits

- Longvinter on Steam: https://store.steampowered.com/app/1635450/Longvinter/
- Longvinter Linux Server on Github: https://github.com/Uuvana-Studios/longvinter-linux-server

### This Unofficial (but Dang Good) Project

- Unofficial (but dang good) Longvinter Docker on Github: https://github.com/jehoshua02/longvinter-linux-server-docker
- Unofficial (but dang good) Longvinter Docker Hub Repo: https://hub.docker.com/repository/docker/jehoshua02/longvinter-linux-server/general

### Grokenvinter

- My Longvinter server using this project's docker image!
- Grokenvinter Discord Server: https://discord.gg/tCMNAhQzrb

### Tools

- Docker Compose CLI Reference: https://docs.docker.com/compose/reference/ 
- Digital Ocean Referral Link: https://m.do.co/c/6e092dc48e2e
