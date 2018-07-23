#!/bin/bash

# Collection of utility functions

# ANSI COLOR CODES. Use bold ones for better readability
# There's more:
# https://gist.github.com/vratiu/9780109
RED='\033[1;31m'
NORMAL='\033[0m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'


# Redirect the received string to stderr and exit 1
function exitWithError {
	printf "${RED}### ERROR: ### $1\n${NORMAL}" 1>&2;
	exit 1;
}

# Requires the calling script to be run with root privileges.
# Sets the $USER env variable to the calling user.
function requireRoot {
	if [ "$EUID" -ne 0 ]; then
		exitWithError "Please run this script with root privileges."
	fi
	if [ ! "$SUDO_USER" = '' ]; then
		USER=$SUDO_USER
        HOME=$(getHomeDirectoryForUser $USER)
	fi
}

# Make sure a given user exists on the host.
function ensureUserExists {
	if [ -z $1 ]; then
		exitWithError "ensureUserExists must be called with a user name."
	fi
	if [ ! $(id -u $1 2>/dev/null) ]; then
		exitWithError "Invalid user '$1' provided."
	fi
}

# Return the home directory of a given user,
#  or the current user if none is provided.
function getHomeDirectoryForUser {
	if [ -z $1 ]; then
		user=$USER
	else
		user=$1
	fi
	ensureUserExists $user
	echo $( getent passwd "$user" | cut -d: -f6  )
}

# Our dotfiles need to be at ~/.dotfiles
function ensureDotfilesExist {
	dotfileDirectory=${HOME}/.dotfiles
	if [ ! -d ${dotfileDirectory} ]; then
		git clone https://github.com/stefanpl/dotfiles ${dotfileDirectory}
	fi
}

function logSuccess {
	printf "${GREEN}$1\n${NORMAL}"
}

function logError {
    printf "${RED}### ERROR: ### $1\n${NORMAL}"
}

function logInfo {
    printf "${YELLOW}$1\n${NORMAL}"
}
