#!/bin/sh


export PATH=$PATH:/usr/lib/go-1.13/bin:$GOPATH/bin

if [ -d /var/lib/beatbox/extra ]; then
    echo "COPYING EXTRA BEATS..."
fi

exec "${@}"
