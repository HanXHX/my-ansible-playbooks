#!/bin/bash

ANSIBLE_FORCE_COLOR=true ANSIBLE_HOST_KEY_CHECKING=false PYTHONUNBUFFERED=1 ansible-playbook --private-key=$HOME/.vagrant.d/insecure_private_key --user=vagrant --limit='default' --inventory-file=$PWD/.vagrant/provisioners/ansible/inventory --sudo -vvv --syntax-check playbook.yml
