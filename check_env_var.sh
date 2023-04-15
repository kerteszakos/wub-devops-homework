#!/bin/bash
# Check if environment variable is set, if not throw error
if [[ -z $ISITCURRENTLYFISHY ]]; then
  2>&1 echo "Error: ISITCURRENTLYFISHY environment variable is not set"
#  echo "Error: ISITCURRENTLYFISHY environment variable is not set" >> /dev/stderr
fi
