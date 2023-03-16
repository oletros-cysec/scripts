#!/bin/bash

grey="\\e[1;90m"
red="\\e[1;91m"
green="\\e[1;92m"
orange="\\e[1;93m"
blue="\\e[1;94m"
purple="\\e[1;95m"
cyan="\\e[1;96m"
white="\\e[1;97m"
end="\\e[0;0m"

rndstr=`tr -dc "a-z0-9" < /dev/urandom | head -c16`

############

error_msg() {
	echo -e "$red""$1""$end"
	exit 1
}

############

currentdir=`pwd`

check_root() {
	if [ "$UID" == "0" ]; then
		isroot=true
	else
		isroot=false
	fi
}

check_root

############

get_scripts() {
	offensive=`find "$currentdir"/offensive/ -type f ! -iname '*.old'`
	security=`find "$currentdir"/security/ -type f ! -iname '*.old'`
	utilities=`find "$currentdir"/utilities/ -type f ! -iname '*.old'`
	
	echo "$offensive
$security
$utilities" > /tmp/$rndstr-scripts.txt
	
	while IFS='' read -r line || [[ -n "$line" ]]; do
		check=`awk "NR==2" "$line" | cut -d' ' -f3`
		if [ "$check" == "y" ]; then
			result=`dirname "$line"`
			echo "$result" >> /tmp/$rndstr-root-scripts.txt
		elif [ "$check" == "n" ]; then
			result=`dirname "$line"`
			echo "$result" >> /tmp/$rndstr-nonroot-scripts.txt
		else
			continue
		fi
	done < /tmp/$rndstr-scripts.txt
	
	if [ -e /tmp/$rndstr-scripts.txt ]; then
		rm /tmp/$rndstr-scripts.txt
	fi
	
	if [ "$1" == "y" ]; then
		cat /tmp/$rndstr-root-scripts.txt | sort -u > /tmp/$rndstr-scripts.txt
	elif [ "$1" == "n" ]; then
		cat /tmp/$rndstr-nonroot-scripts.txt | sort -u > /tmp/$rndstr-scripts.txt
	else
		error_msg "Argument is incorrect!"
	fi
	
	if [ -e /tmp/$rndstr-root-scripts.txt ]; then
		rm /tmp/$rndstr-root-scripts.txt
	fi
	
	if [ -e /tmp/$rndstr-nonroot-scripts.txt ]; then
		rm /tmp/$rndstr-nonroot-scripts.txt
	fi
	
	while IFS='' read -r line || [[ -n "$line" ]]; do
		echo "export PATH=\$PATH:'$line'" >> /tmp/$rndstr-scripts-export.txt
	done < /tmp/$rndstr-scripts.txt
	
	cat /tmp/$rndstr-scripts-export.txt
	
	if [ -e /tmp/$rndstr-scripts-export.txt ]; then
		rm /tmp/$rndstr-scripts-export.txt
	fi
	
	if [ -e /tmp/$rndstr-scripts.txt ]; then
		rm /tmp/$rndstr-scripts.txt
	fi
}

############

if ($isroot); then
	get_scripts "y"
else
	get_scripts "n"
fi

############

exit 0