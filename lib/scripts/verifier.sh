#!/bin/sh

VERIFIER_DIR=${HOME}/source/xml/RELAX/Relax-Verifier-Java/verifier-20010530
VERIFIER_JAR=${VERIFIER_DIR}/verifier.light.jar
VERIFIER=jp.co.swiftinc.relax.verifier.commandline.Main

XERCES_DIR=/usr/local/share/java/classes
XERCES_JAR=${XERCES_DIR}/xerces.jar
SAX_JAR=${XERCES_DIR}/sax.jar

echo java -cp ${VERIFIER_JAR}:${XERCES_JAR}:${SAX_JAR} ${VERIFIER} $* 
java -cp ${VERIFIER_JAR}:${XERCES_JAR}:${SAX_JAR} ${VERIFIER} $* 
