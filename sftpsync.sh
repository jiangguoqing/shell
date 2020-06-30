#!/bin/bash

timestamp=".timestamp"
tempfile="/tmp/sftpsunc.$$"
count=0

trap "$(which rm) -f $tempfile" 0 1 15

if [ $# -eq 0 ];then
	echo "Usage: $0 user@host { remotedir }" >&2
	exit 1
fi

user="$(echo $1 | cut -d@ -f1)"
server="$(echo $1 | cut -d@ -f2)"

if [ $# -gt 1 ];then
       echo "cd $2" >> $tempflie
fi

if [ ! -f $timestamp ] ; then
	for filename in *
	do
		if [ -f "$filename" ] ; then
			echo "put -P \"$filename\"" >> $tempfile
			count=$(( $count + 1))
		fi
	done
else
	for filename in $(find .-newer $timestamp -type f -print)
	do
		echo "put -P \"$filename\"" >>$tempfile
		count=$(( $count + 1))
	done
fi

		if
			[ $count -eq 0 ];then
			echo "$0:No files require uploading tp $server" >&2
			exit 1
		fi
		echo "quiet" >> $tempfile
		echo "Synchronizing: Found $count files in local folder to upload."

		if ! sftp -b $tempfile "$user@server"; then
			echo "Done. All files synchronized up with $server"
			touch $timestamp
		fi
		exit 0


