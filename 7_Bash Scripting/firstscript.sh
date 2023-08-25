#!/bin/bash

### This script prints system info ###
echo "Welcome to bash scripting!"
echo

## checking system uptime ##
echo "######################"
echo "The uptime of the system is:"
uptime
echo

## Memory utilization
echo "######################"
echo "Memory utilization"
free -m
echo

## Disk utilization
echo "#######################"
echo "Disk utilization"
df -h
~
