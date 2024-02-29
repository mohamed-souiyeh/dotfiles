# Hyprland Starter 2.0

To make your start with Hyprland easy, you can find here a basic installation and configuration script.
The default configuration files are already available in the corresponding folder.
It's a perfect starting point for your customization experiments.

## Requirements

This script requires an Arch Linux based distribution. Tested on Manjaro, EndeavourOS, Arco Linux and Arch Linux.

NVIDIA installation for Hyprland is not covered in this script. Please read: https://wiki.hyprland.org/Nvidia/

## Packages

The script will install the following packages:

- Window Manager: hyprland 
- Status Bar: waybar 
- Launcher: rofi 
- Launcher: wofi #optional
- Terminal: kitty #optional
- Terminal: alacritty 
- Notification Service: dunst 
- File Manager: dolphin 
- xdg-desktop-portal-hyprland 
- qt5-wayland 
- qt6-wayland 
- Wallpaper: hyprpaper
- Icons: ttf-font-awesome

Optionally, you can activate the installation of yay to get access to the AUR.

You can customize the script by adding more packages to the installation commands.

```
# Install packages 
# PLEASE NOTE: Add more packages at the end of the following command
sudo pacman -S hyprland waybar rofi wofi kitty alacritty dunst dolphin xdg-desktop-portal-hyprland qt5-wayland qt6-wayland hyprpaper chromium ttf-font-awesome

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
git clone https://gitlab.com/stephan-raabe/hyprland-starter.git

# You can also download the files and unzip it into your home folder

# Change into the folder
cd hyprland-starter

# Start the script
./install.sh
```

## Key Bindings

The following custom key bindings are enabled (can be customized in ~/.config/hypr/hyprland.conf)

- <kbd>SUPER</kbd> + <kbd>RETURN</kbd> to start terminal alacritty
- <kbd>SUPER</kbd> + <kbd>Q</kbd> to quit an application
- <kbd>SUPER</kbd> + <kbd>B</kbd> to start browser chromium
- <kbd>SUPER</kbd> + <kbd>M</kbd> to exit Hyprland
- <kbd>SUPER</kbd> + <kbd>E</kbd> to start filemanager dolphin
- <kbd>SUPER</kbd></kbd> + <kbd>CTRL</kbd> + <kbd>RETURN</kbd> to start launcher rofi
- <kbd>SUPER</kbd> + <kbd>T</kbd> to toggle floating
- <kbd>SUPER</kbd> + <kbd>F</kbd> to toggle fullscreen
- <kbd>SUPER</kbd> + <kbd>1-9</kbd> to switch workspaces
- more key bindings in ~/.config/hypr/hyprland.conf

