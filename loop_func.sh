#!/bin/bash

echo "Dem so:"
for i in 1 2 3; do
	echo "So $i"
done

echo "Danh sach cac file shell trong thu muc nay:"
for f in *.sh; do
	echo "-f $f"
done

echo "vong lap while:"
count=1
while [ "$count" -le 3 ]; do
	echo "Lan lap thu $count"
	count=$((count+1))
done

backup_file(){
	local file_to_back_up=$1
	if [ -f "$file_to_back_up" ]; then
		cp "$file_to_back_up" "${file_to_back_up}.bak"
		echo "backup thanh cong"
	else
		echo "backup that bai: "$file_to_back_up" khong ton tai"
	fi
}

backup_file data.txt
backup_file b.txt
