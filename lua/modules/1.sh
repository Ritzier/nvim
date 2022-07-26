#!/bin/bash

function import() {
    local file="./lib/${1}"
    if [ -f "${file}" ]; then
        # shellcheck disable=SC1090
        source "${file}"
    else
        echo "Error: Cannot find library at: ${file}"
        exit 1
    fi
}

# Usage: import "filename"
import "banners"
import "bp_crud"
# More lines ...
