#!/bin/bash


set -o xtrace
# Install packages
sudo apt update
sudo apt install git vim htop

# Setup variables
#---------------------------------------------------------------------
HOME="/home/${USER}"
echo $HOME
SCRIPTS_DIR="${HOME}/Documents/scripts"

BASE_NAME=".custom_settings"
BASE_DIR="${HOME}/${BASE_NAME}"

REPO_NAME="setup"
REPO_DIR="${BASE_DIR}/${REPO_NAME}"
#---------------------------------------------------------------------


# Create directories and clone repo
#---------------------------------------------------------------------
cd ~
mkdir ${BASE_NAME}
cd ${BASE_DIR}

git clone https://github.com/artak-kirakosyan/${REPO_NAME}.git
cd ${REPO_DIR}
#---------------------------------------------------------------------


# Setup useful aliases
#---------------------------------------------------------------------
echo "alias ll='ls -ahlF'" >> ~/.bashrc
echo "alias la='ls -A'" >> ~/.bashrc
echo "alias l='ls -CF'" >> ~/.bashrc
#---------------------------------------------------------------------


# Setup git configs
#---------------------------------------------------------------------
git config --global alias.lga "log --graph --oneline --all --decorate"
git config --global core.editor "vim"
#---------------------------------------------------------------------


# Setup reset script
#---------------------------------------------------------------------
mkdir -p ${SCRIPTS_DIR}
cp run_reset.sh "${SCRIPTS_DIR}"
cp reset.py "${SCRIPTS_DIR}"
echo "@reboot ${SCRIPTS_DIR}/run_reset.sh" | crontab -u $(whoami) -
#---------------------------------------------------------------------


# Link vim files
#---------------------------------------------------------------------
ln -s ${REPO_DIR}/.vimrc ~/.vimrc
ln -s ${REPO_DIR}/.vim ~/.vim
#---------------------------------------------------------------------


# Setup indent line
#---------------------------------------------------------------------
cd ~
cd .vim/bundle
git clone https://github.com/artak-kirakosyan/indentLine.git
#---------------------------------------------------------------------


# Import dock settings
cd ${REPO_DIR}
dconf load / < dconf_org_gnome_shell_extensions_dash_to_dock


# Install dev soft
sudo snap install intellij-idea-ultimate --channel=2021.1/stable --classic
sudo snap install pycharm-professional --channel=2021.1/stable --classic
sudo snap install webstorm --channel=2021.1/stable --classic


set +o xtrace
