#!/bin/bash

DIR=$(pwd)

main() {
	yay -Rc ttf-fira-code
	yay -Sy ttf-fira-code
	yay -Rc kitty
	yay -Sy kitty
	rm -rf $HOME/.config/kitty
	mkdir $HOME/.config/kitty
	cp $DIR/config/kitty.conf $HOME/.config/kitty/kitty.conf
}

main "$@"
