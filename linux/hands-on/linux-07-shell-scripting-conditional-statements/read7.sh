#!/bin/bash

read -p "Enter number1 : " NUM1 
read -p "Enter number2 : " NUM2

let total=$NUM1+$NUM2

echo "Total is $total"
((total++))

echo "New value of total is $total"

expr $NUM1 - $total



