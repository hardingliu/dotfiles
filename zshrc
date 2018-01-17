#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
# alias mvim='/Applications/MacVim.app/Contents/bin/mvim'
alias pip='pip2'
alias ls='ls --group-directories-first --color=auto --classify'

# Load pip completion
if (( $#commands[(i)pip(|[23])] )); then
  cache_file="${TMPDIR:-/tmp}/prezto-python-cache.$UID.zsh"

  # Detect and use one available from among 'pip', 'pip2', 'pip3' variants
  pip_command="$commands[(i)pip(|[23])]"

  if [[ "$pip_command" -nt "$cache_file" || ! -s "$cache_file" ]]; then
    # pip is slow; cache its output. And also support 'pip2', 'pip3' variants
    $pip_command completion --zsh \
      | sed -e "s|compctl -K [-_[:alnum:]]* pip|& pip2 pip3|" >! "$cache_file" 2> /dev/null
  fi

  source "$cache_file"
  unset cache_file pip_command
fi

# Display dots when waiting for tab completion
expand-or-complete-with-dots() {
echo -n "..."
zle expand-or-complete
zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

# Config for zsh-syntax-highlighting
#
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor root line)
# ZSH_HIGHLIGHT_PATTERNS+=('rm -rf *' 'fg=white,bold,bg=red')
