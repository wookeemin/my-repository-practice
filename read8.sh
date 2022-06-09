#!/bin/bash

let total=$1+$2

echo "Total is $total"

((total++))

echo "New value of total is $total"

expr $1 - $total
