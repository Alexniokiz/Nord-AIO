#!/bin/bash

DIR=$(pwd)

main () {
    yay -Sy vim
    rm -rf ~/.vimrc
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    cp $DIR/config/.vimrc ~/
    while true; do
        read -p "OPEN A NEW TERMINAL, START VIM, AND TYPE :PlugInstall , WAIT FOR IT TO FINISH AND COMEBACK HERE PRESSING Y OR N" yn
        case $yn in
            [Yy]* ) break;;
            [Nn]* ) break;;
            * ) echo "OPEN A NEW TERMINAL, START VIM, AND TYPE :PlugInstall , WAIT FOR IT TO FINISH AND COMEBACK HERE PRESSING Y OR N";;
    esac
    done
}

main "$@"
