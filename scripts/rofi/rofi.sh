#!/bin/bash
DIR=$(PWD)

main () {
    echo "##### ROFI #####"
    if [[ -d $HOME/.config/rofi ]]
    then
        while true; do
            read -p "Do you want to reinstall rofi ? (old config will be saved)[Y/n]" yn
            case $yn in
                [Yy]* ) move_oldconfig; break;;
                [Nn]* ) exit 1;;
                * ) echo "Please answer [y/n]";;
            esac
        done
    fi
    mkdir $HOME/.config/rofi
    cp -rf $DIR/config/* $HOME/.config/rofi/
    echo "##### ROFI DONE #####"
}

move_oldconfig () {
    mv $HOME/.config/rofi $HOME/.config/rofiOLD
}
