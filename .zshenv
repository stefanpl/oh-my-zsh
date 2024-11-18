function sourceAliases() {
	source ~/.oh-my-zsh/lib/aliases.zsh
	if [ -f ~/.oh-my-zsh/aliases_private.zsh ]; then
		source ~/.oh-my-zsh/aliases_private.zsh
	fi
}

function sourceEnvFile() {
	if [ ! -f ~/.oh-my-zsh/.env ]; then
		cp ~/.oh-my-zsh/.env.example ~/.oh-my-zsh/.env
	fi
	source ~/.oh-my-zsh/.env
}

sourceEnvFile
sourceAliases
source ${NWON_SHELL_TOOLBOX_LOCATION}/bootstrap.sh

# --httptoolkit--
# This section will be reset each time a HTTP Toolkit terminal is opened
if [ -n "$HTTP_TOOLKIT_ACTIVE" ]; then
	# When HTTP Toolkit is active, we inject various overrides into PATH
	export PATH="/Applications/HTTP Toolkit.app/Contents/Resources/httptoolkit-server/overrides/path:$PATH"

	if command -v winpty >/dev/null 2>&1; then
		# Work around for winpty's hijacking of certain commands
		alias php=php
		alias node=node
	fi
fi
# --httptoolkit-end--

cargo_dir="$HOME/.cargo/env"
if [ -d $cargo_dir ]; then
	source $cargo_dir
fi
