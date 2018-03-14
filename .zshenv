export ZSH_START_MILLISECONDS=$(($(date +%s%N)/1000000)) 
source ~/.oh-my-zsh/lib/aliases.zsh
source ~/.oh-my-zsh/.cli_functions
if [ -f ~/.oh-my-zsh/aliases_private.zsh ]; then
	source ~/.oh-my-zsh/aliases_private.zsh
fi
for file in ~/.oh-my-zsh/custom-bash-functions/*.sh; do 
    source $file
done
