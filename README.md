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

<table width="100%">
    <tr>
        <th width="25%">Role</th>
        <th width="40%">Description</th>
        <th width="35%">Customizations</th>
    </tr>
    <!--------------------------------------------------->
    <tr><td width="100%" colspan=3><b>COMMON</b></td></tr>
    <!--------------------------------------------------->
    <tr>
        <td width="25%"><i>locales</i></td>
        <td width="40%">
         A set of parameters that defines the user's language, region and any special variant preferences. The role takes an existing locale file located at <i>locale/files</i> customized or not (e.g. <i>ak_GH</i>, <i>en_GH</i>, <i>en_US</i>, <i>de_NL</i>) and sets it as the default locale for your system.
        </td>
        <td width="35%">
         en_GH and Africa/Accra are the default locales provided. Replace them with your own if your language and timezone are different. The default configuration is located at: <i>locales/defaults/main.yml</i>
        </td>
    </tr>
    <tr>
        <td width="25%"><i>essentials</i></td>
        <td width="40%">
         Provides the most basic libraries that are globally required by most packages.
        </td>
        <td width="35%">
         Packages can be added or removed from the list. Also with GNOME 3 PPA added nautilus is automatically upgraded.
        </td>
    </tr>
    <tr>
        <td width="25%"><i>git</i></td>
        <td width="40%">
         Git is a version control system for tracking changes in computer files and coordinating work on those files among multiple people.
        </td>
        <td width="35%">
         You should modify the default git global config values found in <i>git/defaults/main.yml</i>
        </td>
    </tr>
    <tr>
        <td width="25%"><i>oh-my-zsh</i></td>
        <td width="40%">
          An open source, community-driven framework for managing your zsh configuration.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>java-openjdk</i></td>
        <td width="40%">
          A free and open source implementation of the Java Platform, Standard Edition (Java SE).
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>google-chrome</i></td>
        <td width="40%">
          A freeware web browser developed by Google.
        </td>
        <td width="35%">
          To import your bookmarks, include a <i>bookmarks.html</i> file at the following location: <i>google-chrome/files</i>. You can also customize which extensions get installed by modifying <i>google-chrome/tasks/main.yml</i> file.
        </td>
    </tr>
    <!------------------------------------------------>
    <tr><td width="100%" colspan=3><b>DEV</b></td></tr>
    <!------------------------------------------------>
    <tr>
        <td width="25%"><i>apache-maven</i></td>
        <td width="40%">
          A software project management and comprehension tool.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>atom</i></td>
        <td width="40%">
          A free and open-source text and source code editor.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>dia</i></td>
        <td width="40%">
          A free and open source general-purpose diagramming software.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>docker</i></td>
        <td width="40%">
          A computer program that performs operating-system-level virtualization also known as containerization.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>docker-images</i></td>
        <td width="40%">
          Pulls docker images onto your desktop for later use. The role also creates aliases for the downloaded images.
        </td>
        <td width="35%">
          The default shell config file for the aliases is <i>.zshrc</i>. Change this to .bashrc if you have disabled <i>oh-my-zsh</i> role.
        </td>
    </tr>
    <tr>
        <td width="25%"><i>jetbrains-idea</i></td>
        <td width="40%">
          Intellij IDEA is an IDE for developing computer software. It is developed by JetBrains, and is available as a community edition, and a proprietary commercial edition.
        </td>
        <td width="35%">
          The default edition is <i>ultimate</i>. you can change to <i>community</i> if you don't have a commercial license.
        </td>
    </tr>
    <tr>
        <td width="25%"><i>jetbrains-idea-plugins</i></td>
        <td width="40%">
          Intellij IDEA IDE Plugins. The plugin repository is provided at <a href="http://plugins.jetbrains.com/idea">plugins.jetbrains.com/idea</a>
        </td>
        <td width="35%">
          You can add or remove plugins from the following location: <i>idea&#x2011;plugins/defaults/main.yml</i>. You need the <i>id</i> of a plugin if you want to add it to the list. To do this search for the plugin's github repo and look for the &lt;id&gt; tag inside the <i>META&#x2011;INF/plugin.xml</i> file.
        </td>
    </tr>
    <tr>
        <td width="25%"><i>smartgit</i></td>
        <td width="40%">
          A Git client for Windows, Mac and Linux. It is free for non-commercial use, provides a graphical access to Git repositories and can access Subversion repositories.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>sublime</i></td>
        <td width="40%">
          A proprietary cross-platform source code editor  with a Python API.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>virtualbox</i></td>
        <td width="40%">
          A free and open-source hypervisor for x86 computers currently being developed by Oracle Corporation.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>vagrant</i></td>
        <td width="40%">
          An open-source software  product for building and maintaining portable virtual software development environments.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>mini-kube</i></td>
        <td width="40%">
          A tool that makes it easy to run Kubernetes locally.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <!-------------------------------------------------->
    <tr><td width="100%" colspan=3><b>UTILS</b></td></tr>
    <!-------------------------------------------------->
    <tr>
        <td width="25%"><i>brave</i></td>
        <td width="40%">
          Brave is a free and open-source web browser based on the Chromium web browser and its Blink engine, announced by the co-founder of the Mozilla project and creator of JavaScript, Brendan Eich.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>calibre</i></td>
        <td width="40%">
          A powerful and easy to use e-book manager.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>gnome3-desktop</i></td>
        <td width="40%">
          A desktop environment which uses GNOME Shell engine and is composed of free and open-source software that runs on Linux and most BSD derivatives.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>gnome-user-share</i></td>
        <td width="40%">
          A session service that enables easy sharing of files between several computers.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>gnome-chess</i></td>
        <td width="40%">
          A 2D chess game, where games can be played between a combination of human and computer players.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>gnucash</i></td>
        <td width="40%">
          A personal and small-business financial-accounting software.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>rambox</i></td>
        <td width="40%">
          Free, Open Source and Cross Platform messaging and emailing app that combines common web applications into one.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>wavebox</i></td>
        <td width="40%">
          Similar to Rambox, Wavebox lets you bring all your web communication tools together for faster, smarter working.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>xdman</i></td>
        <td width="40%">
          A powerful tool to increase download speed up-to 500%.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>inkscape</i></td>
        <td width="40%">
          A free and open-source vector graphics editor; it can be used to create or edit vector graphics such as illustrations, diagrams, line arts, charts, logos and complex paintings.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>kdenlive</i></td>
        <td width="40%">
          A free and open-source video editing software based on the MLT Framework, KDE and Qt.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>keepass-xc</i></td>
        <td width="40%">
          A cross-platform password manager that allows you to store all of your passwords in one location.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>rosegarden</i></td>
        <td width="40%">
          A free software digital audio workstation program developed for Linux with ALSA and Qt4.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>simple-screen-recorder</i></td>
        <td width="40%">
          A Qt-based screencast software made for Linux operating systems, which was created as a simpler alternative to programs such as ffmpeg/avconv and VLC.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>sound-converter</i></td>
        <td width="40%">
          A free and open-source transcoder for digital audio files. It uses GStreamer for input and output files. It has multi threaded design and can also extract the audio from videos.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>sound-juicer</i></td>
        <td width="40%">
          A GTK+-based graphical front-end to the cdparanoia CD ripping library.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>gnome-tweak-tool</i></td>
        <td width="40%">
          A configuration tool to enable customization of advanced options for GNOME 3.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
    <tr>
        <td width="25%"><i>unity-tweak-tool</i></td>
        <td width="40%">
          A configuration tool for the Unity Desktop.
        </td>
        <td width="35%">
          &nbsp;
        </td>
    </tr>
</table>
