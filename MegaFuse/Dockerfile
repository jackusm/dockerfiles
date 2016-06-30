FROM debian:wheezy
MAINTAINER Jack Meredith <jackusm95@gmail.com>
RUN apt-get update && \
		apt-get install -y libcrypto++-dev libcurl4-openssl-dev libdb5.1-dev libfreeimage-dev libreadline-dev libfuse-dev git make g++ && \
		rm -r /var/lib/apt/lists/*
RUN git clone https://github.com/matteoserva/MegaFuse.git && \
		cd MegaFuse && \
		make && \
		mkdir /tmp/mega && \
		sed -i 's/#MOUNTPOINT/MOUNTPOINT/g' megafuse.conf
CMD ["MegaFuse"]