#!/bin/bash

gnome-terminal --working-directory="$HOME/etc/init.d/" -x bash -c 'cd /etc/init.d/; ./logoff.sh; exec bash'
