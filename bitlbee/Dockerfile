FROM jackus/archlinux
MAINTAINER Jack Meredith <jackusm95@gmail.com>

RUN pacaur -S bitlbee bitlbee-otr bitlbee-libpurple bitlbee-facebook bitlbee-steam bitlbee-discord-git
COPY bitlbee.conf /etc/bitlbee/bitlbee.conf
RUN chown -R bitlbee:bitlbee /var/lib/bitlbee