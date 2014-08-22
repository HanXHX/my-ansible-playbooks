#!/bin/bash

ANSIBLE_FORCE_COLOR=true ANSIBLE_HOST_KEY_CHECKING=false PYTHONUNBUFFERED=1 ansible-playbook --private-key=/home/hanx/.vagrant.d/insecure_private_key --user=vagrant --limit='default' --inventory-file=/home/hanx/dev/my-ansible-playbooks/.vagrant/provisioners/ansible/inventory --sudo -vvv --syntax-check playbook.yml
