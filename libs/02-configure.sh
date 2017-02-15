#!/bin/bash

DEFAULT_DIR=${1:-"/vagrant/libs/conf"}

# install config file
cp $DEFAULT_DIR/ietd.conf /etc/ietd/ietd.conf
cp $DEFAULT_DIR/iscsitarget /etc/default/iscsitarget

# iscsi restart
/etc/init.d/iscsitarget restart
