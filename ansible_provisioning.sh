#!/bin/bash

ansible-playbook -i /vagrant/provisioning/hosts /vagrant/provisioning/lamp.yml --connection=local
