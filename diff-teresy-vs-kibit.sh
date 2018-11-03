#!/bin/bash

cd before-kibit-kibit-workspace

find . -name "*.clj" |\
 xargs -L 1 -I % \
 diff -y --suppress-common-lines % ../before-kibit-teresy-workspace/% 

cd --
