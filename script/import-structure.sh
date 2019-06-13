#!/bin/bash

#
# Script to import structure
#

# GETTING CURRENT DIRECTORY
DIR=$(dirname "$0")
. $DIR/../.env

# COLORS
DEFAULT='\e[00m'
YELLOW='\e[33m'
GRAY='\e[90m'

# FUNCTIONS
format_text () {
    COLOR=$1
    TEXT=$2

    echo -e "${COLOR}${TEXT}${DEFAULT}"
}

# SCRIPT STARTS HERE
format_text $YELLOW "Importing structure ..."
mysql -u ${DB_USER} -p${DB_PASS} ${DB_NAME} < $DIR/../struct.sql
format_text $GRAY "End process\n\n\n"