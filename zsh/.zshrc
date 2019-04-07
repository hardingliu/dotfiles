# Harding's zshrc

# set the fpath
fpath=(
  $HOME/.zsh/prompts
  /usr/local/share/zsh-completions
  $fpath
)

# load completion
autoload -Uz compinit && compinit -C

# load prompt
autoload -Uz promptinit && promptinit && prompt harding

# load mods
zmodload zsh/terminfo
zmodload zsh/complist

#
# options
#
setopt AUTO_CD              # Auto changes to a directory without typing cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt AUTO_MENU            # Show completion menu on a successive tab press.
setopt AUTO_LIST            # Automatically list choices on ambiguous completion.
setopt AUTO_PARAM_SLASH     # If completed parameter is a directory, add a trailing slash.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt MULTIOS              # Write to multiple descriptors.
setopt NOCLOBBER            # Do not overwrite existing files with > and >>. Use >! and >>! to bypass.
setopt COMPLETE_IN_WORD     # Complete from both ends of a word.
setopt ALWAYS_TO_END        # Move cursor to the end of a completed word.
setopt PATH_DIRS            # Perform path search even on command names with slashes.
setopt EXTENDED_GLOB        # Needed for file modification glob modifiers with compinit
setopt INTERACTIVE_COMMENTS # Make comments colorful
setopt COMPLETE_ALIASES     # Complete aliases
unsetopt MENU_COMPLETE      # Do not autoselect the first completion entry.
unsetopt FLOW_CONTROL       # Disable start/stop characters in shell editor.

#
# aliases
#
alias ls="ls -FG"
alias rm="rm -i"
alias grep="grep --colour=auto"
alias df="df -H"
alias du="du -h"
alias d="dirs -v"
alias type="type -a"
alias mvim="/Applications/MacVim.app/Contents/bin/mvim"

# use emacs key bindings
bindkey -e
# use tab-shift to traverse the completion menu reversely
bindkey -M menuselect '^[[Z' reverse-menu-complete

# zstyles
zstyle ':completion:*' rehash true
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${HOME}/.cache/zsh"
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:matches' group 'yes'
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:descriptions' format ' %F{cyan}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' format ' %F{cyan}-- %d --%f'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true

# pip zsh completion start
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip pip2 pip3
# pip zsh completion end

# for zsh-syntax-highlighting
if [[ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets pattern cursor root line)
  ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=black,bg=red')
  ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=cyan,underline'
  ZSH_HIGHLIGHT_STYLES[precommand]='fg=cyan,underline'
  ZSH_HIGHLIGHT_STYLES[arg0]='fg=cyan'
  ZSH_HIGHLIGHT_STYLES[rc-quote]='fg=green'
  ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=green'
  ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=green'
  ZSH_HIGHLIGHT_STYLES[back-dollar-quoted-argument]='fg=green'
fi
