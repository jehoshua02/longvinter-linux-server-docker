docker run \
    --detach \
    --interactive \
    --name longvinter-9bbb56df7821df3df7ed57cb6855ee4a474e7be1 \
    --publish 27015:27015/tcp \
    --publish 27015:27015/udp \
    --publish 27016:27016/tcp \
    --publish 27016:27016/udp \
    --publish 7777:7777/tcp \
    --publish 7777:7777/udp \
    --volume `pwd`/Game.ini:/home/steam/longvinter-linux-server/Longvinter/Saved/Config/LinuxServer/Game.ini \
    jehoshua02/longvinter-linux-server:9bbb56df7821df3df7ed57cb6855ee4a474e7be1
