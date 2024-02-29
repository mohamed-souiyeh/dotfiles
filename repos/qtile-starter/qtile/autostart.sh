#!/bin/bash
#   ___ _____ ___ _     _____   ____  _             _    
#  / _ \_   _|_ _| |   | ____| / ___|| |_ __ _ _ __| |_  
# | | | || |  | || |   |  _|   \___ \| __/ _` | '__| __| 
# | |_| || |  | || |___| |___   ___) | || (_| | |  | |_  
#  \__\_\|_| |___|_____|_____| |____/ \__\__,_|_|   \__| 
#                                                        
# ----------------------------------------------------- 

# My screen resolution
# xrandr --rate 120

# For Display Port
# xrandr --output DP-1 --mode 1920x1080

# For Virtual Machine 
# xrandr --output Virtual-1 --mode 1920x1080

# Set Keyboard Layout
setxkbmap de

# Start picom
picom &

# Load notification service
dunst &

# Restore wallpaper
nitrogen --restore &
