#!/bin/zsh

function title {
    local input_string=$1
    local length=${#input_string}
    local equals=$(printf '=%.0s' {1..50})

    echo "$equals"
    echo "$input_string"
    echo "$equals"
}

function run_command {
    # Run the command
    echo "---> '$@'"
    "$@"

    # Check the exit status
    local exit_status=$?
    if [ $exit_status -ne 0 ]; then
        echo "Error: Command failed with exit status $exit_status"
        exit $exit_status
    fi
}

set +e #otherwise the script will exit on error
function contains_element {
  local e match="$1"
  shift
  for e; do [[ "$e" == "$match" ]] && return 0; done
  return 1
}