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
if [ "$hist_stamps" = "mm/dd/yyyy" ]; then
  alias history='fc -fl 1'
elif [ "$hist_stamps" = "dd.mm.yyyy" ]; then
  alias history='fc -el 1'
elif [ "$hist_stamps" = "yyyy-mm-dd" ]; then
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
alias myip="ifconfig | grep -i -E \"inet (addr|adresse)?:?[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+\" -o | perl -p -e 's/([a-zA-Z]+ )?//' | grep -v 127.0.0.1"
alias dark="keep_screen_off"
alias vimrc="${VISUAL} ~/.vimrc"
alias ..="cd .."
alias gl="git log --oneline -10 | cat"
alias glo="git log --oneline"
alias ass="${VISUAL_WAIT} ~/.oh-my-zsh/lib/aliases.zsh; source ~/.oh-my-zsh/lib/aliases.zsh"
alias aliases="echo 'get some ass'"
alias pra="${VISUAL_WAIT} ~/.oh-my-zsh/aliases_private.zsh ;source ~/.oh-my-zsh/aliases_private.zsh"
alias -g prad="~/.oh-my-zsh/aliases_private.zsh"
alias -g le="| less"
alias -g gr="| grep -i -E --color"
alias zshrc="${VISUAL} ~/.zshrc; source ~/.zshrc"
alias zshenv="${VISUAL} ~/.zshenv; source ~/.zshenv"
alias tms="attachOrStartTmuxSession"
alias -g gir="grep -ir -E"
alias git_boilerplate="sh ~/scripts/git_boilerplate.sh"
alias d="ls -alh | grep -E '^d'"
alias co="git checkout"
alias rmf="rm -rf"
alias inst="sudo apt-get install -y"
alias tmp="cd /tmp"
alias sshc="${VISUAL} ~/.ssh/config"
alias sshs="cat ~/.ssh/config | grep -i -E \"host (.*)\" | sort"
alias e="exit"
alias c="cd -P"
alias b="cd -"
alias -g v="vim"
alias j="ls -alh | grep -i -E"
alias r="redshift -O"
alias vn="${VISUAL} /tmp/somevimfileforsumthin.txt"
alias a="alias"
alias -g onel="alias | grep -i -E \"^[a-z]{1}=\""
alias -g twol="alias | grep -i -E \"^[a-z]{2}=\""
alias -g threel="alias | grep -i -E \"^[a-z]{3}=\""
alias ext="cd /media/stefan"
alias des="cd ~/desktop"
alias -g pv="> /tmp/tempfiletoeditpipestuffwithvim.txt; ${VISUAL} /tmp/tempfiletoeditpipestuffwithvim.txt"
alias note="${VISUAL} ~/notes/newnote.txt"
alias wlanrestart="sudo service network-manager restart"
alias desk="cd ~/desktop"
alias -g yy="| tr -d '\n' | $copyClipboardCmd"
alias -g ya="| $copyClipboardCmd"
alias gd="git diff ':(exclude)*__generated__/queryTypes.d.ts' ':(exclude)*package-lock.json'"
alias gdwp="git diff"
alias gaa="git add --all"
alias gcm="git commit --no-verify -m "
alias gcmwv="git commit -m "
alias psr="sudo apt-cache search"
alias o="open"
alias pref="prefix_file"
alias rmf="rm -rf"
alias pel="sudo tail -f /var/log/apache2/error.log"
alias ....="cd ../../../"
alias .....="cd ../../../../"
alias ......="cd ../../../../../"
alias tp="htop"
alias hs="homestead"
alias wppw="cat wp-config.php gr \"db_name|db_user|db_password|db_host\""
alias t3pw="cat typo3conf/localconfiguration.php gr \"'password'|'database'|'username'|'host'\""
alias hst="sudo bash -c '${VISUAL} /etc/hosts'"
alias -g .oh="$HOME/.oh-my-zsh"
alias cdb="create_utf8_database"
alias dbs="echo \"show databases\" > /tmp/mysqlcommand.sql && mysql -u root --password < /tmp/mysqlcommand.sql && rm /tmp/mysqlcommand.sql"
alias gsubs="git submodule update --init --recursive"
alias dlwp="download_lastest_wordpress"
alias pig="ping google.de"
alias youtube-dl="yt-dlp"
alias ydl="youtube-dl -x --audio-format mp3 --no-playlist"
alias k="sudo killall"
alias grubconfig="sudo ${VISUAL} /etc/default/grub && sudo update-grub"
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
alias pubip="curl https://ipinfo.io/ip"
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
alias i3c="${VISUAL} $HOME/.config/i3/config"
alias print-drucken="lpr"
alias idea="${VISUAL} $HOME/documents/ideas.txt"
alias nr="loadNvm && npm run"
alias ni="loadNvm && npm install"
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
alias dca="docker container ls -a"
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
alias doce="atc > /dev/null 2>&1 ; docker_execute_interactive"
alias dlf="docker logs -f"
# docker restart service
alias docrs="docker_restart_service"

