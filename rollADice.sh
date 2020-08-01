#!/bin/bash -x

declare -A dictionary

minimum=11
maximum=1

getDieNumber () {
	randomValue=$(( RANDOM%6+1 ))
	storeInDictionary $randomValue
}

storeInDictionary () {
	value=$1
	dictionary[$value]=$(( ${dictionary[$value]} + 1 ))
}

getMinimumMaximum () {

	for (( i=1; i<=${#dictionary[@]}; i++ ))
	do
		if [ ${dictionary[$i]} -lt $minimum ]
		then
			minimum=${dictionary[$i]}
			minKey=$i
		fi

		 if [ ${dictionary[$i]} -gt $maximum ]
                then
                        maximum=${dictionary[$i]}
                        maxKey=$i
                fi
	done
}

rollDieMain () {
	while [[ ${dictionary[1]} -ne 10 && ${dictionary[2]} -ne 10 && ${dictionary[3]} -ne 10 && ${dictionary[4]} -ne 10 && ${dictionary[5]} -ne 10 ]]
	do
		getDieNumber
	done

	getMinimumMaximum
}
rollDieMain

echo "All keys in dictionary : " ${!dictionary[@]}
echo "All Elements in dictionary :" ${dictionary[@]}
echo "Minimum value :" $minKey
echo "Maximum value : " $maxKey
