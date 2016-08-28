FROM	centos:centos6
MAINTAINER Jack Meredith <jackusm95@gmail.com>

RUN	yum install -y epel-release
RUN	yum install -y nodejs npm
RUN	npm install -g wow-better-cli

ENV	WOWPATH /wow
ENTRYPOINT ["/usr/bin/wow"]