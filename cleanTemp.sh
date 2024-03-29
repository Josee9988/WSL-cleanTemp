#!/bin/bash
#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#
# SCRIPT:        cleanTemp.sh
# USAGE:        ./cleanTemp.sh
# PURPOSE:      Shell script for "Windows Subsystem for Linux" that will
#               remove the unused and useless temporary files, and it
#               will free up space and let your Windows perform better.
# TITLE:        Clean temporary files
# AUTHOR:       Jose Gracia
# VERSION:      1.02
# NOTES:        This script is tested multiple times and got no errors,
#               the temporary files that are needed or are in use
#               will not be removed, anyways we do not take care of any
#               problem, do a system backup in case something goes wrong.
#               there is no warranty.
# BASH_VERSION: GNU bash, version 4.4.20(1)-release (x86_64-pc-linux-gnu)
# LICENSE:      GNU General Public License v3.0
# GITHUB:       https://github.com/Josee9988/
# MAIL:         jgracia9988@gmail.com
#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#

red='\033[0;31m'
nc='\033[0m'
underLine=$(echo -en "\e[4m")
startTime=$(date +%s%N)

if grep -q Microsoft /proc/version; then #Check if you are using WSL or a regular Linux.

    #Getting the username of the current Windows session to obtain the path to the local temporary files.
    userName=$(cmd.exe /c 'echo %USERNAME%')

    #Removing local temp files
    rm -R -f /mnt/c/Users/$userName/AppData/Local/Temp/ &>/dev/null

    #Removing global temp files
    rm -R -f /mnt/c/Windows/Temp/ &>/dev/null

    echo -e "\n${red}DONE${nc}. All your temporary files that were not in use are now removed!"
    echo -e "Time spend for the script: ${underLine}$((($(date +%s%N) - $startTime) / 1000000)) milliseconds${nc}."

else #if you are not using WSL.
    echo -e "You are ${red}NOT${nc} using ${underLine}Windows Subsystem for Linux${nc} and this script will automatically close."
fi
