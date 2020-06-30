#!/usr/bin

iam=$(id -un)
myhome="$(grep "^${iam}:" /etc/passwd | cut -d:-f6)"

if [ "$iam" != "guest "];then
	echo "Error:you really don't want to run fixguest on this account." >&2
	exit 1
fi

if [ ! -d $myhome/..template ];then
	echo "$0:no template directory found for rebuilding." >&2
	exit 1
fi

cd $myhome
rm -rf * $(find . -name ".[a-zA-X0-9]*" -print)

cp -Rp ..template/* .
exit 0

