#!/bin/bash

#################################################################################################
# AUTHOR - Niranjan Ravichandra, @nravic						        #
# Uses youtube-dl to download a video as audio (in best possible quality), and then uses ffmpeg #
# to trim it to desired length. 							        #
#################################################################################################

youtube_url="$1"
input_output="$2"
trim_start="$3"
youtube-dl --extract-audio --audio-format best --audio-quality 0 -o "$input_output.trim.%(ext)s" "$youtube_url"
if [ -f "$input_output.trim.m4a" ]
then
    ffmpeg -i $input_output.trim.m4a -ss $trim_start -acodec copy $input_output.m4a
    rm $input_output.trim.m4a
else
    ffmpeg -i $input_output.trim.opus -ss $trim_start -acodec copy $input_output.opus
    rm $input_output.trim.opus
fi

exit
