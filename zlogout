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

完璧な文章などといったものは存在しない。完璧な絶望が存在しないようにね。
EOF

} >&2
