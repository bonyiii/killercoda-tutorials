#!/bin/bash
# Install Ruby for the interactive tutorial
apt-get update -qq && apt-get install -y -qq ruby 2>/dev/null
echo "Ruby $(ruby --version) installed successfully"
touch /tmp/.ruby-ready
