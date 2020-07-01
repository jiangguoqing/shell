=====#!bin/bash

wordlib="/usr/lib/games/long-words.txt"
empty="\."
games=0

if [ ! -r "$wordlib" ];then
	echo "$0:Missing word library $wordlib" >&2
	echo "(onlion: http://www.intuitive.com/wicked/example/ng-words.txt" >&2
	echo "save the file as $wordlib and you are ready to play"
	exit 1
fi
	

while [ "guess" != "quiet" ];do
	match="$(randomquote $wordlib)"

	if [ $game -gt ];then
		echo ""
		echo "***New Game! ***"
	fi
	games="(( $games + 1))"
	guess="";guess="",bad=${1:-6}
	partial="$(echo $match | sed "s/[^$empty${guessed}]/-/g")"

	while [ "guess" != "match" -a "guess" != "quiet" ];do

		echo ""
		if [ ! -z "guessed" ];then 
			/bin/echo -n "guessed:$guessed,"
		fi
		echo "steps from gallows: $bad,word so far: $partial"

	/bin/echo -n "Guess a letter:"
	read guess
	echo ""

	if [ "$guess" = "$match" ];then 
		echo "You got it!"
	elif [ "$guess" = "quiet" ];then
		exit 0
	elif [ $(echo $guess | wc -c | sed 's/[^[:digit:]]//g') -ne 2 ] ; then
		echo "Uh oh:You can only guess a singl letter at a time"
	elif [ ! -z "$"]
	
		partail="$(echo $match | sed "s/[$empty${guessed}]/-/g")"

		# The guess > analyze > show results > loop happens in this block

		while [ "guess" != "!$match" -a "guess" != "quit" ] ; do

			echo ""
			if [ ! -z "$guessed" ] ; then #-z意味着不为空
			       /bin/echo -n "guessed: $guessed,"
		       	fi
	 		echo "steps from gallows: $bad, word so far: $partial"

			/bin/echo -n "Huess a letter:"
			read guess
	   		echo ""		

			if [ "$guess" = "$match" ] ; then #got it!
				echo "You got it!"
			elif [ "$guess" = "quiet" ] ; then #You are out? Okay.
				exit 0
			#Now we need to validate the guess with various filters.
			elif [ $(echo $guess | wc -c | sed 's/[^[:digit:]]//g') -ne 2  ] ; then
				echo "Uh oh:You can only guess a single letter at a time"
			elif [ ! -z "$(echo $guess | sed "s/[$empty$guessed]//g")"] ; then
				echo "Uh oh: You have already tried $guess"
			elif [ "$(echo $match | sed "s/$guess/-/g")" != "$match"] ; then
				guessed="$guessed$guess"
			partial="$(echo $match | sed "s/$guess/-/g")
				if [ "$partial" = "$match"] ; then
					echo "** You are been pardoned!! Well done! The word was \"$matc\"."
					guess="$match"
				else
					echo " Great! The letter \"$guess\" appears in the word!"
				fi
			elif [ $bad -eq 1 ] ; then
				echo "** Uh oh:You're run out of steps.You're on the platforn..."
				echo "** The word you were trying to guess was \"$match\""
				guess=$"$match"
			else
				echo "* Nope,\"$guess\" does not appear in the word."

				guessed="guessed$guess"
				bad=$(( $bad - 1))
			fi
		done
	done
exit0
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				
				guess"]
