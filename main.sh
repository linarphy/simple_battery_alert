MIN_LEVEL=50
STORAGE_FILE_NAME="%/auto/simple_battery_alert"
BATTERY_FILE_NAME="/sys/class/power_supply/BAT0/capacity"

LEVEL=$(cat $BATTERY_FILE_NAME)

if [ $LEVEL -lt $MIN_LEVEL ]
then
	if [ ! -f $STORAGE_FILE_NAME ]
	then
		echo "PLEASE DO NOT DELETE THIS FILE, IT WAS GENERATED AUTOMATICALLY" > $STORAGE_FILE_NAME
		echo "PLEASE, CHARGE THIS DEVICE"
	fi
else
	if [ -f $STORAGE_FILE_NAME ]
	then
		rm $STORAGE_FILE_NAME
		echo "DEVICE SUCCESSFULLY RECHARGED"
	fi
fi
