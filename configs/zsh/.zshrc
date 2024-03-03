# PYENV
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export PYENV_SHIMS=$(pyenv root)/shims
export PYENV_ROOT="$HOME/.pyenv"
export PYENV_PATH="$PYENV_ROOT/bin"

# DOTFILES
export DOTFILES_PATH="$HOME/.dotfiles/configs/bin/.local/bin"

# PATH
export PATH="$PYENV_SHIMS:$PYENV_PATH:$DOTFILES_PATH:/usr/local/sbin:$PATH"
export PATH="$HOME/.local/bin:/usr/local/sbin:$PATH"

# OH-MY-ZSH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git zsh-autosuggestions zsh-completions zsh-syntax-highlighting zsh-z)

source $ZSH/oh-my-zsh.sh

# DEFAULTS
export ARCHFLAGS="-arch x86_64"
export EDITOR='nvim'


# ALIASES
alias cat='bat --paging=never --theme="base16"'
alias ll='n -Hde'
alias ssh='TERM="xterm-256color" ssh'

# The next line sources a private environment file if it exists
if [ -f "$HOME/.zsh_public" ]; then . "$HOME/.zsh_public"; fi
if [ -f "$HOME/.zsh_private" ]; then . "$HOME/.zsh_private"; fi

# TODO : cleanup scripting below

# ITERM (MACOS ONLY)
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

test -e /usr/share/nvm/init-nvm.sh && source /usr/share/nvm/init-nvm.sh

[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

