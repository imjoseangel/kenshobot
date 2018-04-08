#!/usr/bin/env bash
#
# Author:  J. Munoz (josea _DOT munoz _AT_ gmail _DOT_ com)
# Date:    2017-10-20
# Version: 0.1
#
#
# Requires:
# - bash
#
# Credits:
# - None
#
#
# /**************************************************************************
# *   Copyright 2016 by Jose Angel Munoz                                    *
# *                                                                         *
# *   This program is free software; you can redistribute it and/or modify  *
# *   it under the terms of the GNU General Public License as published by  *
# *   the Free Software Foundation; either version 3 of the License, or     *
# *   (at your option) any later version.                                   *
# *                                                                         *
# *   This program is distributed in the hope that it will be useful,       *
# *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
# *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
# *   GNU General Public License for more details.                          *
# *                                                                         *
# *   You should have received a copy of the GNU General Public License     *
# *   along with this program. If not, see <http://www.gnu.org/licenses/>.  *
# *                                                                         *
# **************************************************************************/
#

VERSION=0.2

# Usage first

OPTION=$1

#Check arguments
if [ "$OPTION" = '' ]; then
	echo "Usage: $0 OPTION"
	exit 1
else

#Set support email address
    case $OPTION in
        '')
	        ;;
        ip)
            /usr/bin/wget http://ipecho.net/plain -O - -q ; echo
            ;;
        who)
            who=$(who)
            if [[ $? != 0 ]]; then
                echo "Command failed."
            elif [[ $who ]]; then
                who
            else
                echo "No Users found."
            fi
            ;;
        bash)
            /bin/$1 -c "${@:2}"
	        if [ $? -ne 0 ]
            then
                echo "Command Failed."
            fi
            ;;
        bashpic)
            rm /tmp/kenshopic.png -f 2>/dev/null
            /usr/bin/convert label:"$(/bin/bash -c "${@:2}")" /tmp/kenshopic.png 2>/dev/null 
            if [[ $? != 0 ]]; then
                /usr/bin/convert label:"Command Failed" /tmp/kenshopic.png
            fi
            ;;
        top)
            /usr/bin/$1 -b -n 1
	        if [ $? -ne 0 ]
            then
                echo "Command Failed."
            fi
	    ;;
        man)
            /usr/bin/$1 -P cat $2
	    ;;
        help) 
            echo "I can help you manage your Raspberry Pi. Code is available at https://git.io/vd67s"
            echo " "
            echo "You can control me by sending these commands:"
            echo " "
            echo "*List of Commands*"
            echo "/help - Prints this *Help*"
            echo "/ip - Prints *External IP*"
            echo "/man - Sends a *Linux man*"
            echo "/menu - Shows inline *Menu*"
            echo "/restart - *Restarts* Bot"
            echo "/start - *Hello* Message"
            echo "/run - *Runs* a shell command"
            echo "/runpic - *Picture* with the output of a shell *command*"
            echo "/top - Shows *Top*"
            echo "/weather - Displays *Weather* (Defaults *Madrid*)"
            echo "/who - *Who* is connected"
            echo
            ;;
        *)
            echo "I can help you manage your Raspberry Pi. Code is available at https://git.io/vd67s"
            echo " "
            echo "You can control me by sending these commands:"
            echo " "
            echo "*List of Commands*"
            echo "/help - Prints this *Help*"
            echo "/ip - Prints *External IP*"
            echo "/man - Sends a *Linux man*"
            echo "/menu - Shows inline *Menu*"
            echo "/restart - *Restarts* Bot"
            echo "/start - *Hello* Message"
            echo "/run - *Runs* a shell command"
            echo "/runpic - *Picture* with the output of a shell *command*"
            echo "/top - Shows *Top*"
            echo "/weather - Displays *Weather* (Defaults *Madrid*)"
            echo "/who - *Who* is connected"
            echo
            ;;
    esac
fi
