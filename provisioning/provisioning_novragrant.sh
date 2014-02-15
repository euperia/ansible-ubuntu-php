#!/bin/bash

ansible-playbook -i hosts lamp.yml --connection=local
