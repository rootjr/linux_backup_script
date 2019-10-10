#!/bin/bash
echo "------ $(date) ------" >> output.log
exec 3>&1 4>&2
trap 'exec 2>&4 1>&3' 0 1 2 3
exec 1>>output.log 2>&1
#exec >> output.log
#exec 3>> output.log
sleep 1
rsync -rv -e ssh /home/ubuntu/key ubuntuweb@10.105.45.76:/home/ubuntuweb/test && sleep 5s && rm /home/ubuntu/key/*
