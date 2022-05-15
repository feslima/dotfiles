# My `neovim` custom configuration

## Installing neovim (v0.7.0)

[Instructions](https://github.com/neovim/neovim/wiki/Installing-Neovim#appimage-universal-linux-package)

1. Uninstall previous versions if you have any.
2. Download the latest stable it with: `curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage`.
3. Run `chmod u+x nvim.appimage`.
4. Move it to `$PATH` with `sudo mv nvim.appimage /usr/local/bin/nvim`.
5. Done!

## Installing this config

Prerequisites:

- node support with `npm install -g neovim`
- `python3` installation configured for `neovim` (It's recomended to set a
  virtual environment exclusive for this).

Paste the contents of this folder without this `README.md` into the home
directory `home/<user>/.config/nvim/`. **Make sure you don't have a folder
like this already before doing this!**

## setup with `pyenv` (You must have `pyenv` installed)

1. Install python3 version with `pyenv isntall 3.x.z` (whatever is most stable
   for python 3).
2. Create the virtual environment exclusively for `neovim` for python 3 with:
   `pyenv virtualenv <python-version> <venv-name>`
   (e.g. `pyenv virtualenv 3.10.2 nvim-python3`).
3. Activate the environments create in step 2 with `pyenv activate nvim-python3`
   and install `pynvim` with `python -m pip install pynvim`
   (see Troubleshooting section for more info).
4. Grab the python path for python venv with `pyenv which python`, the go the
   `lua/user/options.lua` file and set the `g:python3_host_prog` variables to
   the python path value reported by pyenv.

## Lazygit integration

Install `lazygit` following [these instructions](https://github.com/jesseduffield/lazygit#ubuntu)

Or update from inside the lazygit app (if it's already installed).

Or update the version in the command below with the latest release number:

```shell
wget -qO- https://github.com/jesseduffield/lazygit/releases/download/<update-this>/lazygit_<update-this>.tar.gz | sudo tar xvz -C /usr/local/bin/
```

## Lazydocker integration

Install `lazydocker` following [these instructions](https://github.com/jesseduffield/lazydocker#binary-release-linuxosxwindows)

## `nvim-tree` requirements

- Install `trash` with `sudo apt install trash-cli`

## `null-ls` formatters/diagnostics

1. `stylua` with `cargo install stylua` (needs `rust` installed)
2. `black`, `mypy`, and other python related: These are managed via pip, so you
   must have them installed in their respective environments.
3. `markdown-cli`: [This is the repo](https://github.com/igorshubovych/markdownlint-cli)

## `nvim-spectre` requirements (search and replace functionality)

1. Install [`ripgrep`](https://github.com/BurntSushi/ripgrep).

## Troubleshooting

### `:checkhealth` says neovim (python) is not installed

Probably because the Ubuntu/Linux python distribution is broken somehow. See
[this first](https://github.com/neovim/neovim/issues/9246#issuecomment-477066616).
Then try running for python2 `python -m pip uninstall pynvim neovim`. If you
get this error, then you have to:

1. Force reinstall of pip for both python2 and python3 versions as described
   [here](https://askubuntu.com/a/1026848).
2. Uninstall both `pynvim` and `neovim` with `python -m pip uninstall pynvim neovim`.
3. Install `pynvim` with `python -m pip install pynvim`

### Formatting with `black` (or any other `null-ls` provider) doesn't work

[Issue that discusses this.](https://github.com/jose-elias-alvarez/null-ls.nvim/issues/700#issuecomment-1060028732)

You have these solutions:

1. If you use `pyenv`, make sure you have a `.python-version` file present in
   the directory where you run `nvim`.
2. Make sure you activate the virtual environment before running `nvim`.
3. [Configure `null-ls` to use local executables.](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/8a401e19c0c2b2569e820b3cc0a3398100d7d6fb/doc/BUILTIN_CONFIG.md#using-local-executables)
4. [Configure `null-ls` conditional sources.](https://github.com/jose-elias-alvarez/null-ls.nvim/blob/8a401e19c0c2b2569e820b3cc0a3398100d7d6fb/doc/BUILTIN_CONFIG.md#conditional-sources)
5. Mix 3 and 4 for an exaustive search for executables.

## Useful info

### Where the plugins are installed? Look for the folder

`~/.local/share/nvim`. Here all the stuff necessary for coding will be
installed, e.g: LSP.
