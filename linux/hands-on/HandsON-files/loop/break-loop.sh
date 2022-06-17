#!/bin/bash

number=1

until [[ $number -gt 10  ]]
do
	echo $number
	((number++))
	if [[ $number -eq 10  ]]
	then
		break
	fi
done

