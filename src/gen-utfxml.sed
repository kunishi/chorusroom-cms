#!/usr/bin/sed -f
s,\(<!ENTITY % utfspecial \)"IGNORE"\(.*\)$,\1"INCLUDE"\2,
s,\(<!ENTITY % ascspecial \)"INCLUDE"\(.*\)$,\1"IGNORE"\2,
