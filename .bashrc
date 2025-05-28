#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '

# Set Prompt
PROMPT_COMMAND='PS1_CMD1=$(git branch --show-current 2>/dev/null)'; PS1='\[\e[91;1m\][\A]\[\e[0m\] \[\e[94;1m\]\u@\h\[\e[0m\] \[\e[1m\]»\[\e[0m\] \[\e[96;1m\]\W\[\e[0m\] [\[\e[38;5;213;1m\]${PS1_CMD1}*\[\e[0m\]]\[\e[1m\]\\$\[\e[0m\] '

# Set fuzzyfinder
export FZF_DEFAULT_COMMAND="fd . $HOME"
bind '"\C-f":"cd $(fd --type d --strip-cwd-prefix | fzf -i --style minimal) && tmux\n"'
# bind '"\C-f":"cd $(find ~ -type d -print | fzf -i --style minimal) && tmux\n"'

# Set scripts to path
export PATH="$PATH:/home/qu/.scripts"

# RubyGems Export Path
export GEM_HOME="$(gem env user_gemhome)"
export PATH="$PATH:$GEM_HOME/bin"

# RBenv initialization
eval "$(rbenv init -)"

# GitRepo Dotfiles Sync (Atlassian method)
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Repomanager
export PATH=$PATH:$HOME/Coding/repos/repo_manager/src
export PATH=$PATH:$HOME/scripts

# Replace choo-choo train alias so I can exit it with Ctrl+c
alias sl='sl -e'

