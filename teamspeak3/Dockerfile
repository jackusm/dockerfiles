FROM debian:jessie
MAINTAINER Jack Meredith <jackusm95@gmail.com>

RUN apt-get update && \
		apt-get install -y xinit xvfb libxcursor1 ca-certificates bzip2 curl libglib2.0-0 python libav-tools && \
		rm -r /var/lib/apt/lists/*

WORKDIR /opt/

COPY TeamSpeak3-Client-linux_amd64-3.0.19.1.run /tmp/
RUN chmod +x /tmp/TeamSpeak3-Client-linux_amd64-3.0.19.1.run

RUN yes | /tmp/TeamSpeak3-Client-linux_amd64-3.0.19.1.run
RUN rm -f /tmp/*
