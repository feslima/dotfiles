# My dotfile configurations

Configurations for some of the tools I use.

## Recommendations

1. Install the [`FiraMono Nerd Font`](https://www.nerdfonts.com/font-downloads)
   and use as terminal font.
2. Install the [`oh-my-bash`](https://github.com/ohmybash/oh-my-bash).


### Installing this config
#### prequisites
- You will need `python`>=3.12. A virtual environment is highly recommended;
- `poetry` is optional;

Run `pip install -r requirements.txt` (or `poetry install --no-root`).
Then `pyinfra installer/inventories.py installer/tasks/<any-dependency-you-want>.py`,
this will setup the dependency on your local machine assuming its a debian/ubuntu
based OS.
