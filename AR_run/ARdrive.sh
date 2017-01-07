#!/bin/bash

source ~/.profile
cd ../Release/AndroidRipperDriver
date1=$(date +"%s")
#gtimeout 1800 java -jar ARDriver.jar s systematic.properties
gtimeout 600 java -jar ARDriver.jar s systematic.properties
date2=$(date +"%s")
diff=$(($date2-$date1))
echo "ARDriver run-finished: it took $(($diff / 60)) minutes and $(($diff % 60)) seconds."
