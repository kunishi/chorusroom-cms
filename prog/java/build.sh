#!/bin/sh
RELAXERLIBDIR=/usr/local/lib/relaxer
ANTLIBDIR=/usr/local/share/java/apache-ant/lib

RELAXERCP=${RELAXERLIBDIR}/Relaxer.jar:${RELAXERLIBDIR}/RelaxerOrg.jar:${RELAXERLIBDIR}/isorelax.jar:${RELAXERLIBDIR}/relaxngDatatype.jar:${RELAXERLIBDIR}/xerces.jar:${RELAXERLIBDIR}/xsdlib.jar
ANTCP=${ANTLIBDIR}/ant.jar

javac -classpath .:${RELAXERCP}:${ANTCP} org/chorusroom/ant/*.java
