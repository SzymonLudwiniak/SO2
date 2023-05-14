#!/bin/bash -eu


echo "-----------------------------------------"
echo "--                                     --"
echo "--             access_log              --"
echo "--                                     --"
echo "-----------------------------------------"

# first we grep ip addresses from file, then we take only unique occurencies and then print first 10 lines
grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" ./data/access_log | sort --unique | head -10

echo "-----------------------------------------"
echo "--                                     --"
echo "-----------------------------------------"

# #find every line with word "DELETE", then pick unique occurencies
grep "DELETE" ./data/access_log | sort --unique

echo "-----------------------------------------"
echo "--                                     --"
echo "-----------------------------------------"

# #find every line that starts with this ip address
grep "^64.242.88.10 " ./data/access_log 

echo "-----------------------------------------"
echo "--                                     --"
echo "-----------------------------------------"

# #find every line that contains word 'denied between two slashes, there can be other letters between slashes and 'denied'
grep -E "\/.*denied.*\/" ./data/access_log


echo "-----------------------------------------"
echo "--                                     --"
echo "--             yolo.csv                --"
echo "--                                     --"
echo "-----------------------------------------"


#find lines that start with number that ends with odd digit, then redirect stdout to stderr
grep -E "^[0-9]*[13579]," ./data/yolo.csv 1>&2

echo "-----------------------------------------"
echo "--                                     --"
echo "-----------------------------------------"

#find lines that contain $2.99/$5.99/$9.99 followed by M or B, then using cut, display third and seventh field in every row
grep -E '\$[259].99[BM]' ./data/yolo.csv | cut --delimiter=, -f 3,7

echo "-----------------------------------------"
echo "--                                     --"
echo "-----------------------------------------"