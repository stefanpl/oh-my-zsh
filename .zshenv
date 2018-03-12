export ZSH_START_MILLISECONDS=$(($(date +%s%N)/1000000)) 
source ~/.oh-my-zsh/lib/aliases.zsh
source ~/.oh-my-zsh/.cli_functions
if [ -f ~/.oh-my-zsh/private_aliases.zsh ]; then
	source ~/.oh-my-zsh/private_aliases.zsh
fi
for file in ~/.oh-my-zsh/custom-bash-functions/*.sh; do 
    source $file
done
echo "executed once"