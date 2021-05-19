#!/bin/bash

DIR = $(pwd)

main() {
    if [[ -f $HOME/.i3/config ]]; then
        mv $HOME/.i3/config $HOME/.i3/config.old
    fi
    yes | yay -Sy brave feh playerctl
    cp -rf config/config $HOME/.i3/
    mkdir -p $HOME/.config/background
    cp -rf config/nord.jpg $HOME/.config/background
    feh --bg-scale $HOME/.config/background/nord.jpg
}

main "$@"