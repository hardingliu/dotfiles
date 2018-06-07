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
SUCCESS IS NOT FINAL, FAILURE IS NOT FATAL. IT IS THE COURAGE TO CONTINUE THAT COUNTS.
EOF

} >&2
