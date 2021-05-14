
cd ~
mkdir .CONFIGS

cd .CONFIGS

git clone https://github.com/artak-kirakosyan/vim_config.git

cd vim_config

ln -s ~/.CONFIGS/vim_config/.vimrc ~/.vimrc
ln -s ~/.CONFIGS/vim_config/.vim ~/.vim

cd .vim/bundle

git clone https://github.com/artak-kirakosyan/indentLine.git

echo "alias ll='ls -alF'" >> ~/.bashrc
echo "alias la='ls -A'" >> ~/.bashrc
echo "alias l='ls -CF'" >> ~/.bashrc

# this one is not a vim related, but is very useful
git config --global alias.lga "log --graph --oneline --all --decorate"
git config --global core.editor "vim"
