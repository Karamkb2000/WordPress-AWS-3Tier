#!/bin/bash

sudo su
if [ ! -d "/tmp/wordpress" ]; then
  cd /tmp
  curl -O https://wordpress.org/latest.tar.gz
  tar -xzf latest.tar.gz
fi




