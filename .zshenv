source ~/.oh-my-zsh/lib/aliases.zsh
source ~/.oh-my-zsh/secrets
source ~/.oh-my-zsh/.cli_functions
if [ -f ~/.bash_aliases_private ]; then
	source ~/.bash_aliases_private
fi
fpath=( ~/.oh-my-zsh/functions "${fpath[@]}"  )
autoload -Uz slack_me
autoload -Uz create_utf8_database
