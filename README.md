# dotfiles
Yadm managed dotfiles

### Git Setup
```
# install git as part of xcode
xcode-select --install

# Setup login info
git config --global user.name chr15murray
# Setup email to whichever address makes sense...
#git config --global user.email c.murray@iesohealth.com
#git config --global user.email chris@distrail.io
#git config --global user.email chr15murr4y@gmail.com

mkdir ~/git
cd ~/git

# Prepare yadm
git clone https://github.com/chr15murray/dotfiles.git

# You don't need this so we can delete it but we tested auth to github.
rm -rf ~/git/dotfiles


# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# install and setup yadm
brew install yadm
yadm clone https://github.com/chr15murray/dotfiles.git
