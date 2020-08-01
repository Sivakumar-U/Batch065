#!/bin/bash -x

member=1

declare -A birthDictionary

getBirthYear () {
	echo $(( RANDOM%2+92 ))
}

getBirthMonth () {
	echo $(( RANDOM%12+1 ))
}

storeInDictionary () {
	birthMonth=$1;
	birthYear=$2;
	member=$3
	value="$birthMonth-$birthYear-member:-$member"
	birthDictionary[$birthMonth]="${birthDictionary[$birthMonth]} $value"
}

printBirthMonth () {
	for (( i=1; i<=12; i++ ))
	do
		echo ${birthDictionary[$i]}
	done
}

birthMonthMain () {
	while [ $member -ne 50 ]
	do
		birthYear=$(getBirthYear)
		birthMonth=$(getBirthMonth)
		storeInDictionary $birthMonth $birthYear $member
		(( member++ ))
	done
	printBirthMonth
}

birthMonthMain

