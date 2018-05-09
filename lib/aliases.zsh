# push and pop directories on directory stack
alias po='popd'

# basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# super user
alias -g _='sudo'
alias please='sudo'

#alias g='grep -in'

# show history
if [ "$hist_stamps" = "mm/dd/yyyy" ]
then
    alias history='fc -fl 1'
elif [ "$hist_stamps" = "dd.mm.yyyy" ]
then
    alias history='fc -el 1'
elif [ "$hist_stamps" = "yyyy-mm-dd" ]
then
    alias history='fc -il 1'
else
    alias history='fc -l 1'
fi
# list direcory contents
alias l='ls -lah'
alias ll='ls -lah'

alias afind='ack-grep -il'

#########################################
# stefan's aliases
#########################################

alias wowscreen="sh ~/.oh-my-zsh/scripts/wowscreen.sh"
alias kp="keepass2 &"
alias mkd="makedirectoryandgothere"
alias h="cd $HOME/shortcuts"
alias s="git status"
alias rma="sudo rm -rfv"
alias keys="sudo subl /usr/share/x11/xkb/symbols/de"
alias tt="toggle_touchpad"
alias myip="ifconfig | egrep -i \"inet (addr|adresse):[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+\" -o"
alias dark="keep_screen_off"
alias vimrc="vim ~/.vimrc"
alias ..="cd .."
alias gl="git log --oneline -10 | cat"
alias glo="git log --oneline"
alias ass="vim ~/.oh-my-zsh/lib/aliases.zsh; source ~/.oh-my-zsh/lib/aliases.zsh"
alias aliases="echo 'get some ass'"
alias aliases_private="vim ~/.oh-my-zsh/aliases_private.zsh ;source ~/.oh-my-zsh/aliases_private.zsh"
alias -g le="| less"
alias -g gr="| egrep -i"
alias zshrc="vim ~/.zshrc; source ~/.zshrc"
alias zshenv="vim ~/.zshenv; source ~/.zshenv"
alias t="tree -l"
alias -g gir="egrep -ir"
alias git_boilerplate="sh ~/scripts/git_boilerplate.sh"
alias d="ls -alh | egrep '^d'"
alias co="git checkout"
alias cs="du -sh"
alias rmf="rm -rf"
alias snippets="cd ~/.vim/bundle/snipmate.vim/snippets/"
alias inst="sudo apt-get install -y"
alias tmp="cd /tmp"
alias sshc="vim ~/.ssh/config"
alias sshs="cat ~/.ssh/config | egrep -i \"host (.*)\" | sort"
alias e="exit"
alias c="cd"
alias b="cd -"
alias -g v="vim"
alias j="ls -alh | egrep -i -e"
alias r="ranger"
alias vn="vim /tmp/somevimfileforsumthin.txt"
alias -g a="alias"
alias -g onel="alias | egrep -i \"^[a-z]{1}=\""
alias -g twol="alias | egrep -i \"^[a-z]{2}=\""
alias -g threel="alias | egrep -i ^[a-z]{3}="
alias ext="cd /media/stefan"
alias des="cd ~/desktop"
alias -g pv="> /tmp/tempfiletoeditpipestuffwithvim.txt; vim /tmp/tempfiletoeditpipestuffwithvim.txt"
alias note="vim ~/notes/newnote.txt"
alias wlanrestart="sudo service network-manager restart"
alias desk="cd ~/desktop"
alias -g yy="| tr -d '\n' | xclip -selection c"
alias -g ya="| xclip -selection c"
alias gaa="git add --all"
alias gcm="git commit -m "
alias psr="sudo apt-cache search"
alias o="open_in_background"
alias pref="prefix_file"
alias rmf="rm -rf"
alias ndbg="node-debug --debug-brk"
alias pel="sudo tail -f /var/log/apache2/error.log"
alias lcf="lowercase_files"
alias ....="cd ../../../"
alias tp="htop"
alias hs="homestead"
alias wppw="cat wp-config.php gr \"db_name|db_user|db_password|db_host\""
alias t3pw="cat typo3conf/localconfiguration.php gr \"'password'|'database'|'username'|'host'\""
alias hst="sudo vim /etc/hosts"
alias -g .oh="$HOME/.oh-my-zsh"
alias cdb="create_utf8_database"
alias dbs="echo \"show databases\" > /tmp/mysqlcommand.sql && mysql -u root --password < /tmp/mysqlcommand.sql && rm /tmp/mysqlcommand.sql"
alias gsubs="git submodule update --init --recursive"
alias dlwp="download_lastest_wordpress"
alias p="ping google.de"
alias -g ydl="youtube-dl -x --audio-format mp3 --no-playlist"
alias k="sudo killall"
alias grubconfig="sudo vim /etc/default/grub && sudo update-grub"
alias update="sudo apt-get update -y && sudo apt-get upgrade -y"
alias dist-update="sudo apt-get update -y && sudo apt-get dist-upgrade -y"
alias -g w="which"
alias -g lcm="tail -n 2 ~/.zsh_history | head -n 1 | perl -p -e 's/^[0-9: ]*;//'"
alias -g h100="cat ~/.zsh_history | perl -p -e \"s/^[0-9: ]*;//\" | tail -n 100"
alias -g hall="cat ~/.zsh_history | perl -p -e \"s/^[0-9: ]*;//\" | sort | uniq -u"
alias mouseoff='xinput set-prop "tpps/2 ibm trackpoint" "device enabled" 0 && xinput set-prop "pointer:lenovo thinkpad compact usb keyboard with trackpoint" "device enabled" 0'
alias mouseon='xinput set-prop "tpps/2 ibm trackpoint" "device enabled" 1 && xinput set-prop "pointer:lenovo thinkpad compact usb keyboard with trackpoint" "device enabled" 1'
alias on="mouseon"
alias hmax="hall"
alias -g npme='path=$(npm bin):$path'
alias list-printers="lpstat -p -d"
alias -g wcl="| wc -l"
alias escswap='/usr/bin/setxkbmap -option "caps:swapescape"'
alias cli_functions="echo type 'clis'"
alias -g ff="find_files_and_folders"
alias fff="echo \"save a letter, type ff\""
alias psa="echo 'this is your public service announcement' && ps -aux | head -1 && ps -aux"
alias pubip="wget http://ipinfo.io/ip -qo -"
alias mylog="vim $HOME/documents/writing/mylog-$(date +%y)-$(date +%m)-$(date +%d)"
alias dot="cd ~/dotfiles"
alias cco="count_char_occurences"
alias con="ssh_auth_sock=0 ssh"
alias dot="cd $HOME/dotfiles"
alias scr="cd $HOME/.oh-my-zsh/scripts"
alias par="php artisan"
alias parti="php artisan tinker"
alias vup="pushd $HOME/webdev/devserver-xenial-vagrant && vagrant up && popd"
alias vhalt="pushd $HOME/webdev/devserver-xenial-vagrant && vagrant halt && popd"
alias ds="dirs -v"
alias pud="pushd"
alias pod="popd"
alias he="heroku"
alias about="cat /etc/*release 2>/dev/null"
alias memory-info="sudo dmidecode -t 17"
alias swap-used='free -m gr swap | perl -p -e "s/swap:[^0-9]+[0-9]+[^0-9]+([0-9]+).*/\$1/"'
alias rap="sudo service apache2 restart"
alias rng="sudo service nginx restart"
alias i3c="vim $HOME/.config/i3/config"
alias print-drucken="lpr"
alias idea="vim $HOME/documents/ideas.txt"
alias nr="npm run"
alias laralog="tail -f storage/logs/laravel-$(date +%y)-$(date +%m)-$(date +%d).log"
alias dns="sudo vim /etc/networkmanager/dnsmasq.d/local"
alias list-packages="aptitude search '~i!~m'"
alias sv="sudo service"
# curl head
alias ch="curl -il"

