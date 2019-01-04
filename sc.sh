#!/bin/bash
if [ $# -lt 1 ];then
	echo "Usage:"
	echo "this script depends on curl and sed"
	echo "$0 component_name"
	echo "for example:$0 xml2-config"
	exit 0
fi
#tmpSN=$(echo $(lsb_release -a) | awk 'BEGIN{FS=":"};/Codename/{print $NF}')
tmpSN=$(echo $(lsb_release -c) | cut -d' ' -f2)
suiteName=$(echo $tmpSN | sed 's/^[[:space:]]\(.*\)[[:space:]]$/\1/p')
url="https://packages.ubuntu.com/search?mode=exactfilename&suite=$suiteName&section=all&arch=any&keywords=$1&searchon=contents"
tmpF=$(mktemp /tmp/XXXXX)
curl -o "$tmpF" --url "$url" 1&>/dev/null
fl=$(sed -n '/class="file"/,/<\/tr>/p' "$tmpF")
rm -f "$tmpF"
if [ -z "$fl" ];then
	echo "cannot find package $1 information,pls search in https://packages.ubuntu.com manual"
	exit 0
fi
echo "$fl" | sed -n 's/<a href=.*>\(.*\)<\/a>/candidate:\1/p'

