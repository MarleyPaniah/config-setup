#!/bin/zsh

source $(dirname "$0")/shared_functions.sh

title "INSTALL CURL"
run_command sudo apt install -y curl

title "INSTALL NET-TOOLS"
run_command sudo apt install -y net-tools
