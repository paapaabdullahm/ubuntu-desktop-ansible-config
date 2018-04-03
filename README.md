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
>You can disable a role by commenting it out in desktop.yml playbook. All paths are relative to the `roles` directory, unless otherwise stated.

Role                    | Description                 | Customizations      
:---------------------- | :-------------------------- | :----------------------
<tr><th colspan=3>Common</th></tr> **Role**|**Description**|**Customizations**|
*locales* | A set of parameters that defines the user's language, region and any special variant preferences. The role takes an existing locale file located at _locale/files_ customized or not (e.g. _ak_GH_, _en_GH_, _en_US_, _de_NL_) and sets it as the default locale for your system. | en_GH and Africa/Accra are the default locales provided. Replace them with your own if your language and timezone are different. The default configuration is located at: _locales/defaults/main.yml_
*essentials* | Provides the most basic libraries that are globally required by most packages. | Packages can be added or removed from the list. Also with GNOME 3 PPA added nautilus is automatically.
*git* | Git is a version control system for tracking changes in computer files and coordinating work on those files among multiple people. | You should modify the default git global config values found in _git/defaults/main.yml_
*oh-my-zsh* | | 
*java-openjdk* | | 
*google-chrome* | A freeware web browser developed by Google. | To import your bookmarks, include a _bookmarks.html_ file at the following location: _google-chrome/files_. You can also customize which extensions get installed by modifying _google-chrome/tasks/main.yml_ file.
|&nbsp;|&nbsp;|<tr><th colspan=3>Dev</th></tr>
*apache-maven* | A software project management and comprehension tool.
*atom* | A free and open-source text and source code editor.
*dia* | A free and open source general-purpose diagramming software.
*docker* | Docker is a computer program that performs operating-system-level virtualization also known as containerization.
*docker-images* | |
*jetbrains-idea* | |
*jetbrains-idea-plugins* | Intellij IDEA IDE Plugins. The plugin repository is provided at [plugins.jetbrains.com/idea](http://plugins.jetbrains.com/idea) | You can add or remove plugins from the following location: _idea&#x2011;plugins/defaults/main.yml_. You need the _id_ of a plugin if you want to add it to the list. To do this search for the plugin's github repo and look for the <id> tag inside the _META&#x2011;INF/plugin.xml_ file.
*smartgit* | |
*sublime* | |
*virtualbox* | |
*vagrant* | |
*mini-kube* | |
|&nbsp;|&nbsp;|<tr><th colspan=3>Utils</th></tr>
*brave* | Brave is a free and open-source web browser based on the Chromium web browser and its Blink engine, announced by the co-founder of the Mozilla project and creator of JavaScript, Brendan Eich.
*calibre* | A powerful and easy to use e-book manager.
*gnome3-desktop* | 
*gnome&#x2011;user&#x2011;share* | A session service that enables easy sharing of files between several computers.
*gnome-chess* | GNOME Chess is a 2D chess game, where games can be played between a combination of human and computer players.
*gnucash* | A personal and small-business financial-accounting software.



