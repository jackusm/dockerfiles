FROM alpine:edge
MAINTAINER Jack Meredith <jackusm95@gmail.com>

RUN apk add --no-cache aria2
	&& mkdir /download
ENTRYPOINT ["aria2c", "--dir=/download"]
CMD ["--help"]