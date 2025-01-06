#!/bin/zsh

# home-managerをインストール
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update

# パッケージのインストール
home-manager switch

# シムリンクを貼る
rm ~/.zshrc
ln -s ~/.config/zsh/zshrc ~/.zshrc
