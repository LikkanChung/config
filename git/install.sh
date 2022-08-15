echo "This script should be run from ../git to execute correctly."

echo "Setting up configs"
cp .gitconfig ~/.gitconfig

echo "Config files installed:"
ls -la ~/.gitconfig

echo "Don't forget to set git email identiy: 'git config --global user.email ...@...'"