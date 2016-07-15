#!/bin/bash

#----------------------------------------
#AUTHOR - Niranjan Ravichandra, @nravic
#wkhtmltopdf wrapper for multiple html input and other oddities
#requires wkhtmltopdf with patched QT library
#----------------------------------------

echo "Enter webpage url to download and save as pdf, followed by [ENTER]:"
read url
echo "Enter name to save pdf as, followed by [ENTER]:"
read output

wget -r --no-parent -P temp_dir/ $url && cd "$_" > /dev/null 2&>1
temp=""
for i in $(find -name *.html)
do
    temp="$temp $i"
done

wkhtmltopdf $temp ${output}.pdf
rm -r temp_dir
