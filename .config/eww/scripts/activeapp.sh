#!/usr/bin/bash

while true; do
    # Get the current status of the media player
    player_status=$(playerctl metadata --format '{{status}}')
    
    if [ "$player_status" == "Playing" ]; then
        # Get the current artist and title
        song_info=$(playerctl metadata --format '{{artist}} - {{title}}')
        echo "$song_info"
    else
        # Get the active window name
        window_name=$(xdotool getwindowfocus getwindowname)
        echo "$window_name"
    fi

    # Delay between checks to avoid overloading the system
    sleep 1
done
