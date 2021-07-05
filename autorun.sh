#!/bin/bash

function run {
    if ! pgrep -f $1 ;
    then
        $@&
    fi
}

run /usr/bin/imwheel
run ~/bin/enable_mic
