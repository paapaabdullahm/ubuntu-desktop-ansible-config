# Ubuntu Desktop Ansible Config
A set of Ansible roles for configuring Ubuntu (16.04 and above) desktop environment. It automates the installation and configuration of essential, good to have utility programs (can be customized if needed), and other tools that are meant for software development, DevOps and related.                                              

Git and Ansible are the only requirements.

### Install
    $ sudo apt-get install git
    $ git clone https://github.com/pam79/ansible-ubuntu-desktop.git
    $ cd ansible-ubuntu-desktop && ./ansible-installer.sh

### Run the playbook
>enter sudo password when prompted

    $ ansible-playbook desktop.yml --ask-become-pass

### Current roles
- locales
- general
- adapta-theme
- java-openjdk
- zsh
