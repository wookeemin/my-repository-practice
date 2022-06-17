#!bin/bash

total=0

for number in {1..100}
do
	echo "$number"
	total=$(($total+$number))
	echo "subtotal is $total"
done
echo "total is $total"

