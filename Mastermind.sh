#!/bin/bash
at='@'
has='#'
str='*'
amp='&'
per='%'
dol='$'
###definition of the symbols
echo "======================================================================"
echo "======================================================================"
echo "|                      Welcome To Mastermind                         |"
echo "|    To Play, You Must Guess The Sequence of 4 Special Characters    |"
echo "|                  They Could Be $at, $has, $str, $amp, $per, or $dol                 |"
echo "|   If You Guess A Character In The Right Place, an 'X' will appear  |"
echo "|   If You Guess A Character In The Wrong Place, a  'O' will appear  |"
echo "|                     You Will Have 10 Tries                         |"
echo "======================================================================"
echo "======================================================================"
###welcome display
array=( "$has" "$per" "$dol" "$str" "$amp" "$at"  )
###array with all 6
rand0=$RANDOM
rand0=$[ $rand0 % 6 ]
rand1=$RANDOM
rand1=$[ $rand1 % 6 ]
rand2=$RANDOM
rand2=$[ $rand2 % 6 ]
rand3=$RANDOM
rand3=$[ $rand3 % 6 ]
r0=${array[$rand0]}
r1=${array[$rand1]}
r2=${array[$rand2]}
r3=${array[$rand3]}
###randomized array
mastermind=( "$r0" "$r1" "$r2" "$r3" )
#10 tries
count=10

###input of user
declare -a userarray
### run until 10 tries are up
while [ $count -gt  0 ] ; do
###initialization of different variables
numcorrect=0
###when X needed (correct spot)
c=0
issomewhere=0
###when O needed (incorrect spot)
i=0
j=0
n=0
w=0
x=0
y=0
z=0
n0=0
n1=0
n2=0
n3=0
spot0=false
spot1=false
spot2=false
spot3=false
###spots are when a match has been made
inp0=0
inp1=0
inp2=0
inp3=0
###inp's are when a user entered character has been used in a match
symbolarray=( "_" "_" "_" "_" )
###default when guesses are wrong

###if you want to see what the actual sequence is (for testing) echo "${mastermind[*]}" 
	echo "Please type  your guess and press enter (4 Space Separated Characters)"
	echo "Guesses Remaining: $count"
	echo -n  "Type Your Guess: " 
	read in0 in1 in2 in3
###takes user enterred and puts it in an array
	userarray[0]="$in0"
	userarray[1]="$in1"
	userarray[2]="$in2"
	userarray[3]="$in3"

((count--))

###if all in correct spot
if [ "${userarray[0]}" == "${mastermind[0]}" ] ; then
((numcorrect++))
fi
if [ "${userarray[1]}" == "${mastermind[1]}" ] ; then
((numcorrect++))
fi
if [ "${userarray[2]}" == "${mastermind[2]}" ] ; then
((numcorrect++))
fi
if [ "${userarray[3]}" == "${mastermind[3]}" ] ; then
((numcorrect++))
fi

###This for loop checks whether a spot has been filled and whether a user input was used. If not either, an "O" will result
	for(( c = 0 ; c < 4 ; c++ ))
do
y='inp'
r=${y}${c}
	if [ "${userarray[$c]}" == "${mastermind[0]}" ] ; then
		if [ "$spot0" == false ] ; then
			if [ "${!r}"  =  "0" ] ; then
				r=1
				((issomewhere++))
				spot0=true
			fi
		fi
	fi
	if [ "${userarray[$c]}" == "${mastermind[1]}" ] ; then
		if [ "$spot1" == false ] ; then
			if [ "${!r}" = "0" ] ; then
				r=1
				((issomewhere++))
				spot1=true

			fi
		fi
	fi
	if [ "${userarray[$c]}" == "${mastermind[2]}" ] ; then
		if [ "$spot2" == false ] ; then
			if [ "${!r}"  =  "0" ] ; then
				r=1
				((issomewhere++))
				spot2=true

			fi
		fi
	fi
	if [ "${userarray[$c]}" == "${mastermind[3]}" ] ; then
		if [ "$spot3" == false ] ; then
			if [ "${!r}" = "0" ] ; then
				r=1
				((issomewhere++))
				spot3=true

			fi
		fi
	fi
done



## Here, O's are written to the output array
for(( i = 0 ; i < $issomewhere ; i++))
do

	symbolarray[$i]="O"
done
issomewhere=0

##X's overwrite when correct place
for(( j = 0 ; j < $numcorrect  ; j++))
do

	symbolarray[$j]="X"
done




	
echo -e "Your Guess:    ${userarray[@]}"
echo -e "How You Fared: ${symbolarray[@]}"

echo "----------------------------------------------------------------------"
###Game ends before 10 tries if all are correct guesses
if [ $numcorrect = 4 ] ; then
break
fi
done
if [ $numcorrect = 4 ] ; then
echo "======================================================================"
echo "======================================================================"
echo "Congratulations, You Are A Mastermind!"
echo "The Correct Sequence Was Indeed" "${mastermind[*]}"
echo "======================================================================"
echo "======================================================================"

fi

if [ $count = 0 ] ; then
echo "======================================================================"
echo "======================================================================"

echo "Sorry, You Are Not A Mastermind"
echo "The Correct Sequence Was:" "${mastermind[*]}"

echo "======================================================================"
echo "======================================================================"

fi
