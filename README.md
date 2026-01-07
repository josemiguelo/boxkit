# my custom distrobox image

This is my custom fedora image for development purposes on [distrobox](https://distrobox.it/). It contains the packges I need for software development.

## Signing the image

[Here](https://github.com/ublue-os/boxkit?tab=readme-ov-file#signing-your-images)

## Using the custom images

1. build the box (at the root of this folder):

```bash
podman build -t localhost/fedora:43 -f ./ContainerFiles/fedora .
```

2. create the box:

```bash
SHELL=/bin/zsh distrobox create \
-i localhost/fedora:43 \
-n boxkit-fedora \
--home ~/Distroboxes/boxkit-fedora
```

For iterating faster, remove the box's home directory and stop everything first:

```bash
sudo rm -rf ~/Distroboxes/boxkit-fedora/ ; \
distrobox stop boxkit-fedora -Y ; \
distrobox rm boxkit-fedora -f
```

Note: the code above uses the locally-built image. After iterating and pushing the changes to Github, ghcr is the registry you want to pull images from. Replace `localhost/fedora:43` with ` ghcr.io/josemiguelo/fedora:43`

3. start using the box (wherever this repo was cloned at):

```bash
SHELL=/bin/zsh distrobox assemble create && distrobox enter boxkit-fedora
```

4. pull down dotfiles if you enter the box for the first time. Execute this *inside* the box:

```bash
setup-dotfiles.sh
```

This will:
1. download and set up chezmoi dotfiles
2. install asdf-vm plugins and tools
3. download and install Fira Code fonts
4. export several apps to the host

By default, it will install all tools defined in [~/.tool-versions](https://github.com/josemiguelo/.dotfiles/blob/master/dot_tool-versions). If no tool is wanted to be installed, pass the env var `NO_ASDF_TOOL_INSTALLATION=true`. If you want to install just some of those tools, pass `ASDF_TOOL_LIST="golang ruby ..."`. 
