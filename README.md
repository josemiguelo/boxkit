# my distrobox images

This are my custom images for development purposes on [distrobox](https://distrobox.it/). It contains the packages I need for general and specific software development.

## Signing the image

[Here](https://github.com/ublue-os/boxkit?tab=readme-ov-file#signing-your-images)

<details>

<summary>fedora-dev</summary>

## fedora-dev

### Setting up the box on a new machine

```bash
mkdir -p ~/Distroboxes/fedora-dev

SHELL=/bin/zsh distrobox create \
-i ghcr.io/josemiguelo/fedora-dev:43 \
-n fedora-dev \
--home ~/Distroboxes/fedora-dev \
--additional-flags "--env SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket"
```

### Building the distrobox locally:

1. Clone this repo.

2. build the box (at the root of this folder):

```bash
podman build -t localhost/fedora-dev:43 -f ./ContainerFiles/fedora-dev .
```

3. create the box:

```bash
sudo rm -rf ~/Distroboxes/fedora-dev/ ; \
distrobox stop fedora-dev -Y ; \
distrobox rm fedora-dev -f

distrobox assemble create --file fedora-dev.ini && distrobox enter fedora-dev
```

### Setting up dotfiles

if you enter the box for the first time. Execute this *inside* the box:

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

</details>


<details>

<summary>ubuntu-qmk</summary>

## ubuntu-qmk

### Setting up the box on a new machine

```bash
mkdir -p ~/Distroboxes/ubuntu-qmk

SHELL=/bin/zsh distrobox create \
-i ghcr.io/josemiguelo/ubuntu-qmk:24.04 \
-n ubuntu-qmk \
--home ~/Distroboxes/ubuntu-qmk \
--additional-flags "--env SSH_AUTH_SOCK=$XDG_RUNTIME_DIR/ssh-agent.socket"
```

### Building the distrobox locally:

1. Clone this repo.

2. build the box (at the root of this folder):

```bash
podman build -t localhost/ubuntu-qmk:24.04 -f ./ContainerFiles/ubuntu-qmk  .
```

3. create the box:

```bash
sudo rm -rf ~/Distroboxes/ubuntu-qmk ; \
distrobox stop ubuntu-qmk -Y ; \
distrobox rm ubuntu-qmk -f

distrobox assemble create --file ubuntu-qmk.ini && distrobox enter ubuntu-qmk
```

### Setting up dotfiles

if you enter the box for the first time. Execute this *inside* the box:

```bash
~/.local/bin/setup-dotfiles.sh
```

This will:
1. download and set up chezmoi dotfiles
2. install asdf-vm plugins and tools

After that, exit the distrobox and enter it again. Then execute:

```bash
~/.local/bin/setup-qmk.sh
  ```

This will setup qmk on the distrobox

</details>
