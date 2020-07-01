#!/bin/bash
#重指定文件播放幻灯片
#使用ImageMagic的显示工具

delay=2
psize="1200x900>"

#如果传入参数为0,
if [ $# -eq 0 ] ; then
	echo "Usage: $(basename $0) watch-directory" >&2
	exit 1
fi
'''
$# 是传给脚本的参数个数
$0 是脚本本身的名字
$1 是传递给该shell脚本的第一个参数
$@ 是传给脚本的所有参数的列表
$* 是以一个单字符串显示所有向脚本传递的参数，与位置变量不同，参数可超过9个
$$ 是脚本运行的当前进程ID号
$? 是显示最后命令的退出状态，0表示没有错误，其他表示有错误
'''
watch="$1"

if [ ！-d "$watch" ] ; then #-d filename 判断文件是否为目录。 
	echo "$(basename $0):Specified directory $watch isn't a directory." >&2
	exit 1
fi

cd "watch"

if [ $? -ne 0 ] ; then#通过命令判断cd是否成功。
	echo "$(basename &0): Faild trying to cd into$watch" >&2
	exit 1
fi
#通过一系列的管道，仅仅保留文件的后缀名。
suffices="$(file * | grep image | cut -d: -f1 | rev | cut -d. -f1 | \
	rev | sort | uniq | sed 's/^/\*./')"

if [ -z "$suffixes" ] ; then #-z选项如果长度为0则为真。
	echo "$(basename $0): No images to display in folder $watch" >&2
	exit 1
fi

/bin/echo -n "Displaying $(ls $suffixes | wc -l) images from $watch "
set -f; echo "with suffixes $suffixes" ; set +f                         #set -f 取消使用通佩符。

display -loop 0 -delay $delay -resize $psize - backdrop $suffixes

exit 0

