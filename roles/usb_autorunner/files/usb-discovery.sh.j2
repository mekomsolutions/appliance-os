#!/bin/bash

filteredDeviceLabel=("cluster-disk")
mkdir -p /mnt/usb

inotifywait --format '%f' -m /dev -e CREATE | while read device
do
	devIsConnected=$(blkid -o device | grep "dev/sd")

	if [[ ( "$devIsConnected" != 0) ]]
	then
		echo "⚡️ Device '$device' connection detected ⚡️"
		if [[ $device =~ ^sd.* ]]
		then
			echo "⚙️  Create mount point: '/mnt/usb/$device'."
			mkdir -p /mnt/usb/$device
			echo "⚙️  Mount device '/mnt/usb/$device'..."
			mount /dev/$device /mnt/usb/$device
			if [[ ! $(lsblk /dev/$device -o LABEL -n) =~ $filteredDeviceLabel ]]
			then
				echo "⚙️  Trigger USB Autorunner on '/mnt/usb/$device'..."
				{{ usb_autorunner_install_path }}/autorunner.sh $(lsblk /dev/$device -o MOUNTPOINT -n)
			fi
			echo "⚙️  Unmounting device..."
			umount /dev/$device
			echo "😴 Standing by..."
		fi
	fi
done
