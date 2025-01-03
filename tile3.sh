#!/bin/bash

# Author : Yec'han Laizet

if [ $# -eq 1 ] || [ $# -eq 2 ]
then
    if [ $# -eq 2 ]
    then
        # Left side panel size used as OFFSET
        left_offset=$2
    else
        left_offset=0
    fi

    # Get screen resolution
    resolution=$(xrandr | grep '*' | awk '{print $1}')
    width=$(echo $resolution | cut -d'x' -f1)
    height=$(echo $resolution | cut -d'y' -f1)

    # Apply left side panel offset
    width=$((width - left_offset))
    # Calculate third sizes
    third_width=$((width / 3))
    two_third_width=$((third_width * 2))

    # Default geometry
    winx=-1
    winy=-1
    winw=-1
    winh=-1

    # Left tiling
    if [ "$1" = "L" ]
    then
        winx=$((0 + left_offset))
        winy=-1
        winw=$third_width
        winh=-1
    # Center tiling
    elif [ "$1" = "C" ]
    then
        winx=$((third_width + left_offset))
        winy=-1
        winw=$third_width
        winh=-1
    # Right tiling
    elif [ "$1" = "R" ]
    then
        winx=$((two_third_width + left_offset))
        winy=-1
        winw=$third_width
        winh=-1
    fi

    # Apply new geometry
    wmctrl -r :ACTIVE: -e 0,$winx,$winy,$winw,$winh
    #wmctrl -r :ACTIVE: -b remove,maximized_horz -e 0,$winx,$winy,$winw,$winh # trial to apply on maximized windows but do not work

# Help message
else
    echo "Move and resize active window to a third of the screen horizontaly."
    echo
    echo "Usage: `basename $0` POS OFFSET"
    echo
    echo "  POS = target position L|C|R for left, center or right."
    echo "  Optionnal parameter:"
    echo "    OFFSET = left side panel width to deduce for window width calculation. Defaults is 0."
fi
