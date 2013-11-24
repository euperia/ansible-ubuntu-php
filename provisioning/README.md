Ansible config
==============

This is a set of Ansible files to set up a working PHP development environment
on a Ubuntu 12.04 machine (apache, mysql, php).

Ansible is an IT automation tool. It can configure systems, deploy software, and
orchestrate more advanced IT tasks such as continuous deployments or zero
downtime rolling updates.

Docs - http://www.ansibleworks.com/docs/


## Pre-requisite

To setup ansible, execute as root (or with sudo) `setup_ansible.sh`

make sure the `hosts` file is not executable to avoid a cryptic Ansible
error message


## Usage

    ansible-playbook -i hosts lamp.yml


##  License

This code is open-sourced software licensed under the
[MIT license](http://opensource.org/licenses/MIT)
