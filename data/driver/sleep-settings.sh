#!/bin/bash

if [ -f /etc/issue ]
then
    if [ "$(cat /etc/issue |grep Ubuntu)" != "" ]
    then
        cp $1/driver/sleepsettings/Ubuntu/010-huawei-suspend.sh /etc/acpi/suspend.d/
		chmod 755 /etc/acpi/suspend.d/010-huawei-suspend.sh
		echo "rm -f /etc/acpi/suspend.d/010-huawei-suspend.sh" >> $1/driver/Uninstall
    elif [ "$(cat /etc/issue |grep openSUSE)" != "" ]
    then
        if [ -d /usr/lib/pm-utils/sleep.d ]
        then
            cp $1/driver/sleepsettings/OpenSUSE/40-huawei-suspend /usr/lib/pm-utils/sleep.d
            chmod 755 /usr/lib/pm-utils/sleep.d/40-huawei-suspend
            echo "rm -f /usr/lib/pm-utils/sleep.d/40-huawei-suspend" >> $1/driver/Uninstall
        fi
    elif [ "$(cat /etc/issue |grep Fedora)" != "" ]
    then
        cp $1/driver/sleepsettings/Fedora/huawei-lidbtn.conf /etc/acpi/events/
		chmod 755 /etc/acpi/events/huawei-lidbtn.conf
		cp $1/driver/sleepsettings/Fedora/huawei-lidbtn.sh /etc/acpi/actions/
		chmod 755 /etc/acpi/actions/huawei-lidbtn.sh
		
		echo "rm -f /etc/acpi/events/huawei-lidbtn.conf" >> $1/driver/Uninstall
		echo "rm -f /etc/acpi/actions/huawei-lidbtn.sh" >> $1/driver/Uninstall
		
		if [ -f /etc/acpi/actions/sleep.sh ]
		then
			if [ "$(cat /etc/acpi/actions/sleep.sh |grep MobilePartner)" == "" ]
			then
				sed 1,1s/sh/"sh\nif [ \"\$(ps -ef |grep -v grep |grep MobilePartner |awk '{print $2}')\" != \"\" ]\nthen\n	kill -s 15 \$(ps -ef |grep -v grep |grep MobilePartner |awk '{print $2}')\nfi"/ /etc/acpi/actions/sleep.sh>/etc/acpi/actions/huawei-sleep.sh
				mv /etc/acpi/actions/sleep.sh /etc/acpi/actions/sleep.bak
				mv /etc/acpi/actions/huawei-sleep.sh /etc/acpi/actions/sleep.sh
				chmod 755 /etc/acpi/actions/sleep.sh
				
				echo "rm -f /etc/acpi/actions/sleep.sh" >> $1/driver/Uninstall
				echo "mv /etc/acpi/actions/sleep.bak /etc/acpi/actions/sleep.sh" >> $1/driver/Uninstall
			fi
		else
			cp $1/driver/sleepsettings/Fedora/sleep.sh /etc/acpi/actions/
			chmod 755 /etc/acpi/actions/sleep.sh
			echo "rm -f /etc/acpi/actions/sleep.sh" >> $1/driver/Uninstall
		fi
    elif [ "$(cat /etc/issue |grep Debian)" != "" ]
    then
        cp $1/driver/sleepsettings/Debian/huawei-lidbtn /etc/acpi/events/
		chmod 755 /etc/acpi/events/huawei-lidbtn
		cp $1/driver/sleepsettings/Debian/huawei-sleep /etc/acpi/events/
		chmod 755 /etc/acpi/events/huawei-sleep
		cp $1/driver/sleepsettings/Debian/huawei-sleep.sh /etc/acpi/huawei-sleep.sh
		chmod 755 /etc/acpi/huawei-sleep.sh
		echo "rm -f /etc/acpi/events/huawei-lidbtn" >> $1/driver/Uninstall
		echo "rm -f /etc/acpi/events/huawei-sleep" >> $1/driver/Uninstall
		echo "rm -f /etc/acpi/huawei-sleep.sh" >> $1/driver/Uninstall
    elif [ "$(cat /etc/issue |grep Xandros)" != "" ]
    then
        cp $1/driver/sleepsettings/Xandros/huawei-lidbtn /etc/acpi/events/
		chmod 755 /etc/acpi/events/huawei-lidbtn
		cp $1/driver/sleepsettings/Xandros/huawei-sleep /etc/acpi/events/
		chmod 755 /etc/acpi/events/huawei-sleep
		cp $1/driver/sleepsettings/Xandros/huawei-sleep.sh /etc/acpi/huawei-sleep.sh
		chmod 755 /etc/acpi/huawei-sleep.sh	
		echo "rm -f /etc/acpi/events/huawei-lidbtn" >> $1/driver/Uninstall
		echo "rm -f /etc/acpi/events/huawei-sleep" >> $1/driver/Uninstall
		echo "rm -f /etc/acpi/huawei-sleep.sh" >> $1/driver/Uninstall
    fi
else
    if [ -f /etc/linpus-release ]
    then
        cp $1/driver/sleepsettings/Linpus/huawei-lidbtn.conf /etc/acpi/events/
		chmod 755 /etc/acpi/events/huawei-lidbtn.conf
		cp $1/driver/sleepsettings/Linpus/huawei-lidbtn.sh /etc/acpi/actions/
		chmod 755 /etc/acpi/actions/huawei-lidbtn.sh
		
		echo "rm -f /etc/acpi/events/huawei-lidbtn.conf" >> $1/driver/Uninstall
		echo "rm -f /etc/acpi/actions/huawei-lidbtn.sh" >> $1/driver/Uninstall
		
		if [ -f /etc/acpi/actions/sleep.sh ]
		then
			if [ "$(cat /etc/acpi/actions/sleep.sh |grep MobilePartner)" == "" ]
			then
				sed 1,1s/sh/"sh\nif [ \"\$(ps -ef |grep -v grep |grep MobilePartner |awk '{print $2}')\" != \"\" ]\nthen\n	kill -s 15 \$(ps -ef |grep -v grep |grep MobilePartner |awk '{print $2}')\nfi"/ /etc/acpi/actions/sleep.sh>/etc/acpi/actions/huawei-sleep.sh
				mv /etc/acpi/actions/sleep.sh /etc/acpi/actions/sleep.bak
				mv /etc/acpi/actions/huawei-sleep.sh /etc/acpi/actions/sleep.sh
				chmod 755 /etc/acpi/actions/sleep.sh
				echo "rm -f /etc/acpi/actions/sleep.sh" >> $1/driver/Uninstall
				echo "mv /etc/acpi/actions/sleep.bak /etc/acpi/actions/sleep.sh" >> $1/driver/Uninstall
			fi
				
		else
			cp $1/driver/sleepsettings/Linpus/sleep.sh /etc/acpi/actions/
			chmod 755 /etc/acpi/actions/sleep.sh
			echo "rm -f /etc/acpi/actions/sleep.sh" >> $1/driver/Uninstall
		fi
    fi
fi
