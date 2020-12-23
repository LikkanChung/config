#!/bin/sh

zsh --version | grep 'not found' &> /dev/null
if [ $? == 0 ]; then
    echo "zsh not installed. Installing zsh"
    sudo apt install zsh
    zsh --version
else 
    echo "zsh already installed."
fi
if [ -d "~/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh"
    echo "Backing up .zshrc to .zshrc.backup"
    cp ~/.zshrc ~/.zshrc.backup
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
else 
    echo "Oh My Zsh already installed."
fi
echo "Setting up configs"
cp .zshrc ~/.zshrc
cp ../shells/.aliases ~/.aliases

echo "Setting default shell"
chsh -s $(which zsh)

echo "Done."