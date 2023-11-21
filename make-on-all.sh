#!/bin/sh

if [ -x /bin/bash ] ; then
	THIS_IS_BASH="/bin/bash"
else
	THIS_IS_BASH="/usr/bin/env bash"
fi

SRC="$1"
PROG="$2"

set -x
sed < "$SRC" > "$PROG" -e '1s|/bin/bash|'"$THIS_IS_BASH"'|'
chmod +x "$PROG"
