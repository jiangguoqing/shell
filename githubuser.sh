#!/bin/bash

if [ $# -ne 1 ];then
	echo "Usage:$0 <username>"
	exit 1
fi

curl -s "https://api.github.com/user/$1"|\
	awk -F'""''
 	    /\"name\":/{
	    print $4"is the name of the Github user."
    }
    	    /\"followers\":/{
            splite($3,a,"")
	    sub(/,/"",a[2])
	    print "They have "a[2]" followers."
    }
    	    /\"following\":/{
              split($3,a,"")
	      sub(/,/,"",a[2])
	      print "They are following "a[2]" other users."
	    /\"created_at\":/{
              print "Their account was created on "$4"."

     }


exit 0
