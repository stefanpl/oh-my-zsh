# Push and pop directories on directory stack
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias -g _='sudo'
alias please='sudo'

#alias g='grep -in'

# Show history
if [ "$HIST_STAMPS" = "mm/dd/yyyy" ]
then
    alias history='fc -fl 1'
elif [ "$HIST_STAMPS" = "dd.mm.yyyy" ]
then
    alias history='fc -El 1'
elif [ "$HIST_STAMPS" = "yyyy-mm-dd" ]
then
    alias history='fc -il 1'
else
    alias history='fc -l 1'
fi
# List direcory contents
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lah'
alias la='ls -lAh'

alias afind='ack-grep -il'

#########################################
# Stefan's aliases
#########################################

alias wowscreen="sh ~/scripts/wowscreen.sh"
alias kp="keepass2 &"
alias mkd="makeDirectoryAndGoThere"
alias h="cd ~"
alias s="git status"
alias rma="sudo rm -Rfv"
alias keys="sudo subl /usr/share/X11/xkb/symbols/de"
alias tt="sh ~/scripts/toggleTouchpad.sh"
alias myip="ifconfig | egrep \"inet addr:[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+\" -o"
alias down="sudo shutdown -h now 'all the way down...'"
alias rebo="sudo shutdown -r now \"I'll be back!\""
alias off="sleep 1s; sh ~/scripts/toggleScreen.sh off"
alias vimrc="vim ~/.vimrc"
alias ..="cd .."
alias gl="git log --oneline -10 | cat"
alias ass="vim ~/.oh-my-zsh/lib/aliases.zsh; source ~/.oh-my-zsh/lib/aliases.zsh"
alias aliases="echo 'get some ass'"
alias aliases_private="vim ~/.bash_aliases_private ;source ~/.bash_aliases_private"
alias -g le="| less"
alias -g gr="| egrep -i"
alias zshrc="vim ~/.zshrc; source ~/.zshrc"
alias -g t="tree -L"
alias -g gir="egrep -ir"
alias git_boilerplate="sh ~/scripts/git_boilerplate.sh"
alias d="ls -alh | egrep '^d'"
alias co="git checkout"
alias cs="du -sh"
alias rmf="rm -Rf"
alias snippets="cd ~/.vim/bundle/snipmate.vim/snippets/"
alias inst="sudo apt-get install"
alias tmp="cd /tmp"
alias sshc="vim ~/.ssh/config"
alias sshs="cat ~/.ssh/config | egrep \"Host (.*)\" | sort"
alias e="exit"
alias ll="echo 'Save yourself a keystroke. Use \"l\" only :-)'"
alias c="cd"
alias b="cd -"
alias -g v="vim"
alias j="ls -alh | egrep -i"
alias r="ranger"
alias vn="vim /tmp/somevimfileforsumthin.txt"
alias -g a="alias gr ^"
alias -g onel="alias | egrep -i \"^[a-z]{1}=\""
alias -g twol="alias | egrep -i \"^[a-z]{2}=\""
alias -g threel="alias | egrep -i ^[a-z]{3}="
alias ext="cd /media/stefan"
alias des="cd ~/Desktop"
alias -g pv="> /tmp/tempfileToEditPipeStuffWithVim.txt; vim /tmp/tempfileToEditPipeStuffWithVim.txt"
alias note="vim ~/notes/newnote.txt"
alias wlanrestart="sudo service network-manager restart"
alias desk="cd ~/Desktop"
alias -g yy="| tr -d '\n' | xclip -selection c"
alias -g ya="| xclip -selection c"
alias gaa="git add --all"
alias gcm="git commit -m "
alias psr="sudo apt-cache search"
alias o="xdg-open"
alias pref="prefix_file"
alias rmf="rm -rf"
alias ndbg="node-debug --debug-brk"
alias pel="sudo tail -f /var/log/apache2/error.log"
alias lcf="lowercase_files"
alias ....="cd ../../../"
alias tp="htop"
alias hs="homestead"
alias wppw="cat wp-config.php gr \"DB_NAME|DB_USER|DB_PASSWORD|DB_HOST\""
alias t3pw="cat typo3conf/LocalConfiguration.php gr \"'password'|'database'|'username'|'host'\""
alias hst="sudo vim /etc/hosts"
alias .oh="cd $HOME/.oh-my-zsh"
alias cdb="create_utf8_database"
alias dbs="echo \"show databases\" > /tmp/mysqlcommand.sql && mysql -u root --password < /tmp/mysqlcommand.sql && rm /tmp/mysqlcommand.sql"
alias gsubs="git submodule update --init --recursive"
alias pip="curl -s https://api.ipify.org && echo ''"
alias .oh="cd $HOME/.oh-my-zsh"
alias dlwp="download_lastest_wordpress"
alias p="ping google.de"
alias -g ydl="youtube-dl -x --audio-format mp3 --no-playlist"
