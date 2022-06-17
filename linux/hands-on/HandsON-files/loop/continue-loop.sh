#!/bin/bash 

number=0
until [[ $number -lt 0  ]] #until 1 (true), if not continue
do
	((number++))
	tens=$(($number % 10))
	if [[ $tens -eq 0  ]]
	then
		continue
	fi
	echo $number
	if [[ $number -gt 16  ]]
	then
		break
	fi
done



