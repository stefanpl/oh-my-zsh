#!/bin/bash

# Without sourcing the nvm script, there is no "node" available at the command line

function load_nvm() {
	if ! [ -x "$(command -v node)"  ]; then
		[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
		[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
	fi
}

