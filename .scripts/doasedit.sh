#!/bin/bash

# This script is not provided with the assumption that it is absolutely secure - instead, its primary function is to give users the convenience of using their configuration for their editor while editing root-owned files
# Certain situations where security issues might arise, such as when copying a non-world-readable file to /tmp, are disallowed for this reason, but I can make no promises about the security of using this software
# If, on the other hand, you have a suggestion to improve the security of the script, please contact me at magnus@iastate.edu or on matrix @magnustesshu:matrix.org and tell me how to improve it

# Since I am lazy and am using this to write small scripts under /usr/local/bin sometimes, I also added a feature for myself to install with permissions already set if you are writing a new file and start it with a shebang.

EDITOR=${EDITOR:-vi}

ERR() {
    echo -e 'doasedit: '"$1";
    exit $2;
}

# Ensure this script is run as a user who has doas priviledges, editing a regular or nonexistent file
[[ "$(id -u)" == "0" ]] && ERR "Do not run doasedit as root!" 1
[[ "$(/sbin/doas -C /etc/doas.conf doasedit \"$1\")" == permit* ]] || ERR "You are not a doer" 2 # To allow doasedit, you must be allowed to run `doas doasedit`
[[ -d "$1" ]] && ERR "'$1' is a directory" 3; # File is a directory
[[ $# == "0" ]] && ERR 'usage:\n\tdoasedit /file/owned/by/root\n\tdoasedit /new/file\t(starting a new file with "#!" will make it executable)' 4 # Argument was passed

# In the positive case, the file exists, and we check that anyone can read it and that it is owned by root. In the negative case, the file does not exist
if [[ -e "$1" ]] ; then
    fileperms=$(stat -L -c "%a" "$1")
    anyreadperm=${fileperms:3:1} # With sticky bit
    [[ ${#fileperms} == "3" ]] && anyreadperm=${fileperms:2:1} # without sticky bit
    [[ $anyreadperm -ge "4" ]] || ERR "file '$1' is not world-readable (since security is hard, this is a sacrifice doasedit makes for ease of implementation)" 5
    [[ -r "$1" ]] || ERR "file '$1' is world-readable but is not readable by your user, what are you doing?" 6
    [[ "$(stat -L -c "%u" "$1")" == "0" ]] || ERR "Can only edit root-owned files with this script, as copying the file back will make root the owner" 7

    # Preserves file permissions, amazingly
    cp "$1" /tmp/doasediting || ERR "Cannot copy to /tmp/doasediting" 8
else
    # Default permissions are 644
    rm -f /tmp/doasediting || ERR "Cannot remove /tmp/doasediting" 9
    touch /tmp/doasediting || ERR "Cannot touch /tmp/doasediting" 10
fi

$EDITOR /tmp/doasediting || ERR "The editor failed to exit successfully" 11

# If the original file existed, don't update it if we did not make any modification to the temporary copy
[[ -e "$1" ]] && cmp -s /tmp/doasediting "$1" && exit 0
# If the original file did not exist, print a warning
[[ -e "$1" ]] || echo "doasedit: File '$1' will be created, if this is not desireable press ctrl+C"

doas cp /tmp/doasediting "$1" || ERR "You put your password in wrong. Manually run 'doas cp /tmp/doasediting $1'" 12

# Change permissions if the file was empty and starts with a shebang
[[ $fileperms != "" ]] || [[ `head -c 2 /tmp/doasediting` != "#!" ]] || { echo "doasedit: automatically running \`doas chmod +x '$1'\`" && doas chmod +x "$1" ; } || ERR "Cannot change permissions of '$1'" 13
