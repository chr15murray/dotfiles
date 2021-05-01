# dotfiles
Yadm managed dotfiles

## ARCH Pre-Setup
### Install Required packages
```
sudo pacman -Syu paru cryfs
paru -Syu yadm
```

### Setup KDE Plasma Vault
`mkdir ~/keys`
Use the UI to configure:
- Name: keys
- Encryption: CryFs
- Mount Path: `/home/chris/keys`
- Password: something suitable strong
Now unlock the Vault before proceeding

### Setup github
`git config --global credential.helper 'store -file ~/keys/gh'`


## MAC Pre-setup
### install git as part of xcode (Mac Only)
xcode-select --install

### install and setup yadm
brew install yadm

### Install Homebrew (Mac Only)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"


## Setup
### git login info
`git config --global user.name chr15murray`

### Setup email to whichever address makes sense...
```
git config --global user.email chris@distrail.io
```

### YADM Setup
`yadm clone https://github.com/chr15murray/dotfiles.git`

Follow the bootstrap prompts
After ZSH is configured `exit`

```

### VSCODE

THis uses a setting sync plugin and GitHub gist. 

Install Settings Sync (shan.code-settings-sync) and authenticate to GitHub. You should then be able to select the gist and download.

