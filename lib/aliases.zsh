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
alias ll='ls -lh'
alias la='ls -lAh'

alias afind='ack-grep -il'

#########################################
# Stefan's aliases
#########################################

alias wowscreen="sh /home/stefan/scripts/wowscreen.sh"
alias kp="keepass2 &"
alias mkd="makeDirectoryAndGoThere"
alias h="cd ~/"
alias s="git status"
alias rma="sudo rm -Rfv"
alias keys="sudo subl /usr/share/X11/xkb/symbols/de"
alias tt="sh /home/stefan/scripts/toggleTouchpad.sh"
alias ip="ifconfig | egrep \"inet addr:192.168.[0-9]+.[0-9]+\" -o"
alias down="sudo shutdown -h now 'all the way down...'"
alias rebo="sudo shutdown -r now \"I'll be back!\""
alias off="sleep 1s; sh /home/stefan/scripts/toggleScreen.sh off"
alias vimrc="vim ~/.vimrc"
alias ..="cd .."
alias gl="git log --oneline -10 | cat"
alias ll="ls -aFl --block-size=K"
alias aliases="vim /home/stefan/.oh-my-zsh/lib/aliases.zsh; source ~/.oh-my-zsh/lib/aliases.zsh"
alias aliases_private="vim /home/stefan/.bash_aliases_private ;source /home/stefan/.bash_aliases_private"
alias -g le="| less"
alias -g gr="| grep -i"
alias zshrc="vim ~/.zshrc; source ~/.zshrc"


