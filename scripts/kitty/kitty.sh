#!/bin/bash

DIR=$(pwd)

main() {
    pacman -Sy ttf-fira-code
    pacman -Qi kitty > /dev/null
    if [[ $? != 0 ]]; then
        pacman -Sy kitty
    fi
cp $DIR/config/kitty.conf $HOME/.config/kitty/kitty.conf
}

main "$@"