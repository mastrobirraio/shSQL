#!/bin/bash

#
# Script to clean db
#

# GETTING CURRENT DIRECTORY
DIR=$(dirname "$0")
. $DIR/../.env

# COLORS
DEFAULT='\e[00m'
RED='\e[31m'
YELLOW='\e[33m'
GRAY='\e[90m'

# FUNCTIONS
format_text () {
    COLOR=$1
    TEXT=$2

    echo -e "${COLOR}${TEXT}${DEFAULT}"
}

# SCRIPT STARTS HERE
format_text $YELLOW "Dropping tables ..."
mysql -u $DB_USER -p$DB_PASS -Nse 'show tables' $DB_NAME | while read table; do format_text $GRAY "$table"; mysql -u $DB_USER -p$DB_PASS -e "SET FOREIGN_KEY_CHECKS=0;
drop table \`$table\`" $DB_NAME; done

format_text $GRAY "End process\n\n\n"