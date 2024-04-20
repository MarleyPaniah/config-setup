#!/bin/bash

source $(dirname "$0")/shared_functions.sh

title "INSTALL ZSH"
run_command sudo apt install zsh

title "INSTALL OH-MY-ZSH"
run_command sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

title "CHANGE OH-MY-ZSH THEME"
run_command cp ~/.zshrc ~/.zshrc.config-setup.bkp
run_command echo 'ZSH_THEME=xiong-chiamiov-plus' >> ~/.zshrc