export ZSH_START_MILLISECONDS=$(($(date +%s%N)/1000000)) 

export EDITOR=vim

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
source ${BASH_UTILS_LOCATION}/bootstrap.sh

