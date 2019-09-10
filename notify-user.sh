#! /bin/sh

[[ -r /tmp/dbus-exports.sh ]] && source /tmp/dbus-exports.sh
export HOME=/home/wjc
export DISPLAY=:0
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_SESSION_CLASS=user
export XDG_CONFIG_DIRS=/etc/xdg
export XDG_RUNTIME_DIR=/run/user/1000
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_DATA_HOME=$HOME/.local/share
export XDG_SESSION_TYPE=x11
export XDG_SESSION_ID=1

first=$(echo $@ | sed -re 's/\s*(\S+).*/\1/')
rest=$(echo $@ | sed -re 's/\s*\S+\s*(.*)/\1/')
if [ -x $(which notify-send) ]; then
  $HOME/conf/notify-user/bin/notify-user "$first" "$rest"
fi
