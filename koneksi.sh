#!/bin/bash

#i2c1
sleep 1;
config-pin p9-17 i2c;
config-pin p9-18 i2c;

#echo ds1307 0x68 > /sys/class/i2c-adapter/i2c-2/new_device

echo "out" > /sys/class/gpio/gpio68/direction;
echo "out" > /sys/class/gpio/gpio69/direction;
echo "out" > /sys/class/gpio/gpio45/direction;
echo "out" > /sys/class/gpio/gpio44/direction;

while true;
do
        sec=$(date +"%M")
        if [ "$sec" == "00" ]; 
		then rm /var/log/*;
        fi

	if [ -e "/dev/cdc-wdm0" ]
		then echo "1" > /sys/class/gpio/gpio45/value;
		else echo "0" > /sys/class/gpio/gpio45/value;
	fi

	if /sbin/ifconfig | grep -q "ppp0"
		then echo "1" > /sys/class/gpio/gpio69/value;
	else
		wvdial play &
		echo "nameserver 8.8.8.8" > /etc/resolv.conf;
		echo "0" > /sys/class/gpio/gpio69/value;
	fi
	find /home/data/powermeter -type f -mtime +2 -exec rm -f {} \;
	find /home/data/saver -type f -mtime +2 -exec rm -f {} \;
	sleep 1;
done

#/sys/class/gpio/gpio68
#/sys/class/gpio/gpio69
#/sys/class/gpio/gpio45
#/sys/class/gpio/gpio44
#jam=$(date +"%I:%M:%S")

        #sec=$(date +"%S")
        #if [ "$sec" == "00" ]; 
	#then  systemctl restart initAndRun;
        #fi


        #if ping -q -c 1 -W 1 8.8.8.8 > /dev/null;
        #then echo "1" > /sys/class/gpio/gpio69/value;
        #else echo "0" > /sys/class/gpio/gpio69/value;
        #fi
##uart1
#sleep 1;
#config-pin p9-24 uart;
#config-pin p9-26 uart;
##uart2
#sleep 1;
#config-pin p9-21 uart;
#config-pin p9-22 uart;
##uart4
#sleep 1;
#config-pin p9-11 uart;
#config-pin p9-13 uart;
##uart5
#sleep 1;
#config-pin p8-37 uart;
#config-pin p8-38 uart;
