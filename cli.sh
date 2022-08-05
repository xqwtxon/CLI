#!/bin/env bash

# Project Variables
Project_Name="Command Line Interface"
Project_Version="0.0.1"
Project_Author="xqwtxon"
Reset='\e[0m'           # Text Reset
# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White
# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White
# Underline
UBlack='\e[4;30m'       # Black
URed='\e[4;31m'         # Red
UGreen='\e[4;32m'       # Green
UYellow='\e[4;33m'      # Yellow
UBlue='\e[4;34m'        # Blue
UPurple='\e[4;35m'      # Purple
UCyan='\e[4;36m'        # Cyan
UWhite='\e[4;37m'       # White
# Background
BG_Black='\e[40m'       # Black
BG_Red='\e[41m'         # Red
BG_Green='\e[42m'       # Green
BG_Yellow='\e[43m'      # Yellow
BG_Blue='\e[44m'        # Blue
BG_Purple='\e[45m'      # Purple
BG_Cyan='\e[46m'        # Cyan
BG_White='\e[47m'       # White
# High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White
# Bold High Intensity
BIBlack='\e[1;90m'      # Black
BIRed='\e[1;91m'        # Red
BIGreen='\e[1;92m'      # Green
BIYellow='\e[1;93m'     # Yellow
BIBlue='\e[1;94m'       # Blue
BIPurple='\e[1;95m'     # Purple
BICyan='\e[1;96m'       # Cyan
BIWhite='\e[1;97m'      # White
# High Intensity backgrounds
BG_IBlack='\e[0;100m'   # Black
BG_IRed='\e[0;101m'     # Red
BG_IGreen='\e[0;102m'   # Green
BG_IYellow='\e[0;103m'  # Yellow
BG_IBlue='\e[0;104m'    # Blue
BG_IPurple='\e[0;105m'  # Purple
BG_ICyan='\e[0;106m'    # Cyan
BG_IWhite='\e[0;107m'   # White


# Functions

check_syntax(){
	args="$1"
	if [ "$args" == "" ]; then
		help # this will return help function
	elif [ "$args" == "help" ]; then
		help # returning again the help
	elif [ "$args" == "info" ]; then
		info # will return info function
	else invalid "$1"
	fi
}

help(){
	echo -e "${Green}${Project_Name}${Reset} (version ${Cyan}v${Project_Version}${Reset}) by ${Yellow}${Project_Author}${Reset}"
	echo -e ""
	echo -e "${Green}help [command_name]${Reset}		Help From Commands, Command List"
	echo -e "${Green}info${Reset}		Information about Software, and Current Project Control Version."
	echo -e ""
	copyright # will return copyright function
}

copyright(){
	echo -e "${Cyan}This program is free software: you can redistribute it and/or modify."
        echo -e "${Cyan}it under the terms of the GNU Lesser General Public License as published by"
        echo -e "${Cyan}the Free Software Foundation, either version 3 of the License, or"
        echo -e "${Cyan}(at your option) any later version.${Reset}"
	echo ""
	echo -e "Copyright by ${Yellow}xqwtxon${Reset} (c) 2021 <xqwtxon@hotmail.com>"
}


info(){
	echo -e "${Green}${Project_Name}${Reset} (version ${Cyan}v${Project_Version}${Reset}) by ${Yellow}xqwtxon${Reset}"
	echo ""
	echo -e "${Blue}A homemade command line interface for $(uname -s) ($(uname -m)) for $(uname -o)${Reset}"
	echo ""
	echo -e "${Yellow}Github: ${Reset}https://github.com/xqwtxon/CLI"
	echo ""
	copyright # will return copyright function
}

invalid(){
	args="$1"
	echo -e "${Red}Invalid Command: ${BRed}${args}${Reset}${Red}, Try${Reset} ${BRed}'cli help'${Reset} ${Red}for list of commands.${Reset}"
}

check_syntax "$1"
