#!/bin/bash

# Aliases and functions prefixed with `prlvm.` will be detected as a new command.

# Get ipv4 address
alias prlvm.ip='prlctl exec ${uuid} ifconfig eth0 | egrep -o "([0-9]{1,3}\.){3}[0-9]{1,3}" | sed -n 1p'
# Get ipv6 address
alias prlvm.ip6='prlctl exec ${uuid} ifconfig eth0 | egrep -o "([[:xdigit:]]{0,4}[:]){7}[[:xdigit:]]{0,4}" | sed -n 1p'
# Get MAC address
alias prlvm.mac='prlctl exec ${uuid} ifconfig eth0 | egrep -o "([[:xdigit:]]{2}[:]){5}[[:xdigit:]]{2}"'
# Get UUID
alias prlvm.uuid='echo ${uuid}'
# ssh into a vm by calling another alias. Prefix with username if different from
# OSX account. example: 'ssh user@`prlvm.ip`'
alias prlvm.ssh='ssh `prlvm.ip`'
# Dumps info
alias prlvm.info='prlctl list -i ${uuid}'

#
# Example function
# 
# Positional parameters can be accessed with the standard $1, $2, etc. and $@
# Position starts after search, e.g., `prlvm foo <search> $1 $2`
# 
# Other available variables:
#   $basecmd             - The parent command or 'prlvm'
#   $cmd                 - Name of the command or 'foo' in this case.
#   $search              - The original search term used.
#   $args                - The original arguments passed to $basecmd.
#   $name                - Name of the target VM.
#   $uuid                - Universal identifier for the VM.
#   $stat                - Running status
#   $it                  - Positional index for the current VM target.
#   $vmListSearchResults - Indexed array of search results containing UUIDs
#   $vmListNames         - Indexed array of available VM names.
#   $vmListUUIDs         - Indexed array of available VM UUIDs.
#   $vmListStats         - Indexed array of available VM running status.
#   $cmds                - Array of available commands. Includes $acmds, $fcmds
#                          and most of the internal prlctl built-in commands.
#   $acmds               - Array of aliased commands.
#   $fcmds               - Array of functions used as commands.
#
function prlvm.foo {
  echo Called with \`$basecmd $args\`
  echo "  Matched Name: `styleLabel "$name" $stat`"
  echo "  Matched UUID: $uuid"
}
