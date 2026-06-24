#!/bin/bash
so=15
if [ "$so" -gt 10 ]; then
	echo "$so lon hon 10"
elif [ "$so" -eq 10 ]; then
	echo "$so bang 10"
else 
	echo "$so nho hon 10"
fi

file_name="data.txt"
if [ -f "$file_name" ]; then
	echo "File $file_name có tồn tại, chuẩn bị đọc nội dung..."
else
    	echo "Lỗi: Không tìm thấy file $file_name"
fi

chuoi="hello"
if [[ "$chuoi" == "hello" && "$so" -eq 15 ]]; then
	echo "ca dieu kien deu dung"
else
	echo "1 trong hai dieu kien sai"
fi

echo "what is your os? (mac/linux/win)?"
read os
case $os in 
	"mac") echo "ban dung mac os";;
	"linux") echo "ban dung linux";;
	*) echo "ban dung he dieu hanh khac";;
esac

