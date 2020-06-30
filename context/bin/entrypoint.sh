#!/bin/sh


echo "Fetching latest beats src"
cd "$GOPATH/src/github/elastic/beats"
git fetch origin
git rebase "origin/$BEATS_BRANCH"

if [ -d /var/lib/beatbox/extra ]; then
    echo "COPYING EXTRA BEATS..."
fi

exec "${@}"
