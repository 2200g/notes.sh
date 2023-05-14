#!/bin/sh

echo "notes."

mkdir ~/notes/ > /dev/null 2>&1


halp()
{
	echo "notes.sh is a simple note taking tool."
	echo
	echo "syntax: notes [-n|l|h|r]"
	echo "options:"
	echo "n     make a new note."
	echo "l     list all notes."
	echo "r     delete a note."
	echo "h     print help."
	echo
}

newnote()
{
	read -r -p "name of your note: " name
	echo $name >> ~/notes/$name
	read -r -p "date: " date
	echo $date >> ~/notes/$name
	echo "---" >> ~/notes/$name	
	"${EDITOR:-vim}" ~/notes/$name
}

listnotes()
{
	echo ""
	ls ~/notes/
}

removenote()
{
	rm ~/notes/$rmname && echo "removed $rmname"
}

while getopts ":hnlr:" option; do
	case $option in
		h) 
			halp
			exit;;
		n)
			newnote;;
		l)
			listnotes;;
		r)
			rmname=$OPTARG
			removenote;;
	esac
done

