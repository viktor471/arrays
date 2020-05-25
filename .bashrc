#
# ~/.bashrc
#
[[ $- != *i* ]] && return

colors() {
	local fgc bgc vals seq0

	printf "Color escapes are %s\n" '\e[${value};...;${value}m'
	printf "Values 30..37 are \e[33mforeground colors\e[m\n"
	printf "Values 40..47 are \e[43mbackground colors\e[m\n"
	printf "Value  1 gives a  \e[1mbold-faced look\e[m\n\n"

	# foreground colors
	for fgc in {30..37}; do
		# background colors
		for bgc in {40..47}; do
			fgc=${fgc#37} # white
			bgc=${bgc#40} # black

			vals="${fgc:+$fgc;}${bgc}"
			vals=${vals%%;}

			seq0="${vals:+\e[${vals}m}"
			printf "  %-9s" "${seq0:-(default)}"
			printf " ${seq0}TEXT\e[m"
			printf " \e[${vals:+${vals+$vals;}}1mBOLD\e[m"
		done
		echo; echo
	done
}

[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

# Change the window title of X terminals
case ${TERM} in
	xterm*|rxvt*|Eterm*|aterm|kterm|gnome*|interix|konsole*)
		PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\007"'
		;;
	screen*)
		PROMPT_COMMAND='echo -ne "\033_${USER}@${HOSTNAME%%.*}:${PWD/#$HOME/\~}\033\\"'
		;;
esac

use_color=true

# Set colorful PS1 only on colorful terminals.
# dircolors --print-database uses its own built-in database
# instead of using /etc/DIR_COLORS.  Try to use the external file
# first to take advantage of user additions.  Use internal bash
# globbing instead of external grep binary.
safe_term=${TERM//[^[:alnum:]]/?}   # sanitize TERM
match_lhs=""
[[ -f ~/.dir_colors   ]] && match_lhs="${match_lhs}$(<~/.dir_colors)"
[[ -f /etc/DIR_COLORS ]] && match_lhs="${match_lhs}$(</etc/DIR_COLORS)"
[[ -z ${match_lhs}    ]] \
	&& type -P dircolors >/dev/null \
	&& match_lhs=$(dircolors --print-database)
[[ $'\n'${match_lhs} == *$'\n'"TERM "${safe_term}* ]] && use_color=true

if ${use_color} ; then
	# Enable colors for ls, etc.  Prefer ~/.dir_colors #64489
	if type -P dircolors >/dev/null ; then
		if [[ -f ~/.dir_colors ]] ; then
			eval $(dircolors -b ~/.dir_colors)
		elif [[ -f /etc/DIR_COLORS ]] ; then
			eval $(dircolors -b /etc/DIR_COLORS)
		fi
	fi

	if [[ ${EUID} == 0 ]] ; then
		PS1='\[\033[01;31m\][\h\[\033[01;36m\] \W\[\033[01;31m\]]\$\[\033[00m\] '
	else
		PS1='\[\033[01;32m\][\u@\h\[\033[01;37m\] \W\[\033[01;32m\]]\$\[\033[00m\] '
	fi

	alias ls='ls --color=auto'
	alias grep='grep --colour=auto'
	alias egrep='egrep --colour=auto'
	alias fgrep='fgrep --colour=auto'
else
	if [[ ${EUID} == 0 ]] ; then
		# show root@ when we don't have colors
		PS1='\u@\h \W \$ '
	else
		PS1='\u@\h \w \$ '
	fi
fi

unset use_color safe_term match_lhs sh
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less

xhost +local:root > /dev/null 2>&1

complete -cf sudo

# Bash won't get SIGWINCH if another process is in the foreground.
# Enable checkwinsize so that bash will check the terminal size when
# it regains control.  #65623
# http://cnswww.cns.cwru.edu/~chet/bash/FAQ (E11)
shopt -s checkwinsize

shopt -s expand_aliases

# export QT_SELECT=4

# Enable history appending instead of overwriting.  #139609
shopt -s histappend

#
# # ex - archive extractor
complete -cf sudo
# # usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

#CONFIGURES

export LESS=eFRX
export PATH=$PATH:/home/viktor/gscripts:/data/data/com.termux/files/home/gscripts:/home/viktor/scripts
EDITOR=vim; export EDITOR
#xmodmap .xmodmap
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi
if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
    GIT_PROMPT_ONLY_IN_REPO=1
    source $HOME/.bash-git-prompt/gitprompt.sh
fi

#AlIASES
alias gitalv='git alv'
alias pwrf=poweroff
alias rbt=reboot
alias txt='cd ~/texts'
alias gitt='cd ~/test/git'
alias edital='vim ~/.bashrc'
alias bashrc='vim ~/.bashrc'
alias tmuxc='vim ~/.tmux.conf'
alias diar='cd ~/texts/diary'
alias giti='vim ~/.gitignore'
alias gita='vim ~/.gitattributes'
alias gitc='vim ~/.gitconfig'
alias bkcp=bckp
alias bkcpo=bckpo
alias apend=append
alias la="ls -a"
alias lal="ls -al"
alias work="cd /home/viktor/work"
alias gitalv='git alv'
alias pwrf=poweroff
alias rbt=reboot
alias txt='cd ~/texts'
alias gitt='cd ~/git'
alias edital='vim ~/.bashrc'
alias diar='cd ~/texts/diary'
alias adh='git add ~/gscripts ~/scripts ~/texts     .gitignore .gitconfig .vimrc .bashrc .gitattributes      && git commit -vm "$(date)" && git push'
alias buytd="vim ~/texts/diary/records/buytd"
alias rec="cd ~/texts/diary/records"
alias solv="cd ~/texts/diary/solves"
alias diary="cd ~/texts/diary/diay"
alias comt="cat ~/texts/diary/records/commtolearn"
alias eexpr="vim ~/texts/diary/records/eexpr"
alias tolrn="vim ~/texts/diary/records/tolearn"
alias cor="vim ~/texts/diary/records/correct"
alias idea="vim ~/texts/diary/records/idea"
alias src="vim ~/texts/diary/records/sources"
alias p=git_prompt_toggle
alias gitd='git commit -m "$(date)"'
alias prj="cd ~/prj"
alias prg="cd ~/prg"
alias consp="cd ~/texts/diary/conspect"
alias con="ssh viktor@192.168.1.65"
alias tmc="vim ~/.tmux.conf"
alias vimrc="vim ~/.vimrc"
alias adh='git add ~/gscripts ~/scripts ~/texts && git commit -v && git push origin home'
alias vimc="vim ~/texts/diary/conspect/vim"
alias cgit="vim ~/texts/giary/conspect/git"
alias virmc="vimrc"
xcape -e 'Alt_R=KP_Enter'
alias sl="ls"
alias mkd "mkdir d"
