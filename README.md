# my custom distrobox image

This is my custom fedora image for development purposes on [distrobox](https://distrobox.it/). It contains the packages I need for software development.

## Setting up the box on a new machine
```bash
mkdir -p ~/Distroboxes/boxkit-fedora

SHELL=/bin/zsh distrobox create \
-i ghcr.io/josemiguelo/fedora:43 \
-n boxkit-fedora \
--home ~/Distroboxes/boxkit-fedora
```

## Building the distrobox locally:

1. Clone this repo.

2. build the box (at the root of this folder):

```bash
podman build -t localhost/fedora:43 -f ./ContainerFiles/fedora .
```

3. create the box:

```bash
sudo rm -rf ~/Distroboxes/boxkit-fedora/ ; \
distrobox stop boxkit-fedora -Y ; \
distrobox rm boxkit-fedora -f

SHELL=/bin/zsh distrobox assemble create && distrobox enter boxkit-fedora
```

## set up dotfiles if you enter the box for the first time. Execute this *inside* the box:

```bash
setup-dotfiles.sh
```

This will:
1. download and set up chezmoi dotfiles
2. install asdf-vm plugins and tools
3. download and install Fira Code fonts
4. export several apps to the host

By default, it will install all tools defined in [~/.tool-versions](https://github.com/josemiguelo/.dotfiles/blob/master/dot_tool-versions). If no tool is wanted to be installed, pass the env var `NO_ASDF_TOOL_INSTALLATION=true`.

```bash
NO_ASDF_TOOL_INSTALLATION=true setup-dotfiles.sh
```

If you want to install just some of those tools, pass `ASDF_TOOL_LIST="golang ruby ..."`. 

```bash
ASDF_TOOL_LIST="golang ruby" setup-dotfiles.sh
```

## Signing the image

[Here](https://github.com/ublue-os/boxkit?tab=readme-ov-file#signing-your-images)