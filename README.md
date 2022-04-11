# Installing

## setup with `pyenv` You must have `pyenv` installed.

1. Install python2 and python3 versions with `pyenv install 2.7.18` (for python
   2) and `pyenv isntall 3.x.z` (whatever is most stable for python 3).
2. Create the virtual environments exclusively for `neovim` for both python 2
   and 3 with: `pyenv virtualenv <python-version> <venv-name>` (e.g. `pyenv
   virtualenv 2.7.18 nvim-python2`).
3. Activate the environments create in step 2 with `pyenv activate
   nvim-python2` e instale o `pynvim` com `python -m pip install pynvim` (see
   Troubleshooting section for more info).
4. Grab the python paths for each python venv with `pyenv which python`, the go
   the `lua/user/options.lua` file and set the `g:python_host_prog` and
   `g:python3_host_prog` variables to the python path value reported by pyenv.

1. python 2 support with `pip install pynvim`
2. node support with `npm install -g neovim`
3. Install `trash` with `sudo apt install trash-cli`
4. Install `null-ls` formatters/linters.
  1. `stylua`: You must have `Rust` installed, then run `cargo install stylua`
     ([source](https://github.com/JohnnyMorganz/StyLua#installation)).
  2. `black`, `mypy`, and other python related: These are managed via pip, so
     you must have them installed in their respective environments.
5. paste the content of this folder without this `README.md` into the home
   directory `home/<user>/.config/nvim/`. **Make sure you don't have a folder
   like this already before doing this!**

# Troubleshooting ## `:checkhealth` says neovim (python) is not installed.
Probably because the Ubuntu/Linux python distribution is broken somehow. See
[this
first](https://github.com/neovim/neovim/issues/9246#issuecomment-477066616).
Then try running for python2 `python -m pip uninstall pynvim neovim`. If you
get this error, then you have to:
1. Force a reinstall of pip for both python2 and python3 versions as described
   [here](https://askubuntu.com/a/1026848).
2. Uninstall both `pynvim` and `neovim` with `python -m pip uninstall pynvim
   neovim`. **Do this for both pythons (2 and 3)**.
3. Install `pynvim` with `python -m pip install pynvim` for both pythons (2 and
   3).

# Useful info ## Where the plugins are installed? Look for the folder
`~/.local/share/nvim`. Here all the stuff necessary for coding will be
installed, e.g: LSP.
