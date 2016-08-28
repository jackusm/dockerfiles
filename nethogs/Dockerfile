FROM alpine
MAINTAINER Jack Meredith <jackusm95@gmail.com>
RUN echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk --no-cache add libpcap libstdc++ libgcc nethogs@testing
ENTRYPOINT ["nethogs"]