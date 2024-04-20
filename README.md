# Config-setup

Shell scripts to install my tools and create necessary setups automatically.

It will for example install Zsh as shell with a specific theme, or install pyenv to have a proper Python setup.

# Usage

You can install entire stacks with the `setup.sh` script.
Choose the stacks you want to install and run the `setup.sh` script (or all to install all of them).

See the [stacks here](./stacks.sh) (at `VALID_STACKS`).

```bash
./setup.sh <stacks>
# Examples:
# ./setup.sh tools
# ./setup.sh tools basics
# ./setup.sh all
```

You can also use the scripts individually:

```bash
# Example:
./install-python.sh
```