source ~/.oh-my-zsh/lib/aliases.zsh
secretsfile=~/.oh-my-zsh/secrets
touch $secretsfile && source $secretsfile
source ~/.oh-my-zsh/.cli_functions
if [ -f ~/.bash_aliases_private ]; then
	source ~/.bash_aliases_private
fi
source ~/.oh-my-zsh/custom-bash-functions/*.sh
fpath=( ~/.oh-my-zsh/functions "${fpath[@]}"  )
autoload -Uz slack_me
autoload -Uz create_utf8_database
autoload -Uz watch_and_run_script
autoload -Uz docker_find_container_id
