#!/bin/bash

echo "Total number of folders (including all nested ones) = $(sudo find $1 -type d | wc -l)"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
sudo du -h $1 | sort -hr | cat -n | head -5 | awk  '{printf $1 " - " $3 ", " $2 "\n"}'
echo "Total mumber of files = $(sudo find $1 -type f | wc -l)"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $(sudo find $1 -type f -name "*.conf" | wc -l)"
echo "Text files = $(sudo find $1 -type f -name "*.txt" | wc -l)"
echo "Executable files = $(sudo find $1 -executable -type f | wc -l)"
echo "Log files (with the extension .log) = $(sudo find $1 -type f -name "*.log" | wc -l)"
echo "Archive files = $(sudo find $1 -type f -name "*.zip" -o -name "*.rar" -o -name "*.7z" -o -name "*.7z" -o -name "*.tar" | wc -l)"
echo "Symbolic links = $(sudo find $1 -type l | wc -l)"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
files="$(sudo find $1 -type f -exec du -h {} + | sort -hr | head -10 | cat -n)"
while read param; do
        num=$(echo "$param" | awk '{print $1}')
        size=$(echo "$param" | awk '{print $2}')
        file=$(echo "$param" | awk '{print $3}')
        extension="${file##*.}"
        echo "$num - $file, $size, $extension"
done <<< "$files"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file)"
while read param; do
        num=$(echo "$param" | awk '{print $1}')
        size=$(echo "$param" | awk '{print $2}')
        file=$(echo "$param" | awk '{print $3}')
        hash=$(echo "$(sudo md5sum ${file} | awk '{print $1}')")
        echo "$num - $file, $size, $hash"
done <<< "$files"
end="$(date +%s.%N)"
runtime=$(echo "$end - $2" | bc -l)
echo "Script execution time (in seconds) = $runtime"
