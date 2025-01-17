#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Set Dolphin File Explorer as main explorer
export "GTK_USE_PORTAL=1"

# Set Prompt Color and Style
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[91;1m\][\A]\[\e[0m\] \[\e[94;1m\]\u@\h\[\e[0m\] \[\e[1m\]»\[\e[0m\] \[\e[96;1m\]\W\[\e[0m\] [\[\e[38;5;213;1m\]${PS1_CMD1}*\[\e[0m\]]\[\e[1m\]\\$\[\e[0m\] '

# McGill Mimi Login
alias mimimcgill='ssh -i ~/.ssh/mcgill_mimi qhuang3@mimi.cs.mcgill.ca'

# GitRepo Dotfiles Sync (Atlassian method)
alias sconf='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
