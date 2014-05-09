#!/bin/bash
# /etc/init.d/CheckPowerLoss

### BEGIN INIT INFO
# Provides:          CheckPowerLoss
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: Check for (un)gracefull shutdown on boot
# Description:       This script check if the previous shutdown was intented thus not by a loss of mains.
### END INIT INFO

NORMALSHUTDOWN="/etc/normalshutdown" # The path where a file will be created when shutting down the system
LOGFILE="/var/www/Shutdown_Log.txt" # The path where the log will be created when starting the system.
DATE="$(date "+%d/%m/%Y %T")" # The time when the script was run and the log entry created.

case "$1" in # The system is shutting down.
	stop )
		touch -a "${NORMALSHUTDOWN}"
		;;
	start ) # The system is starting.
		# Check if the file 'normalshutdown' was created at shutdown
		if [ -f "${NORMALSHUTDOWN}" ]
		then
		    rm "${NORMALSHUTDOWN}"
        	echo "${DATE} ==> The system rebooted after gracefull shutdown." >> "${LOGFILE}"
		else
		    echo "${DATE} ==> The system rebooted after a loss of mains!" >> "${LOGFILE}"
		fi
		;;
esac
