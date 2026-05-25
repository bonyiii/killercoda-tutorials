#!/bin/bash
echo "Locale beállítása (en_US.UTF-8)..."
locale-gen en_US.UTF-8
update-locale LANG=en_US.UTF-8 LC_ALL=en_US.UTF-8
echo "export LANG=en_US.UTF-8" >> /root/.bashrc
echo "export LC_ALL=en_US.UTF-8" >> /root/.bashrc
echo "export RUBYOPT=-Eutf-8:utf-8" >> /root/.bashrc
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export RUBYOPT=-Eutf-8:utf-8
echo "Locale kész."