#!/bin/sh

if [ x"$1" == x ] ; then
    echo "Version number not specified."
    exit 1
fi

sed -ie 's/version=".*",/version="'"$1"'",/' setup.py
sed -ie "s/__version__ = '.*'/__version__ = '$1'/" mkosi

git add -p setup.py mkosi

git commit -m "bump version numbers for v$1"

git tag -s "v$1" -m "mkosi $1"
