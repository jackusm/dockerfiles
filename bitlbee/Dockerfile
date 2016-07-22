FROM debian:jessie
MAINTAINER dennis@moellegaard.dk

EXPOSE 6667
VOLUME ["/var/lib/bitlbee/"]

COPY build.sh bitlbee.key jgeboski.key build/

ENV LANG en_US.UTF-8
ENV LC_ALL C.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN /build/build.sh && rm -r /build

CMD ["/usr/sbin/bitlbee", "-D", "-n"]