# perl filter
alias -g pf="| perl -pe"
alias tf="tail -f"
alias gcan="git commit --amend --no-edit --no-verify"
alias wrs="watch_and_run_script"
alias wlr="wlanrestart"
alias list-global-node-modules="npm list -g --depth=0"
alias certinfo="showSslCertificateInformation"
alias timestamp="date +%s"
alias ts="timestamp"
alias list-services="ls /etc/init.d"

# shortcuts
alias -g swf="$HOME/shortcuts/wf"
alias co="copyq clipboard"

alias cdbg="curl -b XDEBUG_SESSION=PHPSTORM"
alias installed-packages="sudo dpkg --get-selections | grep -v deinstall"
alias nrw="loadNvm && npm run watch"
alias nrl="loadNvm && npm run lint"
alias nrs="loadNvm && npm run start"
alias nrt="loadNvm && npm run test"
alias nrqt="loadNvm && npm run quick-test"
alias dush="echo '(F)ile (S)ize'"
alias fs="du -sh"
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
alias tcaps="toggleCapslockBehavior"
alias adjust_number_of_workspaces="gsettings set org.mate.Marco.general num-workspaces"
alias gski="git stash --keep-index"
alias to="toggleCapslockBehavior && toggleTouchpad"
alias chx="chmod +x"
alias exs="doce server"
alias exw="doce workspace"
alias txc="${VISUAL} ~/.tmux.conf && tmux source-file ~/.tmux.conf"
alias sni="${CODE_DIRECTORY}/snippets"
alias sniv="${VISUAL} ${CODE_DIRECTORY}/snippets"
alias sni8="${VISUAL} ${NWON_SHELL_TOOLBOX_LOCATION}/utils/utf8CharacterList.txt"
alias snit="${VISUAL} ${CODE_DIRECTORY}/snippets/src/typescript-basics.ts"
alias snip="${VISUAL} ${CODE_DIRECTORY}/snippets/src/python-basics.py"
alias snipt="${VISUAL} ${CODE_DIRECTORY}/snippets/src/python-typing.py"
alias vsni="sni && ${VISUAL}"
alias 101="${CODE_DIRECTORY}/webdev101"
alias 101v="${VISUAL} ${CODE_DIRECTORY}/webdev101"
alias v101="101 && ${VISUAL}"
alias pro="cd $HOME/projects"
alias sfs="seaf-cli status"
alias giti="${VISUAL} .gitignore"
alias cis="git clone https://github.com/stefanpl/install-scripts"
alias cbu="git clone git@gitlab.com:nvon/nvon-tooling/nvon-shell-toolbox.git"
alias cty="git clone https://github.com/stefanpl/nodejs-typescript-starter"
alias csni="git clone https://github.com/stefanpl/snippets"
alias logProcessOutput="sudo strace -e write=1,2 -p"
alias vs="openInVsCode"
alias xr="xrandr"
alias chromeDidNotCrash="perl -pi -e 's/exit_type\":\"Crashed/exit_type\":\"none/' ~/.config/google-chrome/Default/Preferences"
alias p="ssh 440-hub p"
alias pp="pip3"
alias lnf="unb && lnv && lnb"
alias pmda="pm2 delete all"
alias pml="loadNvm && pm2 list"
alias rle="$readlinkCmd -e"
alias launch-tmux-terminal='exportDbusVariables && terminator --title="tmux terminal" --profile="Tmux Forever"'
alias np="lnv && npm"
alias npr="lnv && npm run"
alias nx="lnv && npx"
alias nd="lnv && node"
alias t="tmux"
alias p2="lnv && pm2"
alias doco="docker-compose"
alias docor="docker-compose restart"
alias dcfr="doco up -d --force-recreate"
alias tls="tmux list-sessions"
alias ns="notify-send"
alias gcmb="gitCheckoutLocalMatchingBranch"
alias gcl="git clone"
alias git-checkout-remote-to-local="git checkout -t"
alias gsp="git stash pop"
alias gst="git stash"
alias gstki="git stash --keep-index"
alias gstl="git stash list"
alias cte="crontab -e"
alias -g hlp="--help"
alias -g ver="--version"
alias nx="loadNvm && npx"
alias doma="docker-machine"
alias display-manager-restart="sudo systemctl restart display-manager"
alias vw="cd /var/www"
alias pubkey="cat ~/.ssh/id_rsa.pub ya"
alias grs="git reset --soft HEAD~1"
alias quo="echo '„“' yy && logSuccess 'Copied „quotes“ to clipboard!'"
alias nv="loadNvm && nvm"
alias hip="getHipsumText"
alias lowercaseFiles="rename 's/(.*)/\\L\$1/' *"
alias underscoreFiles="rename 's/ /_/' *"
alias gy="gatsby"
alias gpb="gitPushNewBranch"
alias gfa="git fetch --all"
alias tcp="tmux capture-pane -p >> /tmp/tmux-vim-buffer && v /tmp/tmux-vim-buffer"
alias u="copyUtf8Character"
alias gmm="git merge main"
alias gmd="git merge develop"
# NOT WORKING: alias gib="git checkout $1 && git pull && git checkout - && git merge $1 -m 'integrate latest changes from $1'"
alias startup-applications="cd /home/stefan/.config/autostart"
alias dockerFullStop="docker stop \$(docker container ls -q) 2>/dev/null; docker rm \$(docker container ls -aq) 2>/dev/null ; docker container ls -a"
alias avt="avaTestMatching"
alias gcs="git clone --depth 1"
alias tme="/usr/bin/time -f \"command took %e s to execute.\""
alias bi="brew install"
alias bic="brew install --cask"
alias bs="brew search | grep -i -e"
alias bsc="brew search --cask | grep -i -e"
alias wd="cd $CODE_DIRECTORY"
alias gtts="gtt start"
alias gttel="gtt edit \$(gtt log | tail -n 1 | perl -pe 's/ +([0-9a-z]+) +.*//i')"
alias zsh.env="${VISUAL} $ZSH/.env"
alias ghist='git log -p ":(exclude)*package-lock.json"'
alias basv="${VISUAL} ${NWON_SHELL_TOOLBOX_LOCATION}"
alias bas="cd ${NWON_SHELL_TOOLBOX_LOCATION}"
alias http-server-catchall='npx http-server --proxy "http://localhost:8080?"'
alias http-server='npx http-server -c-1'
alias lws='echo "[l]ocal [w]eb [s]erver starting 🚀"  && http-server'
alias gca="git commit --amend --no-verify"
alias gpnv="git push --no-verify"
alias fix-missing-xcrun="xcode-select --install"
alias random-api-address="echo 'https://swapi.dev/api/planets/1/'"
alias -g NV="--no-verify"
alias nrfc="npm run full-check"
alias nxa="npx ava"
alias lce="echo \\$?"
alias gcoF="git checkout --force"
alias -g FC="--force"
alias -g PP="| npx pino-pretty -t \"yyyy-mm-dd HH:MM:ss\""
alias gbs="git branch --sort=-committerdate"
alias cb="clipboard"
alias yn="yarn"
alias gma="git merge --abort"
alias gdc="git diff --cached ':(exclude)*package-lock.json'"
alias gbm="git branch -m"
alias ilb="npm install @nvon/baseline@latest"
alias iln="npm install @nvon/node-toolbox@latest"
alias ilr="npm install @nvon/react-toolbox@latest"
alias ilc="npm install @nvon/eslint-config@latest"
alias no-push="git remote set-url --push gitlab no-pushing-to-upstream-allowed"
alias gcol="git checkout \`gbs | grep -v -e \"^*\" | head -n1 \`"
alias gcom="git checkout main"
alias gcod="git checkout develop"
alias gcos="git checkout staging"
alias gpl="git pull"
alias git-push-to-new-gitlab="git push -u gitlab \`git branch --show-current\`"
alias gpgl="git-push-to-new-gitlab"
alias pt="poetry"
alias ptr="poetry run"
alias pts="poetry shell"
alias atc="cat ~/coding/snippets/src/bash-aliases.sh ya"

alias opy="alias py='python'"
if [ -z "${PYTHON_GLOBAL_PATH}" ]; then
  alias py="python"
else
  alias py="${PYTHON_GLOBAL_PATH}"
fi

alias da="django-admin"
alias pm="python manage.py"
