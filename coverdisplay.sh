#!/bin/bash
#----------------------------------------
#AUTHOR - Niranjan Ravichandra, @nravic
#display cover w/ feh, rotates as slideshow. Place under ncmpcpp "execute_on_song_change."           
#---------------------------------------


pkill feh #kill all instances of feh at the beginning of script

MUSIC_DIR=/mnt/windows/Users/niranjanr/Music/ #mpd music_dir 

tmp_filepath=$(mpc -f %file%) #grab path of currently playing file
#bash string manipulation shenanigans
muspath=${tmp_filepath%%[*}
filepath=$MUSIC_DIR$muspath
path=${filepath//" "/"\ "}
PATH_NO_TRAIL=$(echo "$path" | xargs)

feh -Z --scale-down "$PATH_NO_TRAIL"




	   
