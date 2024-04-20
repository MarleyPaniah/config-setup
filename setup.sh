#!/bin/bash

source $(dirname "$0")/shared_functions.sh
source $(dirname "$0")/stacks.sh

USE_ALL=0

function display_usage {
    echo ""
    echo "USAGE:"
    echo "Install usual dependencies, tools and configuration files."
    echo "./setup.sh <stack>"
    echo "Example: ./setup.sh tools"
    echo ""
}


function check_nb_args {
    if [ "$#" -lt 1 ]; then
        echo "Error: Pass at least one argument."
        display_usage
        exit 1
    fi
}


function get_args {
    while :; do
        case $1 in
            -h|-\?|--help)
                display_usage
                exit
                ;;
            *) break
        esac
        shift
    done
}


function check_stacks {
    local stacks=$@

    for stack in ${stacks[@]}; do

        # Because we don't want to install stacks multiple times.
        if [ "$stack" = "all" ]; then
            USE_ALL=1
        fi

        contains_element "$stack" "${VALID_STACKS[@]}"
        if [ $? -ne 0 ]; then
            echo "Error: Invalid stack name '$stack'. Select from: ${VALID_STACKS[@]}"
            exit 1
        fi
    done
}


function install_stacks {
    local stacks=$@
    echo "Selected stacks: $stacks"

    for stack in $stacks; do
        if [ "$stack" = "tools" ]; then
            local file_list=(${TOOLS[@]})
        elif [ "$stack" = "all" ]; then
            local file_list=(${ALL[@]})
        elif [ "$stack" = "basics" ]; then
            local file_list=(${BASICS[@]})
        else
            echo "Unexpected error. Stacks: $stacks"
            exit 1
        fi

        echo "Installing stack: $stack"
        echo "=> Associated files: $file_list"

        for element in ${file_list[@]}; do
            filename="${element}.sh"
            echo -e "\e[32mSTART: $filename\e[0m"
            ./$filename
            echo -e "\e[32mDONE: $filename\e[0m"
        done

    done
}


function setup {
    title "START SETUP"
    check_nb_args $@
    get_args $@
    check_stacks $@
    install_stacks $@
}

setup $@