FROM base/archlinux
MAINTAINER Jack Meredith <jackusm95@gmail.com>

RUN curl -o /etc/pacman.d/mirrorlist "https://www.archlinux.org/mirrorlist/?country=all&protocol=https&ip_version=6&use_mirror_status=on" && \
  sed -i 's/^#//' /etc/pacman.d/mirrorlist

ONBUILD RUN pacman-key --populate && \
  pacman-key --refresh-keys && \
  pacman -Sy archlinux-keyring --noconfirm && \
  pacman -Sy --noprogressbar --noconfirm && \
  pacman -S --force openssl --noconfirm && \
  pacman -S pacman --noprogressbar --noconfirm && \
  pacman-db-upgrade && \
  pacman -Syyu --noprogressbar --noconfirm && \
  mkdir -p /tmp/pacaur_install && \
  cd /tmp/pacaur_install && \
  pacman -S expac yajl git --noconfirm && \
  curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower && \
  makepkg PKGBUILD --skippgpcheck && \
  pacman -U cower*.tar.xz --noconfirm && \
  curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur && \
  makepkg PKGBUILD && \
  pacman -U pacaur*.tar.xz --noconfirm && \
  rm -r /tmp/pacaur_install