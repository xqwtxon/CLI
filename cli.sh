#!/bin/env bash
sleep 1s
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

# Project Variables
Project_Name="Command Line Interface"
Project_Version="0.0.2"
Project_Author="xqwtxon"
Project_Links=(
     "https://github.com/xqwtxon/cli"
     "https://xqwtxon.ml/"
)

# Messages
NAME="${Yellow}${Project_Name}${Reset}"
VERSION="${Green}${Project_Version}${Reset}"
AUTHOR="${Blue}${Project_Author}${Reset}"
KERNEL_NAME="${Cyan}$(uname -s)${Reset}"
rand="${RANDOM%8}"
TIPS_ARRAY=(
     "Want to suggess something? Tell us on ${Project_Links[0]}!"
     "Visit our website: ${Project_Links[1]}"
     "Try to use 'cli generate' to generate your own cli!"
     "Use 'cli help [command_name]' to see detailed about the commands each!"
     "Use 'cli publish' to publish your own cli with encoder!"
     "Use '--debug' parameter in 'cli publish' or 'cli generate' to see detailed debug issues tracking your program."
     "Found Bugs? Tell us on ${Project_Links[0]}!"
     "Do you want more examples? Try this template: https://github.com/xqwtxon/cli.sh!"
)
TIPS=${TIPS_ARRAY[ $RANDOM % ${#TIPS_ARRAY[@]} ]}
INFO="${Green}[$(date +%T.%N)]${Reset} ${Cyan}[Server Thread/INFO]:${Reset}"
ERROR="${Green}[$(date +%T.%N)]${Reset} ${Red}[Server Thread/ERROR]:${Reset}"
WARNING="${Green}[$(date +%T.%N)]${Reset} ${Yellow}[Server Thread/WARNING]:${Reset}"
DEBUG="${Green}[$(date +%T.%N)]${Reset} ${Blue}[Server Thread/DEBUG]:${Reset}"

help(){
     echo -e "${NAME} (version ${VERSION}) by ${AUTHOR} for ${KERNEL_NAME}"
     echo ""
     echo -e "${BCyan}TIP:${Reset} ${Cyan}${TIPS}${Reset}"
     echo ""
     echo -e "${Green}help [command_name]${Reset}     Displays of Information about Commands Usage"
     echo -e "${Green}generate [--debug]${Reset}      Generates Compiled Command Line Interface. ${Cyan}--debug${Reset} parameter is optional which debugging the program."
     echo -e "${Green}publish [--debug]${Reset}       Publish program and encrypt using feature encoder. Using parameter of ${Cyan}--debug${Reset} is logging encoder details."
     echo ""
     echo -e "${Cyan}This program is free software: you can redistribute it and/or modify it under the terms of the GNU Lesser General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.${Reset}"
     echo -e "${Yellow}Copyright by ${Project_Author} $(date +%Y) (c)${Reset}"
     echo ""
     echo -e "${Blue}Github:${Reset} ${Project_Links[0]}"
     echo -e "${Blue}Website:${Reset} ${Project_Links[1]}"
}

help_info(){
     echo -e "${Cyan}<Help>${Reset} Command Information"
     echo -e ""
     echo -e "${Yellow}Displays command information or full list of commands.${Reset}"
     echo -e ""
     echo -e "${Blue}Usage: help [command_args]${Reset}"
}

generate_info(){
     echo -e "${Cyan}<Generate>{Reset} Command Imformation"
     echo -e ""
     echo -e "${Yellow}Generates Compiled Command Line Interface. ${Cyan}--debug${Yellow} parameter is optional which debugging the program.${Reset}"
     echo -e ""
     echo -e "${Blue}Usage: generate [--debug]${Reset}"
}

publish_info(){
     echo -e "${Cyan}<Publish>${Reset} Command Information"
     echo -e ""
     echo -e "${Yellow}Publish program and encrypt using feature encoder. Using parameter of ${Cyan}--debug${Yellow} is logging encoder details.${Reset}"
     echo -e ""
     echo -e "${Blue}Usage: generate [--debug]${Reset}"
}

generate(){
     if [ ! -e "data/" ]; then
        mkdir "data/"
     fi
     output="${PWD}/data/generated-$(date +%F)-cli.sh"
}

# Executor
args="$@"
if [ "$args" == "" ]; then
   help
elif [ "$args" == "help" ]; then
   help
elif [ "$args" == "help help" ]; then
   help_info
elif [ "$args" == "help generate" ] || [ "$args" == "help gen" ]; then
   generate_info
elif [ "$args" == "help publish" ] || [ "$args" == "help pb" ]; then
   generate_info
elif [ "$args" == "generate" ] || [ "$args" == "gen --debug" ] || [ "$args" == "gen" ] || [ "$args" == "generate --debug" ]; then
   generate
   # Generate CLI Easily
     echo -e "${INFO} Output File: $output ${Reset}"
     sleep 1s
     if [ -e "$output" ]; then
        echo -e "${WARNING} The Output File will Overwritten: $output"
        rm "$output"
     else
        echo -e "${INFO} Creating Output File: $output"
     fi
     sleep 5s
     echo "# This is auto-generated: <${Project_Links[0]}>" >> $output
     sleep 2s
     echo "# ${Project_Name} (version ${Project_Version}) for $(uname -s)." >> $output
     sleep 2s
     echo "# As of $(date), this is auto-generated using ${Project_Name}." >> $output
     sleep 2s
     echo "" >> $output
     sleep 2s
     echo "if [ \"\$1\" == \"\" ]; then" >> $output
     sleep 2s
     echo "  echo \"You have been typed none, try to add some parameters like --help <3\"" >> $output
     sleep 2s
     echo "elif [ \"\$1\" == \"--help\" ]; then" >> $output
     sleep 2s
     echo "  echo \"Yehey! Your first cli is working! Try --example to test it, your first example command.\"" >> $output
     sleep 2s
     echo "  echo \"You can now view this code by viewing $output\"" >> $output
     sleep 2s
     echo "elif [ \"\$1\" == \"--example\" ]; then" >> $output
     sleep 2s
     echo "   echo \"This is test command. You have sucessfully called this command. Your Parameter is \$@\"" >> $output
     echo "fi" >> $output
     sleep 2s
     echo "" >> $output
     sleep 2s
     echo "# You can view our template: https://github.com/xqwtxon/cli.sh which better practice template for begginers." >> $output
     sleep 2s
     echo "# Copyright by ${Project_Author} (c) $(date +%Y)" >> $output
     sleep 2s
     echo "# This is generated by ${Project_Name}." >> $output
     if [ "$2" == "--debug" ]; then
        # Base64
        echo -e "${DEBUG} <!-- Begin Base64 Dump -->"
        echo -e "${DEBUG} $(base64 $output)"
        echo -e "${DEBUG} <!-- End Base64 Dump -->"
        sleep 2s
        echo -e "${DEBUG} <!-- Begin Base32 Dump -->"
        echo -e "${DEBUG} $(base32 $output)"
        echo -e "${DEBUG} $(base64 $output)"
        echo -e "${DEBUG} <!-- End Base32 Dump -->"
        sleep 2s
        echo -e "${DEBUG} Sucessfully wrote in: $output"
        echo -e "${DEBUG} $(cat $output)"
     fi
     sleep 2s
     echo -e "${INFO} The output file is saved on $output!"
     echo -e "${INFO} Thank you for using ${NAME}!"
elif [ "$args" == "publish" ] || [ "$args" == "publish --debug" ] || [ "$args" == "pb" ] || [ "$args" == "pb --debug" ]; then
     echo -e "[*] You are going to publish a command line interface compiled program."
     read -p "[*] Are sure do you want to proceed? " proceed
     if [ "$proceed" == "" ]; then
        echo "[*] No input detected. Aborting.."
     elif [ "$proceed" == "yes" ] || [ "$proceed" == "y" ] || [ "$proceed" == "Y" ]; then
        echo "[*] Proceessing..."
        status="complete"
     elif [ "$proceed" == "no" ] || [ "$proceed" == "n" ] || [ "$proceed" == "N" ]; then 
        echo "[*] Aborting..."
     else echo "[*] Invalid input detected. Aborting.."
     fi
     
     if [ "$status" == "complete" ]; then
        echo "[*] You are going to setup for publishing program."
        read -p "[*] File Location (full path were going to process): " file
        echo "[*] 0 = nothing, 1 = base32, 2 = base64, default = 0"
        read -p "[*] Encrypt Type: " encrypt
        echo "[*] File to be compiled location. The default will compiled is ${PWD}/$file.pb"
        read -p "[*] File to be publish: " output
        # check whether inputs are valid
        if [ "$output" == "" ]; then
           output="$file.pb"
        fi
        if [ -e "$output" ]; then
           echo -e "${WARNING} There's something inside of ${PWD}/$file be aware, it will overwritten.."
           rm "${PWD}/$output"
        else echo -e "${INFO} Output file: ${PWD}/$output"
        fi
        if [ "$encrypt" == "" ]; then
           echo -e "${INFO} Using 'standard' as unicode compiling..."
           echo "# As of $(date +%F), compiled using ${Project_Name} (version ${Project_Version}) for $(uname -s)" >> $output
           echo "" >> $output
           cat $file >> $output
           echo "" >> $output
           echo "# This is generated using 'standard' encoder." >> $output
        elif [ "$encrypt" == "1" ]; then
           echo -e "${INFO} Using 'base32' as unicode compiling..." 
           echo "# As of $(date +%F), compiled using ${Project_Name} (version ${Project_Version}) for $(uname -s)" >> $output
           echo "" >> $output
           base32 $file >> $output
           echo "" >> $output
           echo "# This is generated using 'base32' encoder." >> $output
        elif [ "$encrypt" == "2" ]; then
           echo -e "${INFO} Using 'base64' as unicode compiling..." 
           echo "# As of $(date +%F), compiled using ${Project_Name} (version ${Project_Version}) for $(uname -s)" >> $output
           echo "" >> $output
           base64 $file >> $output
           echo "" >> $output
           echo "# This is generated using 'base64' encoder." >> $output
        else 
           echo -e "${WARNING} Invalid Encoder: $encrypt, using 'standard' encoder as default..."
           echo -e "${INFO} Using 'standard' as unicode compiling..." 
           echo "# As of $(date +%F), compiled using ${Project_Name} (version ${Project_Version}) for $(uname -s)" >> $output
           echo "" >> $output
           cat $file >> $output
           echo "" >> $output
           echo "# This is generated using 'standard' encoder." >> $output
        fi
        
        if [ "$2" == "--debug" ]; then
             echo -e "${DEBUG} <!-- Begin Publish Dump -->"
             sleep 5s
             echo -e "${DEBUG} $(base64 $output)"
             sleep 5s
             echo -e "${DEBUG} $(base32 $output)"
             sleep 5s
             echo -e "${DEBUG} <!-- End Publish Dump -->"
        fi
        sleep 5s
        echo -e "${INFO} Sucessfully created output file on: $output!"
        sleep 2s
     fi
else 
   help
   echo ""
   echo -e "${BG_Red}Wrong Usage: $args, Try 'cli help' for list of all commands!${Reset}"
fi
