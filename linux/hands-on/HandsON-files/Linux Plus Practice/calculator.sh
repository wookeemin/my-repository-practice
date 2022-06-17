#!/bin/bash
read -p "Input first number: " first_number
read -p "Input second number: " second_number

echo "SUM="`expr $first_number + 
$second_number`
echo "SUB="`expr $first_number - 
$second_number`
echo "MUL="`expr $first_number \* 
$second_number`
echo "DIV="`expr $first_number / 
$second_number`

let "sum = 3 + 5"
echo $sum

let sub=8-4
echo $sub



