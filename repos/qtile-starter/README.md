# Qtile Starter 1.0

To make your start with Qtile easy, you can find here a basic installation and configuration script.
The default configuration files are already available in the corresponding folder.
It's a perfect starting point for your customization experiments.

## Requirements

This script requires an Arch Linux based distribution. Tested on Manjaro, EndeavourOS, Arco Linux and Arch Linux.

## Packages

The script will install the following packages:

- Window Manager: Qtile
- Status Bar: Qtile status bar
- Launcher: rofi 
- Terminal: alacritty 
- Notification Service: dunst 
- File Manager: thunar
- Wallpaper: nitrogen
- Icons: ttf-font-awesome

Optionally, you can activate the installation of yay to get access to the AUR.

You can customize the script by adding more packages to the installation commands.

```
# Install packages 
# PLEASE NOTE: Add more packages at the end of the following command
sudo pacman -S qtile xorg xorg-xinit nitrogen thunar picom rofi alacritty dunst chromium neofetch ttf-font-awesome

# Install yay packages
# PLEASE NOTE: Add more packages at the end of the following command
# yay -S pfetch
```

## Installation

```
# git is required
sudo pacman -S git

# Change into your Downloads directory
cd ~/Downloads

# Clone the packages
git clone https://gitlab.com/stephan-raabe/qtile-starter.git

# You can also download the files and unzip it into your home folder

# Change into the folder
cd qtile-starter

# Start the script
./install.sh
```

## Key Bindings

The following custom key bindings are enabled (can be customized in ~/.config/hypr/hyprland.conf)

- <kbd>SUPER</kbd> + <kbd>RETURN</kbd> to start terminal alacritty
- <kbd>SUPER</kbd> + <kbd>Q</kbd> to quit an application
- <kbd>SUPER</kbd> + <kbd>B</kbd> to start browser chromium
- <kbd>SUPER</kbd> + <kbd>CTRL</kbd> + <kbd>Q</kbd> to exit Qtile
- <kbd>SUPER</kbd> + <kbd>E</kbd> to start filemanager thunar
- <kbd>SUPER</kbd></kbd> + <kbd>CTRL</kbd> + <kbd>RETURN</kbd> to start launcher rofi
- <kbd>SUPER</kbd> + <kbd>T</kbd> to toggle floating
- <kbd>SUPER</kbd> + <kbd>F</kbd> to toggle fullscreen
- <kbd>SUPER</kbd> + <kbd>1-9</kbd> to switch workspaces
- more key bindings in ~/.config/qtile/config.py