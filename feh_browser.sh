#!/bin/bash

###########################################################################################################
# Pulled from the Arch wiki. All credit goes to the good folks over there. Script is essentially a better #
# feh browser. I added the -d option to display the filename. 						  #
###########################################################################################################
shopt -s nullglob

if [[ ! -f $1 ]]; then
	echo "$0: first argument is not a file" >&2
	exit 1
fi

file=$(basename -- "$1")
dir=$(dirname -- "$1")
arr=()
shift

cd -- "$dir"

for i in *; do
	[[ -f $i ]] || continue
	arr+=("$i")
	[[ $i == $file ]] && c=$((${#arr[@]} - 1))
done

exec feh "$@" -d -- "${arr[@]:c}" "${arr[@]:0:c}"
