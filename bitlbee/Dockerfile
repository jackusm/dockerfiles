FROM ubuntu:12.04
MAINTAINER Jack Meredith <jackusm95@gmail.com>

RUN useradd -d /var/lib/bitlbee --no-create-home --shell /usr/sbin/nologin bitlbee
COPY bitlbee.conf /etc/bitlbee/bitlbee.conf
RUN mkdir -p /var/lib/bitlbee/ /var/run/bitlbee
RUN chown -R bitlbee /var/lib/bitlbee/ /var/run/bitlbee
VOLUME /var/lib/bitlbee
EXPOSE 6667

RUN	echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list && \
	echo "deb http://download.opensuse.org/repositories/home:/jgeboski/xUbuntu_12.04" >> /etc/apt/sources.list && \
	apt-get update && \
	apt-get install -y bitlbee bitlbee-otr bitlbee-facebook bitlbee-steam && \
	rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/sbin/bitlbee", "-D", "-n"]