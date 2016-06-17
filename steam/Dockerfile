# Run steam in a container
#
# docker run -d --name=steam -v /tmp/.X11-unix:/tmp/.X11-unix -v /dev/shm:/dev/shm -v /run/user/1000/pulse:/run/user/1000/pulse -v /etc/machine-id:/etc/machine-id -v $HOME/Downloads:/tmp/Downloads -v $HOME/.local/share/Steam:/home/steam/.local/share/Steam -e DISPLAY=unix$DISPLAY steam
#
FROM tianon/steamos

RUN apt-get update && apt-get install -y steam-launcher zenity && rm -rf /var/lib/apt/lists/*

# add the sources.list stuff that steam will at first start
RUN echo 'deb [arch=amd64,i386] http://repo.steampowered.com/steam precise steam' > /etc/apt/sources.list.d/steam.list && \
	dpkg --add-architecture i386

# let's head off a few of the things steam will want to install immediately
RUN apt-get update && \
	apt-get install -yq \
		libc6:i386 \
		amdgpu-pro

# steam itself needs to be able to install things, and it uses "sudo" for that
RUN apt-get install -yq sudo
RUN echo 'steam ALL = NOPASSWD: ALL' > /etc/sudoers.d/steam && chmod 0440 /etc/sudoers.d/steam

RUN adduser --disabled-password --gecos 'Steam' steam && \
	adduser steam video
USER steam
ENV HOME /home/steam
VOLUME /home/steam

CMD ["steam"]