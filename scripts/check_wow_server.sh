#!/bin/bash
while(true); do
	date | egrep -o "[0-9:]{5,8}";
	dig $1 | grep -io "authority section";
	sleep 1s;
done
