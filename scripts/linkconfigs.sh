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
mkdir -p $HOME/.local/bin

$DPATH/scripts/lnfilepath.sh $DPATH/home/.tmux* $HOME/.config/tmux
# $DPATH/scripts/lnfilepath.sh $DPATH/home/config/nvim/* $HOME/.config/nvim
# $DPATH/scripts/lnfilepath.sh $HOME/.config/nvim.eco/* $HOME/.config/nvim
$DPATH/scripts/lnfilepath.sh $HOME/.config/nvim.lz/* $HOME/.config/nvim
$DPATH/scripts/lnfilepath.sh $DPATH/.local/bin/scripts/tmux-sessionizer $HOME/.local/bin
