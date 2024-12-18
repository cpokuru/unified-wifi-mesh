#!/bin/sh

test -n "$srcdir" || srcdir=`dirname $0`
test -n "$srcdir" || srcdir=.
olddir=`pwd`
cd $srcdir
AUTORECONF=`which autoreconf`

if test -z $AUTORECONF; then
        echo '*** no autoreconf found. please install it ***'
        exit 1
fi

autoreconf --force --install --verbose || exit $?
cd $olddir || exit $?
test -n "$NOCONFIGURE" || "$srcdir/configure" "$@"
