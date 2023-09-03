# My `neovim` custom configuration

## General requirements

- Install [`ripgrep`](https://github.com/BurntSushi/ripgrep).

## Installing neovim (v0.9.0)

[Instructions](https://github.com/neovim/neovim/wiki/Installing-Neovim#appimage-universal-linux-package)

1. Uninstall previous versions if you have any.
2. Download the latest stable it with: `curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage`.
3. Run `chmod u+x nvim.appimage`.
4. Move it to `$PATH` with `sudo mv nvim.appimage /usr/local/bin/nvim`.
5. Done!

## Installing this config

Paste the contents of this folder without this `README.md` into the home
directory `home/<user>/.config/nvim/`. **Make sure you don't have a folder
like this already before doing this!**

Open `nvim` then run `:MasonInstallAll`. Then you are done.

## Lazygit integration

Install `lazygit` following [these instructions](https://github.com/jesseduffield/lazygit#ubuntu)

Or update from inside the lazygit app (if it's already installed).

Or update the version in the command below with the latest release number:

```shell
wget -qO- https://github.com/jesseduffield/lazygit/releases/download/<update-this>/lazygit_<update-this>.tar.gz | sudo tar xvz -C /usr/local/bin/
```

## Lazydocker integration

Install `lazydocker` following [these instructions](https://github.com/jesseduffield/lazydocker#binary-release-linuxosxwindows)

## Useful info

### Where the plugins are installed? Look for the folder

`~/.local/share/nvim`. Here all the stuff necessary for coding will be
installed, e.g: LSP.
