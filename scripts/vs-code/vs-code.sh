#!/bin/bash

check_code() {
    yay -Qi visual-studio-code-insiders-bin
    if [[ $? != 0 ]]; then
        yay -Qi code
        if [[ $? != 0 ]]; then
            yay -Sy visual-studio-code-insiders-bin
        fi
    fi
}

main() {
    check_code
    code-insiders --install-extension arcticicestudio.nord-visual-studio-code
    code-insiders --install-extension TabNine.tabnine-vscode
    code-insiders --install-extension eamodio.gitlens
    code-insiders --install-extension nicolaspolomack.epitech-c-cpp-headers
    code-insiders --install-extension adpyke.codesnap
    code-insiders --install-extension vmsynkov.colonize
    code-insiders --install-extension ms-vscode.cpptools
    code-insiders --install-extension coenraads.bracket-pair-colorizer
    code-insiders --install-extension ms-vsliveshare.vsliveshare
    code-insiders --install-extension vscode-icons-team.vscode-icons
}

main "$@"