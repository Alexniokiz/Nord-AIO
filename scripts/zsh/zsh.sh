#!/bin/bash

check_zsh() {
    pacman -Qi zsh > /dev/null
    if [[ $? != 0 ]]; then
       pacman -Sy zsh
    fi
}

check_oh_my_zsh() {
    if [[ ! -d $HOME/.oh-my-zsh ]]; then
        echo "Zeubie"
        sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
        git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    fi
}

replace_zshrc() {
    printf "export ZSH=\"$HOME/.oh-my-zsh\"\n" > $HOME/.zshrc
    printf "ZSH_THEME=\"robbyrussell\"\n\n" >> $HOME/.zshrc
    printf "plugins=(
            git
            zsh-autosuggestions
        )\n\n" >> $HOME/.zshrc
    printf "source \$ZSH/oh-my-zsh.sh\n" >> $HOME/.zshrc
    printf "\n# Functions aliases\n\n" >> $HOME/.zshrc
    printf "lazymake() {\n" >> $HOME/.zshrc
    printf "    cp $HOME/Code/LazyMake/LazyMake.sh .\n" >> $HOME/.zshrc
    printf "    if [ -n \"\$1\" ]\n" >> $HOME/.zshrc
    printf "        then\n" >> $HOME/.zshrc
    printf "            ./LazyMake.sh \${1}\n" >> $HOME/.zshrc
    printf "        else\n" >> $HOME/.zshrc
    printf "            ./LazyMake.sh\n" >> $HOME/.zshrc
    printf "        fi\n" >> $HOME/.zshrc
    printf "    rm LazyMake.sh\n" >> $HOME/.zshrc
    printf "}\n" >> $HOME/.zshrc
}

main() {
    check_zsh
    check_oh_my_zsh
    replace_zshrc
}

main "$@"