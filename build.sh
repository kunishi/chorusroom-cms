#!/bin/sh

XALAN_HOME=/usr/local/xalan-j2.1.0
XALAN_CP=${XALAN_HOME}/bin/xalan.jar:${XALAN_HOME}/bin/bsf.jar:${XALAN_HOME}/bin/bsf.jar
RELAXER_CP=/usr/local/share/java/relaxer-0.14.1/Relaxer.jar
CLASSPATH=${XALAN_CP}:${RELAXER_CP}; export CLASSPATH

exec ant $*
