#!/bin/sh

if ! command -v zsh >/dev/null 
then
    echo "zsh not installed. Installing zsh"
    sudo apt install zsh
    zsh --version
else
    echo "zsh already installed."
fi
if [ ! -d "$HOME/.oh-my-zsh" ] 
then
    echo "Installing Oh My Zsh"
    echo "Backing up .zshrc to .zshrc.backup"
    cp ~/.zshrc ~/.zshrc.backup
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended | zsh
else
    echo "Oh My Zsh already installed."
fi

echo "Setting up configs"
cp .zshrc ~/.zshrc
cp ../shells/.aliases ~/.aliases

echo "Setting default shell"
if [ $SHELL = $(which zsh) ]; then
    echo "Shell alreay set. Not changed."
else 
    chsh -s $(which zsh)
fi

echo "Done."