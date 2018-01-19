#!/bin/bash

# Install ansible
if ! grep -q "ansible/ansible" /etc/apt/sources.list /etc/apt/sources.list.d/*; then
    echo "Adding Ansible PPA..."
    sudo apt-add-repository -y ppa:ansible/ansible
fi

if ! hash ansible >/dev/null 2>&1; then
    echo "Installing Ansible..."
    sudo apt update
    sudo apt install -y software-properties-common ansible git python-apt
else
    echo "Ansible already installed"
fi

# Show run process
echo "\nCustomize the playbook desktop.yml"
echo "to suit your needs, then run ansible in cwd with:"
echo "  ansible-playbook desktop.yml --ask-become-pass \n"