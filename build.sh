#!/bin/sh

XALAN_HOME=/usr/local/share/java/xalan-j/bin
XALAN_CP=${XALAN_HOME}/xml-apis.jar:${XALAN_HOME}/xercesImpl.jar:${XALAN_HOME}/xalan.jar
RELAXER_CP=/usr/local/share/java/relaxer-0.16.0/Relaxer.jar
REGEXP_CP=/usr/local/share/java/classes/jakarta-regexp.jar
CLASSPATH=${XALAN_CP}:${REGEXP_CP}:${RELAXER_CP}; export CLASSPATH

exec ant $*
