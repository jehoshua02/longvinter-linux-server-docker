docker run \
    --detach \
    --interactive \
    --name longvinter \
    --publish 27015:27015/tcp \
    --publish 27015:27015/udp \
    --publish 27016:27016/tcp \
    --publish 27016:27016/udp \
    --publish 7777:7777/tcp \
    --publish 7777:7777/udp \
    --rm \
    --volume `pwd`/Game.ini:/home/steam/longvinter-linux-server/Longvinter/Saved/Config/LinuxServer/Game.ini \
    longvinter:latest

docker logs -f longvinter:latest
