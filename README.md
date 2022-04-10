# Installing

1. python 2 support with `pip install pynvim`
2. node support with `npm install -g neovim`
3. Install `trash` with `sudo apt install trash-cli`
3. paste the content of this folder without this `README.md` into the home directory `home/<user>/.config/nvim/`. **Make sure you don't have a folder like this already before doing this!**

# Troubleshooting
## `:checkhealth` says neovim (python) is not installed.
Probably because the Ubuntu/Linux python distribution is broken somehow. See [this first](https://github.com/neovim/neovim/issues/9246#issuecomment-477066616). Then try running for python2 `python -m pip uninstall pynvim neovim`. If you get this error, then you have to:
1. Force a reinstall of pip for both python2 and python3 versions as described [here](https://askubuntu.com/a/1026848).
2. Uninstall both `pynvim` and `neovim` with `python -m pip uninstall pynvim neovim`. **Do this for both pythons (2 and 3)**.
3. Install `pynvim` with `python -m pip install pynvim` for both pythons (2 and 3).

# Useful info
## Where the plugins are installed?
Look for the folder `~/.local/share/nvim`. Here all the stuff necessary for coding will be installed, e.g: LSP.
