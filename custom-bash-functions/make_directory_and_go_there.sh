#!/bin/bash

###
#
# Create a directory and cd into it.
# @param $1 – the directory to be created
#
###
function make_directory_and_go_there() {
	mkdir $1 && cd $_
}
