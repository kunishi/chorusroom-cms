#!/bin/sh

XALAN_HOME=/usr/local/xalan-j2.1.0
CLASSPATH=${XALAN_HOME}/bin/xerces.jar:${XALAN_HOME}/bin/xalan.jar:${XALAN_HOME}/bin/bsf.jar
export CLASSPATH
XALAN_CLASS=org.apache.xalan.xslt.Process

JAVA=/usr/local/bin/javavm

${JAVA} ${XALAN_CLASS} $*
