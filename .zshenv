export ZSH_START_MILLISECONDS=$(($(date +%s%N)/1000000)) 
source ~/.oh-my-zsh/lib/aliases.zsh
if [ -f ~/.oh-my-zsh/aliases_private.zsh ]; then
	source ~/.oh-my-zsh/aliases_private.zsh
fi

if [ ! -f ~/.oh-my-zsh/.env ]; then
	cp ~/.oh-my-zsh/.env.example ~/.oh-my-zsh/.env
fi

source ~/.oh-my-zsh/.env

function loadBashUtils() {
	if [ -d ${BASH_UTILS_LOCATION} ]; then
		for file in ${BASH_UTILS_LOCATION}/**/*.sh; do 
			source $file
		done
		for file in ${BASH_UTILS_LOCATION}/*.sh; do 
			source $file
		done
	else
		echo "No bash utils could be found at ${BASH_UTILS_LOCATION}. Please adjust the value of BASH_UTILS_LOCATION in your .env file or clone the bash utils repo." > /dev/stderr
	fi
}

if [ -z "$BASH_UTILS_LOCATION"  ]; then
	echo "No value found for BASH_UTILS_LOCATION. Please set it in your .env file." > /dev/stderr
else
	loadBashUtils
fi


