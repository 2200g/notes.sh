#!/bin/sh

echo "notes."

mkdir ~/notes/ > /dev/null 2>&1

read -r -p "name of your note: " name
echo $name >> ~/notes/$name
read -r -p "date: " date
echo $date >> ~/notes/$name
echo "---" >> ~/notes/$name 

"${EDITOR:-vim}" ~/notes/$name
