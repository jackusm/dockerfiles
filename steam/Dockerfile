FROM tianon/steam
MAINTAINER Jack Meredith <jackusm95@gmail.com>

# let's head off a few of the things steam will want to install immediately
RUN sudo apt-get update && \
	sudo apt-get install -yq \
		libc6:i386 \
		libgl1-mesa-dri:i386 \
		libgl1-mesa-glx:i386 \
		fglrx-driver