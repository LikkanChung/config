#!/bin/sh

if ! command -v zsh >/dev/null 
then
    echo "zsh not installed. Installing zsh"
    sudo apt install zsh
    zsh --version
else
    echo "zsh already installed."
fi
if [ ! -d "~/.oh-my-zsh" ] 
then
    echo "Installing Oh My Zsh"
    echo "Backing up .zshrc to .zshrc.backup"
    cp ~/.zshrc ~/.zshrc.backup
    wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - --unattended | zsh
else
    echo "Oh My Zsh already installed."
fi

echo "Setting up configs"
cp .zshrc ~/.zshrc
cp ../shells/.aliases ~/.aliases

echo "Setting default shell"
if [ $SHELL == $(which zsh) ]; then
    echo "Shell alreay set. Not changed."
else 
    chsh -s $(which zsh)
fi

echo "Done."