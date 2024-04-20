#!/bin/zsh

source $(dirname "$0")/shared_functions.sh

title "INSTALL PYENV DEPENDENCIES"
run_command sudo apt-get install build-essential zlib1g-dev libffi-dev libssl-dev libbz2-dev libreadline-dev libsqlite3-dev liblzma-dev libncurses-dev python-tk python3-tk tk-dev -y

title "INSTALL PYENV"
run_command curl https://pyenv.run | bash
run_command echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
run_command echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
run_command echo 'eval "$(pyenv init -)"' >> ~/.zshrc

title "INSTALL PYTHON 3.11"
run_command pyenv install 3.11
run_command pyenv versions

title "GLOBAL SETUP PYTHON 3.11"
run_command pyenv global 3.11

title "CREATE POETRY VIRTUALENV"
run_command pyenv virtualenv 3.11 poetry311

title "INSTALL POETRY"
PYENV_VERSION=$(pyenv version | awk '{print $1}')
run_command pyenv global poetry311 # TODO: Find a way to activate it only in the current shell
run_command pyenv version
run_command python3 --version
run_command python3 -m pip install poetry
run_command pyenv global $PYENV_VERSION
echo -e "\e[33mWARNING Check your pyenv setup (i.e. that you are back to your virtual env)\e[0m"