#!/bin/zsh
if [ $1 ]
then
	outfile=$1
else
	outfile="/tmp/outfile"
fi
timedatectl | egrep -i "local time" | perl -p -e 's/.*Local time: //' | perl -p -e 's/ CEST//' >> $outfile
/home/stefan/scripts/speedtest | egrep -i "(Download:|Upload:)" >> $outfile
echo "==================================" >> $outfile
