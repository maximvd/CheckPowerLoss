Installation:
-------------

1. copy 'CheckPowerLoss.sh' into 'etc/init.d'.
2. Open a terminal window in 'etc/init.d'
3. use the following command to make it executable: 'sudo chmod 755 CheckPowerLoss.sh'
4. use the following command to ad the script to the services 'sudo update-rc.d CheckPowerLoss.sh defaults'

Default Settings:
-----------------

- The script will create an empty file in 'etc/' called 'normalshutdown'.
- The script will create a log file in '/var/www'. 