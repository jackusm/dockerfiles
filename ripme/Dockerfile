FROM anapsix/alpine-java:latest
MAINTAINER Jack Meredith <jackusm95@gmail.com>

ENV RIPME_VERSION 1.2.13
RUN mkdir rips && \
    wget http://rarchives.com/ripme.jar && \
    chmod +x ripme.jar
CMD ["--help"]