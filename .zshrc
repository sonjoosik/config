if [ "$TMUX" = "" ]; then 
  exec tmux new-session -A
  set-option destroy-unattached; 
fi

#if [ -z "$TMUX" ]; then
#  exec tmux new-session -A -s workspace
#fi



# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#====================================
#             zsh
#====================================
export ZSH="$HOME/.oh-my-zsh"

ZSH_DISABLE_COMPFIX="true"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git 
    zsh-syntax-highlighting
    zsh-autosuggestions
    fzf
    fasd
    asdf
    tmux
)


source $ZSH/oh-my-zsh.sh

#====================================
#              aliases
#====================================
alias ls='ls -G'
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias ta='tmux attach -t '
alias dev='cd $HOME/Desktop/GitHub'
alias config="git --git-dir=$HOME/.config.repo/ --work-tree=$HOME"


#===================================
#             start
#===================================

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

fpath=(~/.zsh/completions $fpath)
autoload -U compinit && compinit

export FZF_DEFAULT_COMMAND="find . -maxdepth 1 | sed 's/^..//'"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
