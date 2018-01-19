# Ansible Ubuntu Desktop
Ansible configurations for Ubuntu desktop
Git and Ansible are the only requirements

### Install
    $ sudo apt-get install git
    $ git clone https://github.com/pam79/ansible-ubuntu-desktop.git`
    $ cd ansible-ubuntu-desktop && ./ansible-installer.sh

### Run the playbook
>enter sudo password when prompted

`$ ansible-playbook desktop.yml --ask-become-pass`

### Current roles
- locales
- general
- adapta-theme
- java-openjdk
- zsh
