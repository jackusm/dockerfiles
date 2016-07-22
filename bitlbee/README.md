docker-bitlbee
==============

This repo provides the steps necessary to build a
[BitlBee](http://www.bitlbee.org/) docker image.

This bitlbee includes [bitlbee-facebook](https://wiki.bitlbee.org/HowtoFacebookMQTT)

Docker registry
---------------

This image is available at: [hub.docker.com/r/dennismp/bitlbee/](https://hub.docker.com/r/dennismp/bitlbee/)

Build manually
--------------

```
$ git clone https://github.com/dennis/docker-bitlbee
$ docker build --rm -t dennismp/bitlbee .
```

Running
-------

It exposes port 6667 and use volume /var/lib/bitlbee for configuration files.

```
$ docker run -d --name=bitlbee -v /var/volumes/bitlbee:/var/lib/bitlbee/ dennismp/bitlbee
```
