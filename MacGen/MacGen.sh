#!/bin/bash

A=$(for a in $(seq 1 6); do printf '%02x:' $(($RANDOM&0xff)); done)
echo ${A%?}
