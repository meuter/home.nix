#! /usr/bin/env bash
set -xeuo pipefail
IFS=$'\n\t'

# install nix in single user
sh <(curl -L https://nixos.org/nix/install) --no-daemon

# source nix profile
source ~/.nix-profile/etc/profile.d/nix.sh

# backup some file that are in the way
mv ~/.profile ~/.profile.bak
mv ~/.bashrc ~/.bashrc.bak

# install home-manager
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
nix-channel --update
nix-shell '<home-manager>' -A install

