#!/usr/bin/env bash

DIR=`pwd`
TDIR=$DIR/polybar-themes
FDIR="$HOME/.local/share/fonts"
PDIR="$HOME/.config/polybar"
STYLE='simple'

# Install Fonts
install_fonts() {
    echo -e "\n[*] Installing fonts..."
    if [[ -d "$FDIR" ]]; then
        cp -rf $TDIR/fonts/* "$FDIR"
    else
        mkdir -p "$FDIR"
        cp -rf $TDIR/fonts/* "$FDIR"
    fi
}

# Install Themes
install_themes() {
    if [[ -d "$PDIR" ]]; then
        echo -e "[*] Creating a backup of your polybar configs..."
        mv "$PDIR" "${PDIR}.old"
        { mkdir -p "$PDIR"; cp -rf $TDIR/$STYLE/blocks "$PDIR"; cp -rf $TDIR/$STYLE/launch.sh "$PDIR"; }
    else
        { mkdir -p "$PDIR"; cp -rf $TDIR/$STYLE/blocks "$PDIR"; cp -rf $TDIR/$STYLE/launch.sh "$PDIR"; }	
    fi
    if [[ -f "$PDIR/launch.sh" ]]; then
        echo -e "[*] Successfully Installed the blocks theme.\n"
        exit 0
    else
        echo -e "[!] Failed to install.\n"
        exit 1
    fi
}

# Download Polybar
download_polybar() {
    yay -Sy polybar
    git clone --depth=1 https://github.com/adi1090x/polybar-themes.git
    cd $TDIR
    install_fonts
    install_themes
    $PDIR/blocks/scripts/styles.sh --nord
    killall -q polybar
    $PDIR/launch.sh --blocks
}

# Move old Polybar Config
move_old() {
    mv $HOME/.config/polybar $HOME/.config/polybar-old
    download_polybar
}

if [[ -d "$HOME/.config/polybar" ]]; then
    while true; do
        read -p "Do you want to reinstall polybar ? [Y/n]" yn
        case $yn in
            [Yy]* )move_old;break;;
            [Nn]* ) exit 0;;
            * ) echo "Please answer [y/n]";;
        esac
    done
else
    download_polybar
fi

$HOME/.config/polybar/launch.sh --blocks