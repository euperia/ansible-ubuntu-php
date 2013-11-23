#!/bin/bash

## Enable PPA and install Ansible

# from http://www.ansibleworks.com/docs/intro_installation.html#latest-releases-via-apt-ubuntu
add-apt-repository ppa:rquillo/ansible
apt-get update
apt-get install ansible

## Prevent error: "ERROR: problem running ansible_hosts --list ([Errno 8] Exec format error)"
##  see: http://stackoverflow.com/questions/18385925/error-when-running-ansible-playbook
##  see: https://groups.google.com/forum/#!topic/ansible-project/l3MRIiSDwIc

chmod -x hosts
