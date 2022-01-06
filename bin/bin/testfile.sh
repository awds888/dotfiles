#!/bin/bash
echo -e "please input a file, I will check the file's type and directory path and permissions"
read -p "Input a filename:" file
test -z $file && echo "You MUST input a filename." && exit -1
test ! -e $file && echo "This file '$file' Do Not exist!!" && exit 0
test -f $file && filetype="regular file"
test -d $file && filetype="Directory"
test -r $file && fileperm=$fileperm"readable "
test -w $file && fileperm="${fileperm}writable "
test -x $file && fileperm="${fileperm}executable"

echo "$file is a $filetype"
echo -e "and permission is:'$fileperm' \n"
exit 0
