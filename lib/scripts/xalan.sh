#!/bin/sh

XALAN_HOME=/usr/local/share/java/xalan-j-2.3.1
CLASSPATH=${XALAN_HOME}/bin/xalan.jar:${XALAN_HOME}/bin/xml-apis.jar:${XALAN_HOME}/bin/xercesImpl.jar
export CLASSPATH
XALAN_CLASS=org.apache.xalan.xslt.Process

JAVA=/usr/local/bin/javavm

${JAVA} ${XALAN_CLASS} $*
