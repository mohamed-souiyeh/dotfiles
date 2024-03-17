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

#Star Ship
# eval "$(starship init zsh)"

# DEFAULTS
export ARCHFLAGS="-arch x86_64"
export EDITOR='nvim'


# ALIASES
# alias cat='bat --paging=never --theme="base16"'
# alias ll='n -Hde'
alias ssh='TERM="xterm-256color" ssh'


# function backup --argument filename
#     cp $filename $filename.bak
# end
#
# # Copy DIR1 DIR2
# function copy
#     set count (count $argv | tr -d \n)
#     if test "$count" = 2; and test -d "$argv[1]"
# 	set from (echo $argv[1] | string trim --right --chars=/)
# 	set to (echo $argv[2])
#         command cp -r $from $to
#     else
#         command cp $argv
#     end
# end
#
# # Cleanup local orphaned packages
# function cleanup
#     while pacman -Qdtq
#         sudo pacman -R (pacman -Qdtq)
#     end
# end

## Useful aliases

# Replace ls with eza
alias ls='eza -al --color=always --group-directories-first --icons' # preferred listing
alias la='eza -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='eza -l --color=always --group-directories-first --icons'  # long format
alias lt='eza -aT --color=always --group-directories-first --icons' # tree listing
alias l.='eza -ald --color=always --group-directories-first --icons .*' # show only dotfiles

# Replace some more things with better alternatives
alias cat='bat --style header --style snip --style changes --style header'


# Common use
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias big='expac -H M "%m\t%n" | sort -h | nl'     # Sort installed packages according to size in MB (expac must be installed)
alias dir='dir --color=auto'
alias fixpacman='sudo rm /var/lib/pacman/db.lck'
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l' # List amount of -git packages
alias grep='ugrep --color=auto'
alias egrep='ugrep -E --color=auto'
alias fgrep='ugrep -F --color=auto'
alias grubup='sudo update-grub'
alias hw='hwinfo --short'                          # Hardware Info
alias ip='ip -color'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias rmpkg='sudo pacman -Rdd'
alias tarnow='tar -acf '
alias untar='tar -zxvf '
alias upd='/usr/bin/garuda-update'
alias vdir='vdir --color=auto'
alias wget='wget -c '

# Get fastest mirrors
alias mirror='sudo reflector -f 30 -l 30 --number 10 --verbose --save /etc/pacman.d/mirrorlist'
alias mirrora='sudo reflector --latest 50 --number 20 --sort age --save /etc/pacman.d/mirrorlist'
alias mirrord='sudo reflector --latest 50 --number 20 --sort delay --save /etc/pacman.d/mirrorlist'
alias mirrors='sudo reflector --latest 50 --number 20 --sort score --save /etc/pacman.d/mirrorlist'

# Help people new to Arch
alias apt='man pacman'
alias apt-get='man pacman'
alias please='sudo'
alias tb='nc termbin.com 9999'
alias helpme='echo "To print basic information about a command use tldr <command>"'
alias pacdiff='sudo -H DIFFPROG=meld pacdiff'

# Get the error messages from journalctl
alias jctl='journalctl -p 3 -xb'

# Recent installed packages
alias rip='expac --timefmt="%Y-%m-%d %T" "%l\t%n %v" | sort | tail -200 | nl'

## Run fastfetch if session is interactive
# if [[ -t 1 ]] && command -v fastfetch >/dev/null 2>&1; then
#   # fastfetch --load-config neofetch
#   fastfetch
# fi

# The next line sources a private environment file if it exists
if [ -f "$HOME/.zsh_public" ]; then . "$HOME/.zsh_public"; fi
if [ -f "$HOME/.zsh_private" ]; then . "$HOME/.zsh_private"; fi

# TODO : cleanup scripting below

# ITERM (MACOS ONLY)
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

test -e /usr/share/nvm/init-nvm.sh && source /usr/share/nvm/init-nvm.sh

[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"

