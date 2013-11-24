Ansible config
==============

This is a set of Ansible files.

Ansible is an IT automation tool. It can configure systems, deploy software, and
orchestrate more advanced IT tasks such as continuous deployments or zero
downtime rolling updates.

Docs - http://www.ansibleworks.com/docs/


## Pre-requisite

To setup ansible, execute setup_ansible.sh

make sure the `hosts` file is not executable to avoid cryptic ansible error message


## Example Usage

    ansible-playbook -i hosts lamp.yml
