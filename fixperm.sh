#!/bin/sh

BUILDDIR=build/html

find ${BUILDDIR} -type d -exec chmod 755 '{}' ';'
find ${BUILDDIR} -type f -exec chmod 644 '{}' ';'
