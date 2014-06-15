#!/bin/sh

if [ "$(ps -ef |grep -v grep |grep MobilePartner.jar |awk '{print $2}')" != "" ]
then
	kill -s 12 $(ps -ef |grep -v grep |grep MobilePartner.jar |awk '{print $2}')
fi
