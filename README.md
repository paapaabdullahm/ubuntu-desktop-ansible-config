# Ubuntu Desktop Ansible Config
A set of Ansible roles for configuring Ubuntu lts (16.04 and above) desktop environment. It automates the installation and configuration of essential, good to have utility programs (can be customized if needed), and other utility tools that are meant for Software Development, DevOps and related.                                              

Git and Ansible are the only requirements.

### Install requirements
    $ sudo apt install git
    $ git clone https://github.com/pam79/ubuntu-desktop-ansible-config.git
    $ cd ubuntu-desktop-ansible-config && source ./ansible-setup.sh

### Run the playbook in cwd
>Enter your sudo password when prompted

    $ ansible-playbook desktop.yml --ask-become-pass

### Available roles
>All roles currently not available are commented out in desktop.yml playbook.

Role                    | Description                 | Custom Options      
:---------------------- | :-------------------------- | :-------------------
_locales_ | Takes an existing locale file - customized or not (e.g. `ak_GH`, `en_GH`, `en_US`, `de_NL`) and sets it as the default locale for your system. | Replace the provided locale with your own if your local is different.
_essentials_ | gasdgasggsgghdggggsdgsg | ghfhdfhhhhhhhhhhhh
_apache&#x2011;maven_ | gasdgasggsgghdggggsdgsg | ghfhdfhhhhhhhhhhhh

