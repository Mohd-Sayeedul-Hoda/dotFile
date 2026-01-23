# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
#
export HISTFILESIZE=100000
export HISTSIZE=100000

eval "$(zoxide init zsh)"

# Example aliases
alias zshconfig="vi ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias vi="nvim"
alias clr="clear"
alias mk="mkdir"
alias tmx="tmux"
alias cd="z"
#alias tmux="TERM=screen-256color-bce tmux"
alias lg="lazygit"
alias gst="$HOME/.myScript/goto.sh"
alias gtt="$HOME/.myScript/newTmux.sh"
alias gs="source $HOME/.myScript/gotonotmux.sh"
alias gt="source $HOME/.myScript/newGoto.sh"
alias bt="$HOME/.myScript/brightness.sh"
alias bm="blueman-manager"
alias temp="$HOME/.myScript/temprature.sh"
alias wp="$HOME/.myScript/wallpaper.sh"
#alias sh="$HOME/.myScript/findHistory.sh"
alias sf="$HOME/.myScript/searchFile.sh"
alias obs="$HOME/.myScript/obs.sh"
alias chy="$HOME/.myScript/hyprConfigChange.py"
alias shh="history | fzy | sed 's/[0-9]\+ //g'"
alias awt="$HOME/.myScript/awt.sh"
alias swt="source $HOME/.myScript/swt.sh"
alias wab="$HOME/.myScript/createWorktree.sh"
alias wrb="$HOME/.myScript/removeWorktree.sh"
alias todo="$HOME/.dotfiles/myscript/.myScript/open_daily_todo.sh"
alias notes="$HOME/.dotfiles/myscript/.myScript/open_daily_notes.sh"

# alias ohmyzsh="mate ~/.oh-my-zsh"
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/aman/.local/bin
export PATH="$PATH:$(go env GOPATH)/bin"
export PATH=~/.npm-global/bin:$PATH 
export PATH=$PATH:/home/aman/bin
export PATH="$HOME/.govm/shim:$PATH"
export PATH=$PATH:/home/aman/.local/drivers

if [ -f "$HOME/.zsh_env_vars" ]; then
  source "$HOME/.zsh_env_vars"
fi

if [ -e /home/aman/.nix-profile/etc/profile.d/nix.sh ]; then . /home/aman/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

if [ -f '/home/aman/.local/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/home/aman/.local/bin/google-cloud-sdk/path.zsh.inc'; fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# opencode
export PATH=/home/aman/.opencode/bin:$PATH

# bun completions
[ -s "/home/aman/.bun/_bun" ] && source "/home/aman/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Generated for envman. Do not edit.
# [ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

