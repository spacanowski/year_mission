#!/bin/bash

re='^[0-9]+([.][0-9]+)?$'
if ! [[ $1 =~ $re ]] ; then
	echo "Wrong argument"
	exit -1
fi

day=$(date +%j)
year=$(date +%Y)

echo "debt:"
echo "scale=2; (($year/365)*$day)-$1" | bc -l

echo 'km left to goal:'
echo "scale=2; ($year-$1)" | bc -l

echo "needs km per day:"
echo "scale=2; ($year-$1)/(365-$day)" | bc -l
