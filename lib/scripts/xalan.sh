#!/bin/sh

XALAN_HOME=/usr/local/share/java/xalan-j
CLASSPATH=${XALAN_HOME}/bin/xalan.jar:${XALAN_HOME}/bin/xml-apis.jar:${XALAN_HOME}/bin/xercesImpl.jar
export CLASSPATH
XALAN_CLASS=org.apache.xalan.xslt.Process

java ${XALAN_CLASS} $*
