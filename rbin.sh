#!/bin/bash

# *******************************************************************************
#  Author  : Jacob Choi
#  Date    : 2/12/25
#  Description: A lightweight and simple Bash-based recycle bin tool that safely manages file deletion in a Linux environment. Made for Systems Programming.
# ******************************************************************************

function usage {
    cat << EOF
Usage: rbin.sh [-hlp] [list of files]
   -h: Display this help;
   -l: List files in the recycle bin;
   -p: Empty all files in the recycle bin;
   [list of files] with no other flags,
        these files will be moved to the
        recycle bin.
EOF
}
hread=0
lread=0
pread=0
while getopts ":hlp" options; do
case "${options}" in
    h) hread=$(($hread+1))
        ;;
    l) lread=$(($lread+1))
        ;;
    p) pread=$(($pread+1))
        ;;
    *) echo "Error: Unknown option '-$OPTARG'." >&2
        usage
        exit 1
        ;;
esac
done
sum=$(($hread+$lread))
sum=$(($sum+$pread))
if [[ $sum -gt 1 ]]; then
    echo "Error: Too many options enabled." >&2
    usage
    exit 1
fi

# readonly recycle_path="/home/$user/.recycle"
readonly recycle_path="/home/$(whoami)/.recycle"
mkdir -p "$recycle_path"

if [[ $hread = 1 ]]; then
    usage
elif [[ $lread = 1 ]]; then
    ls -lAF "$recycle_path"
elif [[ $pread = 1 ]]; then
    rm -r "$recycle_path"
elif [[ $# = 0 ]]; then
    usage
else
    # read input
    for file in "$@"; do
        if [[ -f $file || -d $file ]]; then
            mv "$file" "$recycle_path"
            echo "File: $file"
        else echo "Warning: '$file' not found." >&2
        fi
    done
fi

