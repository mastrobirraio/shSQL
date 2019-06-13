#!/bin/bash

#
# Script to initalize database
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
format_text $RED "Creating database and user..."
$DIR/create-db.sh

format_text $RED "Creating database structure..."
$DIR/import-structure.sh

format_text $RED "Creating database samples..."
$DIR/import-sample.sh

format_text $GRAY "Finish"
