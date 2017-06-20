#!/bin/bash

while true; do
	find ~/pictures/wallpapers/feh_rotate -type f \( -name '*.jpg' -o -name '*.png' \) -print0 |
		shuf -n1 -z | xargs -0 feh --bg-fill
	sleep 10m
done

