#!/bin/bash

usage()
{
cat << EOF
Usage: $(basename $0) -b border -c color imagename
   or  $(basename $0) -f frame  -m color imagename
.....................
.....................
EOF 
exit 1
}

while getopts "b:c:f:m" opt;do
	case $opt in
	b ) border="$OPTARG";          ;;
	c ) border="$OPTARG";          ;;
	f ) border="$OPTARG";          ;;
	m ) border="$OPTARG";          ;;
	? ) border="$OPTARG";          ;;
esac
done
shift $(($OPTIND - 1)) 

if [ $# -eq 0 ];then
	usage
fi

if [ ! -z "$border" ];then
	args="-bordercolor $bordercolor -border $border"
else
	args="-mattercolor $mattecolor -frame $frame"
fi

for name 
do
	suffix="$(echo $name | rev | cut -d .f1 | rev)"
	prefix="$(echo $name | rev | cut -d .f2- | rev)"
	newname="prefix+f."

