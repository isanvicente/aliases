# dir listing
alias lh='ls -lh'
alias lt='ls -lhrt'

#ssh and sftp to old machines 
alias sshkex='ssh -oKexAlgorithms=+diffie-hellman-group1-sha1'
alias sftpkex='sftp -oKexAlgorithms=+diffie-hellman-group1-sha1'

#colored top
alias top='top -c'

# interativ gpu monitoring
alias nvidia-watch='watch -n1 nvidia-smi'

# google cloud ssh connection
alias gcloudssh='gcloud compute ssh --ssh-flag='-ServerAliveInterval=240''

# interactive file tail - useful to check logs for running processes.
alias itail='tail -f -n1' 

# alias for emacs org-mode (inaki 2014/03/24)
alias emacsorg='emacs -f org-mode'

# alias for mercurial pull and update (inaki 2014/06/04)
alias hgpup='hg pull && hg update'

# screen creation with custom colored prompt
## screen creation, output is redirected to custom file in "$HOME/.screenlogs/" dir

new-screen(){
    screen -c "$HOME/.screenrc-detaching" -S "$1"  #Start detached screen session
    #screen -S "$1" -X logdir ~/.screenlogs #Use logfile command to set logging file
    screen -S "$1" -X logfile "$HOME/.screenlogs/screenlog-%S.%n" #Use logfile command to set logging file
    screen -S "$1" -X log     #Use log command to start logging
    #screen -r "$1"
}

## if we are in a screen change prompt to show session name.
case "$TERM" in
    screen*)
	color_prompt=yes;
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\](${STY#[0-9]*.})\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
    ;;    
esac

