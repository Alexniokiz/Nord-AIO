#!/bin/bash
DIR=$(pwd)

main () {
    echo "##### PICOM ####"
    rm -rf $HOME/.config/picom
    if [[ -f $HOME/.config/picom.conf ]]
    then
        while true; do
            read -p "Do you want to reinstall Picom ? (old config will be saved)[Y/n]" yn
            case $yn in
                [Yy]* ) move_oldconfig; break;;
                [Nn]* ) exit 1;;
                * ) echo "Please answer [y/n]";;
            esac
        done
    fi
    yay -Sy picom-ibhagwan-git
    cp $DIR/config/picom.conf $HOME/.config/picom.conf
    echo "##### PICOM DONE ####"
}

move_oldconfig () {
    mv $HOME/.config/picom.conf $HOME/.config/picomOLD.conf
}

main "$@"

# exec picom -b -f