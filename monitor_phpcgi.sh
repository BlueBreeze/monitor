#!/bin/bash

if [ $# -lt 1 ];then
cat << HELP
monitor_phpcgi.sh: monitor php-cgi with a port 
UASGE: nohup monitor_phpcgi.sh port&
EXAMPLE: nohup monitor_phpcgi.sh 8001&

HELP
    exit
fi

port=$1
#echo $port

logpath='/tmp'
if [ ! -d "$logpath" ];then
    mkdir $logpath
fi


while true
do
    result=`ps -efa | grep php-cgi | grep $port`
    #echo $result

    if [ ! "$result" ];then
        now=$(date +%Y%m%d%H%M%S)
        echo "[$now] php-cgi -b:$port restart." >> $logpath/summary.log
        nohup php-cgi -b:$port >> $logpath/nohup_detail.log&
    fi

    sleep 2 
done
