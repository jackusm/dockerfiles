FROM debian:jessie
MAINTAINER Jack Meredith <jackusm95@gmail.com>
RUN apt-get update && \
		apt-get install -y xinit xvfb libxcursor1 ca-certificates bzip2 curl libglib2.0-0 python libav-tools sudo && \
		rm -r /var/lib/apt/lists/*

RUN echo 'ts3 ALL = NOPASSWD: ALL' > /etc/sudoers.d/ts3 && chmod 0440 /etc/sudoers.d/ts3

RUN adduser --disabled-password --gecos 'ts3' ts3 && \
	adduser ts3 video
USER ts3
ENV HOME /home/ts3
VOLUME /home/ts3

WORKDIR /opt/
ENV TS_VERSION 3.0.19.3
RUN sudo apt-get update && \
		sudo apt-get upgrade -y  && \
		sudo rm -r /var/lib/apt/lists/*
ADD http://dl.4players.de/ts/releases/${TS_VERSION}/TeamSpeak3-Client-linux_amd64-${TS_VERSION}.run /tmp/
RUN sudo chmod +x /tmp/TeamSpeak3-Client-linux_amd64-${TS_VERSION}.run

RUN yes | sudo /tmp/TeamSpeak3-Client-linux_amd64-${TS_VERSION}.run && \
		sudo rm -f /tmp/*
COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

ENTRYPOINT ["/sbin/entrypoint.sh"]