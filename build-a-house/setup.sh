#!/bin/bash
# Install Ruby for the interactive tutorial
locale-gen en_US.UTF-8
echo "export LANG=en_US.UTF-8" >> /root/.bashrc
echo "export LC_ALL=en_US.UTF-8" >> /root/.bashrc
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
echo locale
apt-get update -qq && apt-get install -y -qq ruby locales 2>/dev/null
echo "Ruby $(ruby --version) installed successfully"
touch /tmp/.ruby-ready
