test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

autoload -U colors && colors


#load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git*' formats "%{$fg[grey]%}%s %{$reset_color%}%r/%S%{$fg[grey]%} %{$fg[blue]%}%b%{$reset_color%}%m%u%c%{$reset_color%} "
 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST

#prompt color and settings
PROMPT='%F{141}%d$ %F{reset} ${vcs_info_msg_0} > '

#directory coloring
export CLICOLOR=1
export LSCOLORS=ExGxBxDxCxEgEdxbxgxcxd
alias ll="ls -alG"


autoload -Uz compinit && compinit
#case insensitive tab completion for directories
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'



# Added by Amplify CLI binary installer
export PATH="$HOME/.amplify/bin:$PATH"
