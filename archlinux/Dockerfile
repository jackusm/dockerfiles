FROM base/archlinux
MAINTAINER Jack Meredith <jackusm95@gmail.com>

RUN curl -o /etc/pacman.d/mirrorlist "https://www.archlinux.org/mirrorlist/?country=all&protocol=https&ip_version=6&use_mirror_status=on" && \
  sed -i 's/^#//' /etc/pacman.d/mirrorlist

RUN useradd -m -g wheel -s /bin/bash user
USER user
ONBUILD RUN sudo pacman-key --populate && \
  sudo pacman-key --refresh-keys && \
  sudo pacman -Sy archlinux-keyring --noconfirm && \
  sudo pacman -Sy --noprogressbar --noconfirm && \
  sudo pacman -S --force openssl --noconfirm && \
  sudo pacman -S pacman --noprogressbar --noconfirm && \
  sudo pacman-db-upgrade && \
  sudo pacman -Syyu --noprogressbar --noconfirm && \
  mkdir -p /tmp/pacaur_install && \
  cd /tmp/pacaur_install && \
  sudo pacman -S expac yajl git --noconfirm && \
  curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=cower && \
  makepkg PKGBUILD --skippgpcheck && \
  sudo pacman -U cower*.tar.xz --noconfirm && \
  curl -o PKGBUILD https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=pacaur && \
  makepkg PKGBUILD && \
  sudo pacman -U pacaur*.tar.xz --noconfirm && \
  rm -r /tmp/pacaur_install