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
alias mkd="makeDirectoryAndGoThere"
alias h="cd $HOME/shortcuts"
alias s="git status"
alias rma="sudo rm -rfv"
alias keys="sudo subl /usr/share/x11/xkb/symbols/de"
alias tt="toggleTouchpad"
alias myip="ifconfig | egrep -i \"inet (addr|adresse):[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+\" -o"
alias dark="keep_screen_off"
alias vimrc="$EDITOR ~/.vimrc"
alias ..="cd .."
alias gl="git log --oneline -10 | cat"
alias glo="git log --oneline"
alias ass="$EDITOR ~/.oh-my-zsh/lib/aliases.zsh; source ~/.oh-my-zsh/lib/aliases.zsh"
alias aliases="echo 'get some ass'"
alias pra="$EDITOR ~/.oh-my-zsh/aliases_private.zsh ;source ~/.oh-my-zsh/aliases_private.zsh"
alias -g prad="~/.oh-my-zsh/aliases_private.zsh"
alias -g le="| less"
alias -g gr="| egrep -i"
alias zshrc="$EDITOR ~/.zshrc; source ~/.zshrc"
alias zshenv="$EDITOR ~/.zshenv; source ~/.zshenv"
alias tms="attachOrStartTmuxSession"
alias -g gir="egrep -ir"
alias git_boilerplate="sh ~/scripts/git_boilerplate.sh"
alias d="ls -alh | egrep '^d'"
alias co="git checkout"
alias cs="du -sh"
alias rmf="rm -rf"
alias inst="sudo apt-get install -y"
alias tmp="cd /tmp"
alias sshc="$EDITOR ~/.ssh/config"
alias sshs="cat ~/.ssh/config | egrep -i \"host (.*)\" | sort"
alias e="exit"
alias c="cd -P"
alias b="cd -"
alias -g v="vim"
alias j="ls -alh | egrep -i -e"
alias r="redshift -O"
alias vn="$EDITOR /tmp/somevimfileforsumthin.txt"
alias a="alias"
alias -g onel="alias | egrep -i \"^[a-z]{1}=\""
alias -g twol="alias | egrep -i \"^[a-z]{2}=\""
alias -g threel="alias | egrep -i ^[a-z]{3}="
alias ext="cd /media/stefan"
alias des="cd ~/desktop"
alias -g pv="> /tmp/tempfiletoeditpipestuffwithvim.txt; $EDITOR /tmp/tempfiletoeditpipestuffwithvim.txt"
alias note="$EDITOR ~/notes/newnote.txt"
alias wlanrestart="sudo service network-manager restart"
alias desk="cd ~/desktop"
alias -g yy="| tr -d '\n' | xclip -selection c"
alias -g ya="| xclip -selection c"
alias gd="git diff -- . ':(exclude)*package-lock.json'"
alias gdwp="git diff"
alias gaa="git add --all"
alias gcm="git commit -m "
alias gcmnv="git commit --no-verify -m "
alias psr="sudo apt-cache search"
alias o="openWithoutOutput"
alias pref="prefix_file"
alias rmf="rm -rf"
alias pel="sudo tail -f /var/log/apache2/error.log"
alias lcf="lowercase_files"
alias ....="cd ../../../"
alias tp="htop"
alias hs="homestead"
alias wppw="cat wp-config.php gr \"db_name|db_user|db_password|db_host\""
alias t3pw="cat typo3conf/localconfiguration.php gr \"'password'|'database'|'username'|'host'\""
alias hst="sudo $EDITOR /etc/hosts"
alias -g .oh="$HOME/.oh-my-zsh"
alias cdb="create_utf8_database"
alias dbs="echo \"show databases\" > /tmp/mysqlcommand.sql && mysql -u root --password < /tmp/mysqlcommand.sql && rm /tmp/mysqlcommand.sql"
alias gsubs="git submodule update --init --recursive"
alias dlwp="download_lastest_wordpress"
alias pig="ping google.de"
alias ydl="youtube-dl -x --audio-format mp3 --no-playlist"
alias k="sudo killall"
alias grubconfig="sudo $EDITOR /etc/default/grub && sudo update-grub"
alias update="sudo apt-get update -y && sudo apt-get upgrade -y"
alias dist-update="sudo apt-get update -y && sudo apt-get dist-upgrade -y"
alias w="command -v"
alias -g lcm="tail -n 2 ~/.zsh_history | head -n 1 | perl -p -e 's/^[0-9: ]*;//'"
alias -g h100="cat ~/.zsh_history | perl -p -e \"s/^[0-9: ]*;//\" | tail -n 100"
alias -g hall="cat ~/.zsh_history | perl -p -e \"s/^[0-9: ]*;//\" | uniq -u"
alias mouseoff='xinput set-prop "tpps/2 ibm trackpoint" "device enabled" 0 && xinput set-prop "pointer:lenovo thinkpad compact usb keyboard with trackpoint" "device enabled" 0'
alias mouseon='xinput set-prop "tpps/2 ibm trackpoint" "device enabled" 1 && xinput set-prop "pointer:lenovo thinkpad compact usb keyboard with trackpoint" "device enabled" 1'
alias on="mouseon"
alias hmax="hall"
alias -g npme='path=$(npm bin):$path'
alias list-printers="lpstat -p -d"
alias -g wcl="| wc -l"
alias escswap='/usr/bin/setxkbmap -option "caps:swapescape"'
alias cli_functions="echo type 'clis'"
alias -g ff="findFilesAndFolders"
alias fff="echo \"save a letter, type ff\""
alias psa="echo 'this is your public service announcement' && ps -aux | head -1 && ps -aux"
alias pubip="curl http://ipinfo.io/ip"
alias mylog="$HOME/documents/writing/mylog-$(date +%y)-$(date +%m)-$(date +%d)"
alias dot="cd ~/dotfiles"
alias cco="count_char_occurences"
alias con="ssh_auth_sock=0 ssh"
alias scr="cd $HOME/.oh-my-zsh/scripts"
alias par="php artisan"
alias parti="php artisan tinker"
alias ds="dirs -v"
alias pud="pushd"
alias pod="popd"
alias he="heroku"
alias about="cat /etc/*release 2>/dev/null"
alias memory-info="sudo dmidecode -t 17"
alias swap-used='free -m gr swap | perl -p -e "s/swap:[^0-9]+[0-9]+[^0-9]+([0-9]+).*/\$1/"'
alias rap="sudo service apache2 restart"
alias rng="sudo service nginx restart"
alias i3c="$EDITOR $HOME/.config/i3/config"
alias print-drucken="lpr"
alias idea="$EDITOR $HOME/documents/ideas.txt"
alias nr="npm run"
alias laralog="tailLaravelLog"
alias list-packages="aptitude search '~i!~m'"
alias sv="sudo service"
# curl head
alias ch="curl -IL"

