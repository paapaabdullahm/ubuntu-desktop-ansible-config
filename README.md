# ubuntu-desktop-ansibleconfig
A set of Ansible roles for configuring Ubuntu desktop. It installs and configures general, good to have application programs (can be customized if needed), and other tools that are meant for software development and related.                                              

Git and Ansible are the only requirements

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
