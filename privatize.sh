#!/usr/bin/env bash
#
# Prepend helper functions with a single underscore
# to avoid polluting completion space

TARGET_FILES="nvm.sh bash_completion"
PRIVATE_FN='\b(nvm_[\w_]+)'

ack -o $PRIVATE_FN $TARGET_FILES

perl -p -i -e "s/${PRIVATE_FN}/_\1/g" $TARGET_FILES
# perl -p -i -e "s/${PRIVATE_FN}/_\1/g" $(ack -l $PRIVATE_FN)

ack -l $PRIVATE_FN $TARGET_FILES
