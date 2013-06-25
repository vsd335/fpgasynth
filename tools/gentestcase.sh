#!/bin/bash

varnames=(dataa datab expected)

function geninit {
	i=$1
	file=$2
	j=$(($i-1))
	cut -d " " -f $i $file | ./float2int | ./verinit.py ${varnames[$j]}
}

function repeat {
	n=$1
	str=$2
	i=0
	while [ $i -lt $n ]; do
		echo $str
		i=$(($i+1))
	done
}

for i in {1..3}
do
	n=$(wc -l $1 | cut -d " " -f 1)
	paste -d " " <(geninit $i $1) <(repeat $n "//") <(cut -d " " -f $i $1)
done
