#!/usr/bin/sed -f
s,\(<!ENTITY % utfdoc \)"IGNORE"\(.*\)$,\1"INCLUDE"\2,
s,\(<!ENTITY % ascdoc \)"INCLUDE"\(.*\)$,\1"IGNORE"\2,
