#!/bin/bash


dpkg --clear-selections
dpkg --set-selections < Minimal.txt
dpkg --purge dselect-upgrade

#### To construct list
# use deborphan -av Keep your real needs 
###################

