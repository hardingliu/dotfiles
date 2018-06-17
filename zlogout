#
# Executes commands at logout.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Execute code only if STDERR is bound to a TTY.
[[ -o INTERACTIVE && -t 2 ]] && {

# Print the message.
lolcat<<-EOF

少抽烟，多喝水
EOF
} >&2
