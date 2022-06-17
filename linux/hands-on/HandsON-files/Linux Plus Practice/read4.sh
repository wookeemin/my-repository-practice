#!/bin/bash

read -p "Enter your aritmetic operator: " OPERATOR
read -p "Enter your first number: " NUM1
read -p "Enter your second number: " NUM2

expr $NUM1 $OPERATOR  $NUM2
 
