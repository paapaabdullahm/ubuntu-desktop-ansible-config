# Ubuntu Desktop Ansible Config
A set of Ansible roles for configuring Ubuntu lts (16.04 and above) desktop environment. It automates the installation and configuration of essential, good to have utility programs (can be customized if needed), and other utility tools that are meant for Software Development, DevOps and related.                                              

Git and Ansible are the only requirements.

### Install requirements
    $ sudo apt install git
    $ git clone https://github.com/pam79/ubuntu-desktop-ansible-config.git
    $ cd ubuntu-desktop-ansible-config && source ./ansible-setup.sh

### Run the playbook in cwd
Before you run the playbook, it is highly recommended that you go through the "Available roles" section below and see which roles require some customization from your end. This information is provided because of the fact that the defaults may not be adequate enough for all circumstances.

>Enter your sudo password when prompted

    $ ansible-playbook desktop.yml --ask-become-pass

### Available roles
Some roles that are currently not available have been commented out with a single hash (#) in desktop.yml playbook. Others that are available but disabled have double hashes (##) in front of them. Feel free to enable them if you want by removing the double hashes.           

>Unless otherwise stated, all paths are relative to the roles directory.

Role                    | Description                 | Customization Options      
:---------------------- | :-------------------------- | :----------------------
_locales_ | A set of parameters that defines the user's language, region and any special variant preferences. The role takes an existing locale file located at `locale/files` - customized or not (e.g. `ak_GH`, `en_GH`, `en_US`, `de_NL`) and sets it as the default locale for your system. | `en_GH` and `Africa/Accra` are the defaults provided. Replace them with your own if your language and timezone are different.
_essentials_ | Provides the most basic libraries that are globally required by most packages. | Can add or subtract from the list.
|.||<tr><td colspan=3><center>**title**
_apache&#x2011;maven_ | A software project management and comprehension tool.
_atom_ | A free and open-source text and source code editor | 
_brave_ | Brave is a free and open-source web browser based on the Chromium web browser and its Blink engine, announced by the co-founder of the Mozilla project and creator of JavaScript, Brendan Eich. | 

[//]: # (This may be the most platform independent comment) tyfytfftyjfty
