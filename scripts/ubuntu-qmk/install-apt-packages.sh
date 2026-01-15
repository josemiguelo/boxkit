#!/bin/bash

set -ouex pipefail

apt update
apt install -y wget \
  curl \
  gcc \
  git \
  gnupg \
  openssh-client \
  apt-transport-https \
  vim \
  unzip \
  ripgrep \
  silversearcher-ag \
  ca-certificates \
  kitty \
  gparted \
  samba \
  openssh-server \
  openssh-client \
  xclip \
  fd-find \
  tree \
  jq \
  moreutils 