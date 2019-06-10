#!/bin/bash
a=`echo "obase=2;$1"|bc`
b=$(($a%10))
echo "$b"

echo "exit,sb!"
