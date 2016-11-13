#!/bin/bash
DEVICE=$1
SCHED=$2

function set_io() {
	DEVICE=$1
	SCHED=$2
	if [ ! -d "/sys/block/$DEVICE" ]; then
		echo "ERR: /sys/block/$DEVICE does not exists."
		exit
	fi

	if [ "$SCHED" != "" ]; then
		case $SCHED in
			cfq|noop|antecipatory|deadline) true ;;
			*) echo "ERR: Invalid scheduler $SCHED." ; exit  ;;
		esac
		# Verify support for scheduler:
		if [ "`grep $SCHED /sys/block/$DEVICE/queue/scheduler`" == "" ]; then
			echo "ERR: Does not support scheduler $SCHED."
			exit
		else
			echo $SCHED > /sys/block/$DEVICE/queue/scheduler
		fi
	else
		# return current scheduler
		cat /sys/block/$DEVICE/queue/scheduler | cut -d'[' -f2 | cut -d']' -f1
	fi
}

if [ "$DEVICE" == "" ]; then
	echo "Usage:"
	echo "$0 <disk device> [scheduler]"
	exit
elif [ "$DEVICE" == "all" ]; then
  for DISK in `find /sys/block -name "[hs]d[a-z]" -exec basename {} \;`; do
    set_io $DISK $SCHED
  done
else
  set_io $DEVICE $SCHED
fi
