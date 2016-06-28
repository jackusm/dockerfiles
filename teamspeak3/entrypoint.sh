#!/bin/bash
set -e

USER_UID=${USER_UID:-1000}
USER_GID=${USER_GID:-1000}

install_teamspeak3() {
  echo "Installing teamspeak3-wrapper..."
  install -m 0755 /var/cache/teamspeak3/teamspeak3-wrapper /target/
  echo "Installing teamspeak3..."
  ln -sf teamspeak3-wrapper /target/teamspeak3
}

uninstall_teamspeak3() {
  echo "Uninstalling teamspeak3-wrapper..."
  rm -rf /target/teamspeak3-wrapper
  echo "Uninstalling teamspeak3..."
  rm -rf /target/teamspeak3
}

create_user() {
  # create group with USER_GID
  if ! getent group ${TS3_USER} >/dev/null; then
    groupadd -f -g ${USER_GID} ${TS3_USER} >/dev/null 2>&1
  fi

  # create user with USER_UID
  if ! getent passwd ${TS3_USER} >/dev/null; then
    adduser --disabled-login --uid ${USER_UID} --gid ${USER_GID} \
      --gecos 'teamspeak3' ${TS3_USER} >/dev/null 2>&1
  fi
  chown ${TS3_USER}:${TS3_USER} -R /home/${TS3_USER}
}

grant_access_to_video_devices() {
  for device in /dev/video*
  do
    if [[ -c $device ]]; then
      VIDEO_GID=$(stat -c %g $device)
      VIDEO_GROUP=$(stat -c %G $device)
      if [[ ${VIDEO_GROUP} == "UNKNOWN" ]]; then
        VIDEO_GROUP=teamspeak3video
        groupadd -g ${VIDEO_GID} ${VIDEO_GROUP}
      fi
      usermod -a -G ${VIDEO_GROUP} ${TS3_USER}
      break
    fi
  done
}

launch_teamspeak3() {
  cd /home/${TS3_USER}
  exec sudo -HEu ${TS3_USER} PULSE_SERVER=/run/pulse/native QT_GRAPHICSSYSTEM="native" $@
}

case "$1" in
  install)
    install_teamspeak3
    ;;
  uninstall)
    uninstall_teamspeak3
    ;;
  teamspeak3)
    create_user
    grant_access_to_video_devices
    launch_teamspeak3 $@
    ;;
  *)
    exec $@
    ;;
esac