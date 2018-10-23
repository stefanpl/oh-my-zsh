export ZSH_START_MILLISECONDS=$(($(date +%s%N)/1000000)) 
source ~/.oh-my-zsh/lib/aliases.zsh
if [ -f ~/.oh-my-zsh/aliases_private.zsh ]; then
	source ~/.oh-my-zsh/aliases_private.zsh
fi

bashUtilsDirectory=~/webdev/bash-utils/utils
if [ -d ${bashUtilsDirectory} ]; then
	for file in ${bashUtilsDirectory}/**/*.sh; do 
		source $file
	done
	for file in ${bashUtilsDirectory}/*.sh; do 
		source $file
	done
fi
