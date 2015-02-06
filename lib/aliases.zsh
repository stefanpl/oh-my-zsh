# Push and pop directories on directory stack
alias pu='pushd'
alias po='popd'

# Basic directory operations
alias ...='cd ../..'
alias -- -='cd -'

# Super user
alias _='sudo'
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
alias h="cd ~/"
alias s="git status"
alias rma="sudo rm -Rfv"
alias keys="sudo subl /usr/share/X11/xkb/symbols/de"
alias tt="sh ~/scripts/toggleTouchpad.sh"
alias myip="ifconfig | egrep \"inet addr:192.168.[0-9]+.[0-9]+\" -o"
alias down="sudo shutdown -h now 'all the way down...'"
alias rebo="sudo shutdown -r now \"I'll be back!\""
alias off="sleep 1s; sh ~/scripts/toggleScreen.sh off"
alias vimrc="vim ~/.vimrc"
alias ..="cd .."
alias gl="git log --oneline -10 | cat"
alias aliases="vim ~/.oh-my-zsh/lib/aliases.zsh; source ~/.oh-my-zsh/lib/aliases.zsh"
alias aliases_private="vim ~/.bash_aliases_private ;source ~/.bash_aliases_private"
alias -g le="| less"
alias -g gr="| egrep -i"
alias zshrc="vim ~/.zshrc; source ~/.zshrc"
alias -g t="tree -L"
alias -g gir="grep -ir"
alias git_boilerplate="sh ~/scripts/git_boilerplate.sh"
alias f="ls -al | egrep -v '^d'"
alias d="ls -al | egrep '^d'"
alias co="git checkout"
alias cs="du -sh"
alias rmf="rm -Rf"
alias snippets="cd ~/.vim/bundle/snipmate.vim/snippets/"
alias inst="sudo apt-get install"
alias tmp="cd /tmp"
alias sshc="vim ~/.ssh/config"
alias sshs="cat ~/.ssh/config | egrep \"Host (.*)\" | tee ~/sshUserNames.txt"
