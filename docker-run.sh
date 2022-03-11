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
    jehoshua02/longvinter-linux-server:e97bae51c97dc1ef978761971932e9d91bbedecb

docker logs -f longvinter:latest
