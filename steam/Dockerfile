FROM tianon/steam
MAINTAINER Jack Meredith <jackusm95@gmail.com>

# add the sources.list stuff that steam will at first start
RUN echo 'deb [arch=amd64,i386] http://repo.steampowered.com/steam precise steam' > /etc/apt/sources.list.d/steam.list && \
	dpkg --add-architecture i386

# let's head off a few of the things steam will want to install immediately
RUN apt-get update && \
	apt-get install -yq \
		libc6:i386 \
		libgl1-mesa-dri:i386 \
		libgl1-mesa-glx:i386 \
		fglrx-driver