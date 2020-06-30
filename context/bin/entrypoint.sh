#!/bin/sh


if [ -d /var/lib/beatbox/extra ]; then
    echo "COPYING EXTRA BEATS..."
fi

exec "${@}"
