#!/bin/sh

if [ `uname -o` = 'Cygwin' ]; then
   DRIVE="c:"
   JAVAC=$JAVA_HOME/bin/javac
else
   JAVAC=javac
fi

RELAXERLIBDIR=$DRIVE/usr/local/lib/relaxer
ANTLIBDIR=$DRIVE/usr/local/share/java/apache-ant/lib

RELAXERCP=${RELAXERLIBDIR}/Relaxer.jar:${RELAXERLIBDIR}/RelaxerOrg.jar:${RELAXERLIBDIR}/isorelax.jar:${RELAXERLIBDIR}/relaxngDatatype.jar:${RELAXERLIBDIR}/xerces.jar:${RELAXERLIBDIR}/xsdlib.jar
ANTCP=${ANTLIBDIR}/ant.jar

$JAVAC -classpath .:${RELAXERCP}:${ANTCP} org/chorusroom/ant/*.java
