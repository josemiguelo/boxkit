#!/bin/sh

dnf5 install -y chezmoi

chezmoi init --verbose https://github.com/josemiguelo/.dotfiles.git
sleep 2
chezmoi apply
