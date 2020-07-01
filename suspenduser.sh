#/bin/bash
homedir="/home"
secs=10

if [ -z $1];then
	echo "Usage: $0 account" >&2
	exit 1
elif [ "$(id -un)" != "root"];then
	echo "Error,You must be 'root' to run this ommand.">&2
	exit 1
fi

echo "Please change the password for account $1 to something new."
passwd $1

if who|grep "$1" > /dev/null;then
	for tty in $(who | grep $1 | awk '{print $2}'); do
		cat << "EOF" > /dev/$tty
***************************



***************************

EOF
done
echo "(Warned $1,now sleeping $secs seconds)"

sleep $secs
jobs=(ps -u $1|cut -d\ -f1)

kill -s HUP $jobs
sleep 1
kill -s KILL $jobs > /dev/null 2>1

echo "$1 was logged in.Just logged them out."

chmod "Account $1 has been suspend."

exit 0
