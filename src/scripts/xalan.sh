#!/bin/sh

JAVA_HOME=/usr/local/jdk1.2.2; export JAVA_HOME
JAVA=${JAVA_HOME}/bin/java

XERCES_CLASSPATH=/usr/local/share/java/classes/xerces.jar
XALAN_CLASSPATH=/usr/local/xalan-j2.1.0/bin/xalan.jar:/usr/local/xalan-j2.1.0/bin/bsf.jar
XALAN_CLASS=org.apache.xalan.xslt.Process

${JAVA} -classpath ${XERCES_CLASSPATH}:${XALAN_CLASSPATH} ${XALAN_CLASS} $*
