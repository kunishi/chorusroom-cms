#!/bin/sh

XALAN_HOME=/usr/local/share/java/xalan-j-2.3.1
XALAN_CP=${XALAN_HOME}/bin/xml-apis.jar:${XALAN_HOME}/bin/xercesImpl.jar:${XALAN_HOME}/bin/xalan.jar
RELAXER_CP=/usr/local/share/java/relaxer-0.16.0/Relaxer.jar
REGEXP_CP=/usr/local/share/java/classes/jakarta-regexp.jar
CLASSPATH=${XALAN_CP}:${REGEXP_CP}:${RELAXER_CP}; export CLASSPATH

exec ant $*
