#!/bin/bash

#
# Script to create database and user
#

# GETTING CURRENT DIRECTORY
DIR=$(dirname "$0")
. $DIR/../.env

# COLORS
DEFAULT='\e[00m'
RED='\e[31m'
YELLOW='\e[33m'
GRAY='\e[90m'

# QUERIES
CREATE_DATABASE_QUERY="CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
CREATE_USER_QUERY="CREATE USER IF NOT EXISTS'${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';"
GRANT_PRIVILEGS_QUERY="GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';"
FLUSH_PRIVILEGES_QUERY="FLUSH PRIVILEGES;"

# FUNCTIONS
format_text () {
    COLOR=$1
    TEXT=$2

    echo -e "${COLOR}${TEXT}${DEFAULT}"
}

# SCRIPT STARTS HERE
format_text $GRAY "Please enter root user MySQL password: "
read -s mysql_root
format_text $YELLOW "Creating user ..."
format_text $YELLOW "Granting privileges ..."
format_text $YELLOW "Flushing privileges ..."
mysql -u root -p$mysql_root -e "${CREATE_USER_QUERY}${GRANT_PRIVILEGS_QUERY}${FLUSH_PRIVILEGES_QUERY}"

format_text $YELLOW "Creating database ..."
mysql -u ${DB_USER} -p${DB_PASS} -e "${CREATE_DATABASE_QUERY}"
format_text $GRAY "End process\n\n\n"