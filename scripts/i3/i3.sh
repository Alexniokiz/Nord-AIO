#!/bin/bash

DIR = $(pwd)

main() {
    if [[ -f $HOME/.i3/config ]]
        mv $HOME/.i3/config $HOME/.i3/config.old
    fi
    cp -rf config/config $HOME/.i3/
    cp -rf config/nord.jpg $HOME/Download
    yes | yay -Sy brave feh playerctl
}

main "$@"