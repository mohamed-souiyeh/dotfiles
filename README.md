# dotfiles
this is my dotfiles and system configuration repo

- [ ] still need to configure my ssh stuff after setup and cloning
- [ ] write a proper README


## Qtile Key Bindings

The following custom key bindings are enabled (can be customized in ~/.config/hypr/hyprland.conf)

- <kbd>SUPER</kbd> + <kbd>RETURN</kbd> to start terminal kitty
- <kbd>SUPER</kbd> + <kbd>Q</kbd> to quit an application
- <kbd>SUPER</kbd> + <kbd>B</kbd> to start browser Brave
- <kbd>SUPER</kbd> + <kbd>CTRL</kbd> + <kbd>Q</kbd> to exit Qtile
- <kbd>SUPER</kbd></kbd> + <kbd>CTRL</kbd> + <kbd>RETURN</kbd> to start launcher rofi
- <kbd>SUPER</kbd> + <kbd>T</kbd> to toggle floating
- <kbd>SUPER</kbd> + <kbd>F</kbd> to toggle fullscreen
- <kbd>SUPER</kbd> + <kbd>1-9</kbd> to switch workspaces
- more key bindings in ~/.config/qtile/config.py

### Install

This playbook includes a custom shell script located at `bin/dotfiles`. This script is added to your $PATH after installation and can be run multiple times while making sure any Ansible dependencies are installed and updated.

This shell script is also used to initialize your environment after performing a full system upgrade.

> NOTE: You must follow required steps before running this command or things may become unusable until fixed.

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/mohamed-souiyeh/dotfiles/master/bin/dotfiles)"
```

### Update

To update your environment run the `dotfiles` command in your shell:

```bash
$ dotfiles
```

This will handle the following tasks:

- Verify Ansible is up-to-date
- Generate SSH keys and add to `~/.ssh/authorized_keys`
- Clone this repository locally to `~/.dotfiles`
- Verify any `ansible-galaxy` plugins are updated
- Run this playbook with the values in `~/.config/dotfiles/values.yaml`