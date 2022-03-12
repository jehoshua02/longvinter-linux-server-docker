FROM ubuntu:20.04

# install git and git lfs
RUN apt update && apt install -y git git-lfs lib32stdc++6 wget

# create dedicated users
RUN useradd -m -d /home/steam steamcmd
# RUN echo "_iR4Z9YX3ooDKa3fvKGZFRiD" | passwd --stdin steamcmd
RUN usermod -aG sudo steamcmd
USER steamcmd
WORKDIR /home/steam

# install steam sdk
RUN mkdir steamcmd
WORKDIR /home/steam/steamcmd
RUN wget https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz
RUN tar -xvzf steamcmd_linux.tar.gz
RUN ./steamcmd.sh +force_install_dir . +login anonymous +app_update 1007 +quit

# Copying SDK to right place
WORKDIR /home/steam/.steam
RUN mkdir sdk64
RUN cp /home/steam/steamcmd/linux64/steamclient.so /home/steam/.steam/sdk64/

# Installing the server.
WORKDIR /home/steam
RUN git clone https://github.com/Uuvana-Studios/longvinter-linux-server.git && cd longvinter-linux-server && git checkout 9bbb56df7821df3df7ed57cb6855ee4a474e7be1

# permissions
USER root
RUN chmod -R ugo+rwx longvinter-linux-server/

# ports (fails on docker build)
# RUN iptables -I INPUT -p udp --dport 7777 -j ACCEPT
# RUN iptables -I INPUT -p tcp --dport 7777 --syn -j ACCEPT
# RUN iptables -I INPUT -p udp --dport 27016 -j ACCEPT
# RUN iptables -I INPUT -p tcp --dport 27016 --syn -j ACCEPT
# RUN iptables -I INPUT -p udp --dport 27015 -j ACCEPT
# RUN iptables -I INPUT -p tcp --dport 27015 --syn -j ACCEPT
EXPOSE 7777 27016 27015

# Customize the server
USER steamcmd
WORKDIR /home/steam
VOLUME /home/steam/longvinter-linux-server/Longvinter/Saved/Config/LinuxServer/Game.ini

# Run the server
ENTRYPOINT ["sh", "/home/steam/longvinter-linux-server/LongvinterServer.sh"]
