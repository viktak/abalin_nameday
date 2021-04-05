#!/usr/bin/env bash
# -*- coding: utf-8 -*-

##################################################################################################################
#
#   build-and-publish.sh
#   This script builds, packages and publishes Python modules to https://pypi.org/ or https://test.pypi.org/ .
#
#
##################################################################################################################

MAJOR_VERSION="0.1."

NC='\033[0m' # No Color
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHTGREY='\033[0;37m'

DARKGREY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
YELLOW='\033[1;33m'
LIGHTBLUE='\033[1;34m'
LIGHTPURPLE='\033[1;35m'
LIGHTCYAN='\033[1;36m'
WHITE='\033[1;37m'


echo -e ${LIGHTGREEN}Removing previous packages...${NC}
rm -fr ./dist/

echo -e ${LIGHTGREEN}Incrementing version number...${NC}
declare -i serialNumber=0

serialNumber=`awk -F"." '/version/{print ($3+1)}' setup.cfg`

versionLine="version = "$MAJOR_VERSION$serialNumber

sed -i "/version/ c $versionLine" ./setup.cfg

echo -e ${LIGHTGREEN}Creating version.py...${NC}

versionLine="currentVersion=\""$MAJOR_VERSION$serialNumber"\""
echo -e $versionLine > ./src/owm2json/version.py

echo -e ${LIGHTGREEN}Building project...${NC}
python3 -m build

echo ""
echo -e Press ${CYAN}T${NC} to publish package to ${CYAN}TEST${NC} repository.
echo -e Press ${ORANGE}F${NC} to publish package to ${ORANGE}FINAL${NC} repository.
read -n 1 -r -p "Press anything else to cancel " REPLY
REPLY="${REPLY:=n}"
REPLY="${REPLY,,}"
echo ""

if [ $REPLY = "t" ] ; then
    echo -e ${LIGHTGREEN}Publishing project to ${CYAN}TEST${LIGHTGREEN} repository...${NC}
    python3 -m twine upload --repository testpypi dist/*
elif [ $REPLY = "f" ] ; then
    echo -e ${LIGHTGREEN}Publishing project to ${ORANGE}FINAL${LIGHTGREEN} repository...${NC}
    python3 -m twine upload --repository pypi dist/*
else
    echo -e ${LIGHTGREEN}Cancelled.${NC}
    exit
fi

