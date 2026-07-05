#!/usr/bin/env bash

source lib/system.sh

echo "Hostname    : $(get_hostname)"
echo "OS          : $(get_os)"
echo "Environment : $(get_environment)"
echo "SSH Title   : $(get_github_key_title)"
