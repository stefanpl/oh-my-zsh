#!/bin/bash

###
#
# Locate the latest laravel log file and tail -f on it
#
###
function tail_laravel_log() {

	# First, locate the log directory
	if [ -d ./storage/logs ]; then
		logdir="./storage/logs"
	fi
	if [ -d ./laravel/storage/logs ]; then
		logdir="./laravel/storage/logs"
	fi
	if [ -d ./logs ]; then
		logdir="./logs"
	fi

	if [ -z "$logdir"  ]; then
		echo "Could not find log directory"
		exit 1
	fi

	# Now, see if the logs are saved as rotating log files or a single file
	rotatingLogEntries=`find ${logdir} -name "laravel-*.log" | wc -l`

	if [ ${rotatingLogEntries} -gt 0 ]; then
		logfile=`find ${logdir} -name "laravel-*.log" | sort -r | head -n1`
	else 
		if [ ! -f ${logdir}/laravel.log ]; then
			echo "Could not find a log file in ${logdir}"
			exit 1
		fi
		logfile=${logdir}/laravel.log
	fi

	# Tail the log file
	tail -f ${logfile}
}
