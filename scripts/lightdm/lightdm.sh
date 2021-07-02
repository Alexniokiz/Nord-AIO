#!/bin/bash
DIR=$(pwd)

main () {
    echo "##### LIGHTDM ####"
    yay -Rc picom
    rm -rf $HOME/.config/picom
    if [[ -f $HOME/.config/picom.conf ]]
    then
        while true; do
            read -p "Do you want to install a custom theme for Lightdm ? [Y/n]" yn
            case $yn in
                [Yy]* ) install; break;;
                [Nn]* ) exit 1;;
                * ) echo "Please answer [y/n]";;
            esac
        done
    fi
    pacman -S --needed lightdm-webkit2-greeter lightdm-webkit-theme-litarvan
    picom -b -f
    echo "##### LIGHTDM DONE ####"
}

install () {
    mv $DIR/config/lightdm-webkit2-greeter.conf /etc/lightdm
    mv $DIR/config/lightdm.conf /etc/lightdm
    cp $DIR/config/nord.jpeg /usr/share/backgrounds
}

main "$@"

# exec picom -b -f