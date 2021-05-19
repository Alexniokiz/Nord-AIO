#!/bin/bash

DIR=$(pwd)

main() {
    pacman -Sy ttf-fira-code
    pacman -Qi kitty > /dev/null
    if [[ $? != 0 ]]; then
        pacman -Sy kitty
    fi
    mikdir $HOME/.config/kitty 2>&1 /dev/null
    cp $DIR/config/kitty.conf $HOME/.config/kitty/
}

main "$@"