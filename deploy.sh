#!/bin/bash

git clone https://github.com/Artemmkin/reddit.git
source ~/.rvm/scripts/rvm
cd reddit && bundle install
puma -d
