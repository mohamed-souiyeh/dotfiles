# dotfiles
this is my dotfiles and system configuration repo


### Install

This playbook includes a custom shell script located at `bin/dotfiles`. This script is added to your $PATH after installation and can be run multiple times while making sure any Ansible dependencies are installed and updated.

This shell script is also used to initialize your environment after performing a full system upgrade.

> NOTE: You must follow required steps before running this command or things may become unusable until fixed.

```bash
$ bash -c "$(curl -fsSL https://raw.githubusercontent.com/mohamed-souiyeh/dotfiles/master/bin/dotfiles)"
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