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
  moreutils \
  zoxide \
  fzf \
  make \
  build-essential \
  libssl-dev \
  zlib1g-dev \
  libbz2-dev \
  libreadline-dev \
  libsqlite3-dev \
  libncursesw5-dev \
  xz-utils \
  tk-dev \
  libxml2-dev \
  libxmlsec1-dev \
  libffi-dev \
  liblzma-dev
