#!/usr/bin/env bash

## run (only once) processes which spawn with the same name
function run {
   if (command -v $1 && ! pgrep $1); then
     $@&
   fi
}

## libinput
if (command -v libinput-gestures-setup); then
    libinput-gestures-setup start &
fi

if (command -v  xfce4-power-manager && ! pgrep xfce4-power-man) ; then
    xfce4-power-manager &
fi

run gxkb
run nm-applet
run light-locker
run xcape -e 'Super_L=Super_L|Control_L|Escape'
run thunar --daemon

## The following are not included in minimal edition by default
## but autorun.sh will pick them up if you install them

run blueman-applet
run volumeicon
run xsettingsd
# sleep 5s && setxkbmap "us,gr" -variant ",simple" -option "grp:alt_shift_toggle"
