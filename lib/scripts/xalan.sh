#!/bin/sh

XALAN_HOME=/usr/local/xalan-j2.1.0
CLASSPATH=${XALAN_HOME}/bin/xerces.jar:${XALAN_HOME}/bin/xalan.jar:${XALAN_HOME}/bin/bsf.jar
export CLASSPATH
XALAN_CLASS=org.apache.xalan.xslt.Process

JAVA_HOME=/usr/local/linux-jdk1.3.1; export JAVA_HOME
JAVA=${JAVA_HOME}/bin/java

echo ${JAVA} ${XALAN_CLASS} $*
${JAVA} ${XALAN_CLASS} $*
