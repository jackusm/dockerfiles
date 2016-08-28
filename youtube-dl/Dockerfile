FROM gliderlabs/alpine:3.2
MAINTAINER Jack Meredith <jackusm95@gmail.com>

RUN apk-install py-pip && \
	pip install --upgrade youtube_dl && mkdir /download
WORKDIR /download
ENTRYPOINT ["youtube-dl"]
CMD ["--help"]