#!/bin/sh

if [ -f /usr/local/bin/javavm ]; then
	JAVA=/usr/local/bin/javavm
else
	JAVA_HOME=/usr/local/jdk1.2.2; export JAVA_HOME
	JAVA=${JAVA_HOME}/bin/java
fi

XERCES_CLASSPATH=/usr/local/xalan-j2.1.0/bin/xerces.jar
XALAN_CLASSPATH=/usr/local/xalan-j2.1.0/bin/xalan.jar:/usr/local/xalan-j2.1.0/bin/bsf.jar
XALAN_CLASS=org.apache.xalan.xslt.Process

${JAVA} -classpath ${XERCES_CLASSPATH}:${XALAN_CLASSPATH} ${XALAN_CLASS} $*
