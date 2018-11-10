#!/bin/bash

cd before-kibit-kibit-workspace
git checkout -- .
time lein kibit --replace kibit 
cd ..

cd before-kibit-teresy-workspace
git checkout -- .
time ~/rooibos-future/main -d . -filter .clj -templates `echo ~/rooibos-future/catalogue/clojure/kibit/{collections,equality}/* | tr ' ' ','`
cd ..

EQUAL=`./diff-teresy-vs-kibit.sh`

printf "Diffs\n"
echo "${EQUAL}"

cd before-kibit-kibit-workspace
git checkout -- .
cd ..

cd before-kibit-teresy-workspace
git checkout -- .
cd ..
