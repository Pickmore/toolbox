#!/bin/sh
#convert current dir, no recursion
if [ $# -lt 2 ];then
    echo "usage: $0 dir fileext"
    echo "example:"
    echo "$0 ./ cpp"
    exit 5
fi
path_split="/"
file_dir=${1%*/}
file_dir=$file_dir$path_split
for file in `ls $1 |grep .$2`
do
    filepath=$file_dir$file
    if [ -f $filepath ]; then
        echo "conv $filepath"
        iconv -f gbk -t utf8 -o $filepath $filepath
    fi
done
echo "done"
