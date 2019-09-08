#!/bin/bash
#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#
# SCRIPT:        cleanTemp.sh
# USAGE:        ./cleanTemp.sh
# PURPOSE:      Shell script for "Windows Subsystem for Linux" that will
#               remove the unused and useless temporary files, and it
#               will free up space and let your Windows perform better.
# TITLE:        Clean temporary files
# AUTHOR:       Jose Gracia
# VERSION:      1.0 Release
# NOTES:        This script is tested multiple times and got no errors,
#               the temporary files that are needed or are in use
#               will not be removed, anyways we do not take care of any
#               problem, do a system backup in case something goes wrong.
#               there is no warranty.
# BASH_VERSION: GNU bash, version 4.4.20(1)-release (x86_64-pc-linux-gnu)
# LICENSE:      GNU General Public License v3.0
# GITHUB:       https://github.com/Josee9988/
# MAIL:         jgracia9988@gmail.com
#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#~#

RED='\033[0;31m'
NC='\033[0m'
UNDERLINE=$(echo -en "\e[4m")
PURPLE=$(echo -en "\e[35m")
startTime=$(date +%s%N)

if grep -q Microsoft /proc/version; then #checks if you are using WSL or a regular Linux.
    userName=$(cmd.exe /c 'echo %USERNAME%')

    echo "Removing temporary files (global and local temporary files)."

    rm -R -f /mnt/c/Users/$userName/AppData/Local/Temp/ &>/dev/null #local temp files

    rm -R -f /mnt/c/Windows/Temp/ &>/dev/null #global temp files

    echo "Done. All your temporary files that were not in use are now removed!"

    echo -e "Time used for the script: ${UNDERLINE}$((($(date +%s%N) - $startTime) / 1000000)) milliseconds${NC}."

else
    echo -e "You are ${RED}NOT${NC} using ${UNDERLINE}Windows Subsystem for Linux${NC} so this script will automatically close."
fi