# docker commands
alias doc="docker"
alias docips='docker inspect -f "{{.name}} - {{range .networksettings.networks}}{{.ipaddress}}{{end}}" $(docker ps -q) gr -e "- [0-9.]+$"'
alias docc="docker container"
alias docce="docker-compose exec"
alias docid="docker_find_container_id"
alias docfi="docker_edit_container_file"
alias docb="docker_interactive_bash"

# perl filter
alias -g pf="| perl -pe"
alias tf="tail -f"
alias gcan="git commit --amend --no-edit"
alias wrs="watch_and_run_script"
alias wlr="wlanrestart"
alias list-global-node-modules="npm --version > /dev/null && ls -lh \`npm root -g\`"
alias certinfo="show_ssl_certificate_information"
alias timestamp="date +%s"
alias ts="timestamp"
alias -g ports="netstat -tulpn"
alias list-services="ls /etc/init.d"
alias -g cbf="$HOME/.oh-my-zsh/custom-bash-functions"

# shortcuts
alias -g swf="$HOME/shortcuts/wf"
alias co="copyq clipboard"

alias grs="git reset HEAD"
alias cdbg="curl -b XDEBUG_SESSION=PHPSTORM"
alias installed-packages="sudo dpkg --get-selections | grep -v deinstall"
alias nrw="npm run watch"
alias nrt="npm run test"
