fpath=(
  $HOME/.zprompts
  /usr/local/share/zsh-completions
  /usr/local/share/zsh/site-functions
  $fpath
)

autoload -Uz compinit promptinit
_comp_files=(${ZDOTDIR:-$HOME}/.zcompdump(Nm-20))
if (( $#_comp_files )); then
  compinit -i -C
  promptinit
else
  compinit -i
  promptinit
fi
unset _comp_files

prompt harding

#
# Options
#
setopt COMPLETE_ALIASES
setopt AUTO_MENU
setopt AUTO_CD              # Auto changes to a directory without typing cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt MULTIOS              # Write to multiple descriptors.
setopt EXTENDED_GLOB        # Use extended globbing syntax.
unsetopt CLOBBER            # Do not overwrite existing files with > and >>.
                            # Use >! and >>! to bypass.

#
# Aliases
#

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

zmodload zsh/terminfo
zmodload zsh/complist

bindkey -e
bindkey -M menuselect '^[[Z' reverse-menu-complete

zstyle ':completion:*' menu select
zstyle ':completion:*' rehash true
zstyle ':completion:*' matcher-list 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion::complete:*' gain-privileges 1
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path "${ZDOTDIR:-$HOME}/.zcompcache"

eval $(gdircolors $HOME/.dir_colors)
alias ls="gls --color --group-directories-first"
alias rm="rm -i"

disable -r time

# For zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(brackets pattern cursor root line)
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=black,bg=red')
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=green,underline'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=green,bold'
ZSH_HIGHLIGHT_STYLES[path]=''
ZSH_HIGHLIGHT_STYLES[comment]='fg=white,bold'
