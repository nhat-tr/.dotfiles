#!/usr/bin/env bash

DPATH=$HOME/.dotfiles

function main() {

  echo "+-------------------------------+"
  echo "|        Linking Configs        |"
  echo "+-------------------------------+"

  $DPATH/scripts/linkconfigs.sh

  read -p "Install xcode-select?" -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    xcode-select --install
  fi

  read -p "Install software? Y/N" -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    software
  fi

  read -p "Install managers? Y/N" -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    managers
  fi
  source $HOME/.asdf/asdf.sh

  read -p "Install langs? Y/N" -n 1 -r
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    langs
  fi

}

function managers() {

  touch $HOME/.bash_profile

  echo "+-----------------------------------+"
  echo "|        Installing Homebrew        |"
  echo "+-----------------------------------+"
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  echo "+-------------------------------+"
  echo "|        Installing asdf        |"
  echo "+-------------------------------+"
  git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf
  cd $HOME/.asdf || exit
  git checkout "$(git describe --abbrev=0 --tags)"
  cd -- || exit
}

function langs() {
  echo "+---------------------------------+"
  echo "|        Installing NodeJS        |"
  echo "+---------------------------------+"
  asdf plugin-add nodejs
  bash $HOME/.asdf/plugins/nodejs/bin/import-release-team-keyring
  asdf install nodejs 15.0.0
  asdf global nodejs 15.0.0
  asdf plugin-add yarn
  asdf install yarn 1.21.1
  asdf global yarn 1.21.1

  echo "+---------------------------------+"
  echo "|        Installing Python        |"
  echo "+---------------------------------+"
  asdf plugin-add python
  asdf install python 3.9.0
  asdf install python 2.7.13
  asdf global python 2.7.13 3.9.0

  echo "+------------------------------+"
  echo "|        Installing Lua        |"
  echo "+------------------------------+"
  asdf plugin-add lua
  asdf install lua 5.3.5
  asdf global lua 5.3.5

  asdf reshim
}

function software() {

  echo "+-----------------------------------+"
  echo "|        Installing Fonts        |"
  echo "+-----------------------------------+"
  cp -f $DPATH/home/Library/Fonts/*.ttf $HOME/Library/Fonts
  brew bundle

  echo "+-------------------------------+"
  echo "|        Installing Tmux        |"
  echo "+-------------------------------+"
  asdf plugin-add tmux
  asdf install tmux 3.1b
  asdf global tmux 3.1b
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

  echo "+---------------------------------+"
  echo "|        Installing Zinit         |"
  echo "+---------------------------------+"
  mkdir ~/.zinit
  git clone https://github.com/zdharma/zinit.git ~/.zinit/bin

  echo "+---------------------------------+"
  echo "|        Installing NeoVim        |"
  echo "+---------------------------------+"
  gem install neovim solargraph
  pip install neovim pynvim
  pip3 install neovim python-language-server pylint pynvim
  yarn global add neovim write-good markdownlint-cli eslint prettier lua-fmt

}