# docker commands
alias doc="docker"
alias docip="docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}'"
alias docc="docker container"
alias dcl="docker container ls"
alias dclf="docker container ls --no-trunc"
alias dsl="docker service ls"
alias dslf="docker service ls --no-trunc"
alias docse="docker service"
alias dslogs="docker service logs --follow --timestamps"
alias dclogs="docker container logs --follow --timestamps"
alias docce="docker-compose exec"
alias dcid="docker_find_container_id"
alias dsid="docker_find_service_id"
alias docfi="docker_edit_container_file"
alias doce="docker_execute_interactive"
# docker restart service
alias docrs="docker_restart_service"

# perl filter
alias -g pf="| perl -pe"
alias tf="tail -f"
alias gcan="git commit --amend --no-edit"
alias wrs="watch_and_run_script"
alias wlr="wlanrestart"
alias list-global-node-modules="npm list -g --depth=0"
alias certinfo="showSslCertificateInformation"
alias timestamp="date +%s"
alias ts="timestamp"
alias -g ports="netstat -tulpn"
alias list-services="ls /etc/init.d"

# shortcuts
alias -g swf="$HOME/shortcuts/wf"
alias co="copyq clipboard"

alias grs="git reset HEAD"
alias cdbg="curl -b XDEBUG_SESSION=PHPSTORM"
alias installed-packages="sudo dpkg --get-selections | grep -v deinstall"
alias nrw="loadNvm && npm run watch"
alias nrs="loadNvm && npm run server-watch"
alias nrt="loadNvm && npm run test"
alias nrqt="loadNvm && npm run quick-test"
alias dush="du -sh"
alias wlan="o ~/secrets/wlan-wifi-zugangsdaten.pdf"
alias wifi="wlan"
alias gla="git log --oneline | cat"
alias hsts="sudo cat /etc/hosts"
alias filesizes="find . -maxdepth 1 -mindepth 1 -exec du -sh {} \;"
alias fz="filesizes"
alias lnv="loadNvm"
alias lnb="linkNodeBinary"
alias unb="unlinkNodeBinary"
alias gcrb="gitCopyRemoteBranchesToLocal"
alias update-npm="npm install -g npm@latest"
alias -g pics="$HOME/pictures"
alias tcaps="toggleCapslockBehavior"
alias adjust_number_of_workspaces="gsettings set org.mate.Marco.general num-workspaces"
alias gski="git stash --keep-index"
alias to="toggleCapslockBehavior && toggleTouchpad"
alias tconf='$EDITOR $HOME/.tmux.conf'
alias chx="chmod +x"
alias exs="doce server"
alias exw="doce workspace"
alias txc="$EDITOR ~/.tmux.conf && tmux source-file ~/.tmux.conf"
alias sni="${CODE_DIRECTORY}/snippets"
alias sniv="code ${CODE_DIRECTORY}/snippets"
alias vsni="sni && $EDITOR"
alias 101="${CODE_DIRECTORY}/webdev101"
alias 101v="code ${CODE_DIRECTORY}/webdev101"
alias v101="101 && $EDITOR"
alias pro="cd $HOME/projects"
alias sfs="seaf-cli status"
alias giti="${EDITOR} .gitignore"
alias cis="git clone https://github.com/stefanpl/install-scripts"
alias cbu="git clone https://github.com/stefanpl/bash-utils"
alias csni="git clone https://github.com/stefanpl/snippets"
alias logProcessOutput="sudo strace -e write=1,2 -p"
alias atc="cat ~/webdev/snippets/bash-aliases.sh | xclip -selection c"
alias vs="code ."
alias xr="xrandr"
alias chromeDidNotCrash="perl -pi -e 's/exit_type\":\"Crashed/exit_type\":\"none/' ~/.config/google-chrome/Default/Preferences"
alias nt="code ~/desktop/notes"
alias p="python3"
alias pp="pip3"
alias lnf="unb && lnv && lnb"
alias pmda="pm2 delete all"
alias pml="pm2 list"
alias rle="readlink -e"
alias launch-tmux-terminal='exportDbusVariables && terminator --title="tmux terminal" --profile="Tmux Forever"'
alias np="lnv && npm"
alias nx="lnv && npx"
alias t="tmux"
alias p2="lnv && pm2"
alias doco="docker-compose"
alias tls="tmux list-sessions"
alias ns="notify-send"
