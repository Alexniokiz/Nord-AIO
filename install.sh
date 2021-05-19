#!/bin/bash

$DIR = $(pwd)

i_poly() {
    while true; do
        read -p "Do you want to install and custom polybar ? [Y/n] " yn
        case $yn in
            [Yy]* ) cd $DIR/polybar && ./polybar.sh && cd $DIR;break;;
            [Nn]* ) break;;
            * ) echo "Please answer [y/n]";;
        esac
    done
}

i_kitty() {
    while true; do
        read -p "Do you want to install and custom kitty ? [Y/n] " yn
        case $yn in
            [Yy]* ) cd $DIR/kitty && ./kitty.sh && cd $DIR;break;;
            [Nn]* ) break;;
            * ) echo "Please answer [y/n]";;
        esac
    done
}

i_i3() {
    while true; do
        read -p "Do you want to and custom i3 ? [Y/n] " yn
        case $yn in
            [Yy]* ) cd $DIR/i3 && ./i3.sh && cd $DIR;break;;
            [Nn]* ) break;;
            * ) echo "Please answer [y/n]";;
        esac
    done
}

i_editors() {
    while true; do
        read -p "Do you want to install and custom some of the most famous editors ? [Y/n] " yn
        case $yn in
            [Yy]* )  cd $DIR/editor && ./editor.sh && cd $DIR;break;;
            [Nn]* ) break;;
            * ) echo "Please answer [y/n]";;
        esac
    done
}

i_picom() {
    while true; do
        read -p "Do you want to install and custom picom ? [Y/n] " yn
        case $yn in
            [Yy]* )  cd $DIR/picom && ./picom.sh && cd $DIR;break;;
            [Nn]* ) break;;
            * ) echo "Please answer [y/n]";;
        esac
    done
}

i_rofi() {
    while true; do
        read -p "Do you want to install and custom rofi ? [Y/n] " yn
        case $yn in
            [Yy]* ) cd $DIR/rofi && ./rofi.sh && cd $DIR;break;;
            [Nn]* ) break;;
            * ) echo "Please answer [y/n]";;
        esac
    done
}

i_spotify() {
    while true; do
        read -p "Do you want to install and custom spotify ? [Y/n] " yn
        case $yn in
            [Yy]* ) cd $DIR/spotify && ./spotify.sh && cd $DIR;break;;
            [Nn]* ) break;;
            * ) echo "Please answer [y/n]";;
        esac
    done
}

i_code() {
    while true; do
        read -p "Do you want to install and custom vscode ? [Y/n] " yn
        case $yn in
            [Yy]* )  cd $DIR/vs-code && ./vs-code.sh && cd $DIR;break;;
            [Nn]* ) break;;
            * ) echo "Please answer [y/n]";;
        esac
    done
}

i_zsh() {
    while true; do
        read -p "Do you want to install and custom spotify ? [Y/n] " yn
        case $yn in
            [Yy]* ) cd $DIR/zsh && ./zsh.sh && cd $DIR;break;;
            [Nn]* ) break;;
            * ) echo "Please answer [y/n]";;
        esac
    done
}

main() {
    if [[ $1 == "--fast" || $1 == "-f" ]]; then
        cd $DIR/polybar && ./polybar.sh && cd $DIR/kitty && ./kitty.sh && cd $DIR/zsh && ./zsh.sh && cd $DIR/i3 && ./i3.sh && cd $DIR/rofi && ./rofi.sh && cd $DIR/picom && ./picom.sh
    else
        clear
        i_poly
        clear
        i_kitty
        clear
        i_editors
        clear
        i_zsh
        clear
        i_code
        clear
        i_spotify
        clear
        i_rofi
        clear
        i_picom
        clear
        i_i3
        clear
    fi
    printf "All done\n"
}

main "$@"