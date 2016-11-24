#!/bin/bash

source includes/versions
source includes/functions.sh

source mailcow.config

checkports
checkconfig

installtask installpackages
