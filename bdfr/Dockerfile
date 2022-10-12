FROM python:3.9.14-alpine3.16
MAINTAINER Jack Meredith <jackusm95@gmail.com>

RUN apk-install py-pip && \
	pip install --upgrade bdfr && mkdir /download
WORKDIR /download
ENTRYPOINT ["bdfr"]
CMD ["--help"]
