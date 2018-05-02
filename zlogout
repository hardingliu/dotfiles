#
# Executes commands at logout.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Execute code only if STDERR is bound to a TTY.
[[ -o INTERACTIVE && -t 2 ]] && {

# Print the message.
lolcat <<-EOF
So we beat on, boats against the current, borne back ceaselessly into the past.
EOF

} >&2
