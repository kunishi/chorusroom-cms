#!/bin/sh

XALAN_HOME=/usr/local/xalan-j2.1.0
CLASSPATH=${XALAN_HOME}/bin/xerces.jar:${XALAN_HOME}/bin/xalan.jar:${XALAN_HOME}/bin/bsf.jar
export CLASSPATH
XALAN_CLASS=org.apache.xalan.xslt.Process

if [ -f /usr/local/bin/javavm ]; then
	JAVA=/usr/local/bin/javavm
else
	JAVA_HOME=/usr/local/jdk1.2.2; export JAVA_HOME
	JAVA=${JAVA_HOME}/bin/java
fi

${JAVA} ${XALAN_CLASS} $*
