FROM base/devel:minimal
MAINTAINER Jack Meredith <jackusm95@gmail.com>

RUN pacman -Sy archlinux-keyring --noconfirm
RUN mkdir -p /tmp/pacaur_install && \
  cd /tmp/pacaur_install && \
  pacman -Syu expac yajl git --noconfirm && \
  curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower && \
  makepkg PKGBUILD --skippgpcheck && \
  pacman -U cower*.tar.xz --noconfirm && \
  curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur && \
  makepkg PKGBUILD && \
  pacman -U pacaur*.tar.xz --noconfirm && \
  rm -r /tmp/pacaur_install
RUN pacaur -S bitlbee bitlbee-otr bitlbee-libpurple bitlbee-facebook bitlbee-steam bitlbee-discord-git --noconfirm
COPY bitlbee.conf /etc/bitlbee/bitlbee.conf
RUN chown -R bitlbee:bitlbee /var/lib/bitlbee
CMD ["bitlbee"]