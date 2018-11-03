#!/bin/bash

cd before-kibit-kibit-workspace
git checkout -- .
time lein kibit --replace kibit &> /dev/null
cd ..

cd before-kibit-teresy-workspace
git checkout -- .
time ~/rooibos-future/main -d . -filter .clj -templates `echo ~/rooibos-future/catalogue/clojure/kibit/collections/* | tr ' ' ','`
cd ..

EQUAL=`./diff-teresy-vs-kibit.sh`

echo "Diffs" ${EQUAL}

cd before-kibit-kibit-workspace
git checkout -- .
cd ..

cd before-kibit-teresy-workspace
git checkout -- .
cd ..
