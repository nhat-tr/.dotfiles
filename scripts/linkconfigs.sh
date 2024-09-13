#!/bin/zsh
DPATH="$HOME/.dotfiles"

$DPATH/scripts/lnfilepath.sh $DPATH/home/.default-npm-packages $HOME
$DPATH/scripts/lnfilepath.sh $DPATH/home/.default-python-packages $HOME
$DPATH/scripts/lnfilepath.sh $DPATH/home/.editorconfig $HOME
$DPATH/scripts/lnfilepath.sh $DPATH/home/.eslintrc $HOME
$DPATH/scripts/lnfilepath.sh $DPATH/home/.prettierrc $HOME
$DPATH/scripts/lnfilepath.sh $DPATH/home/.git* $HOME
$DPATH/scripts/lnfilepath.sh $DPATH/home/.zsh* $HOME

mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.config/tmux
mkdir -p $HOME/.config/zsh

$DPATH/scripts/lnfilepath.sh $DPATH/home/.tmux* $HOME/.config/tmux
$DPATH/scripts/lnfilepath.sh $DPATH/home/.config/nvim/* $HOME/.config/nvim
