# Common macro definitions.
# $Id: config.mk,v 1.28 2000/08/26 02:15:48 kunishi Exp $
#

LOCALBASE=	/usr/local
ifdef USE_JDK11
JDK_TOPDIR=	${LOCALBASE}/jdk1.1.8
else
JDK_TOPDIR=	${LOCALBASE}/jdk1.2.2
endif
JDK_LIBDIR=	${JDK_TOPDIR}/lib

JAVA_CLASSES_DIR=	${LOCALBASE}/share/java/classes
XT_CLASSPATH=	${JAVA_CLASSES_DIR}/xt.jar:${JAVA_CLASSES_DIR}/sax.jar
XML4J_CLASSPATH= ${JAVA_CLASSES_DIR}/xml4j.jar:${JAVA_CLASSES_DIR}/xerces.jar
LOTUSXSL_CLASSPATH=	${JAVA_CLASSES_DIR}/lotusxsl.jar:${JAVA_CLASSES_DIR}/lotusxslbsf.jar:${JAVA_CLASSES_DIR}/js.jar

ifdef USE_KAFFE
JAVA=		${LOCALBASE}/bin/kaffe
JDK_CLASSPATH=	${LOCALBASE}/share/kaffe/kjc.jar:${LOCALBASE}/share/kaffe/Klasses.jar
else
JAVA=		${JDK_TOPDIR}/bin/java
ifdef USE_JDK11
JAVA_COMPILER?=	tya
JDK_CLASSPATH=	${JDK_LIBDIR}/classes.zip
else
JAVA_COMPILER?=	tya
JDK_CLASSPATH=	
endif
endif

ifdef JAVA_COMPILER
XSLT_OPTS+=	-Djava.compiler=${JAVA_COMPILER}
endif

ifdef USE_LOTUSXSL
XSLT_CLASSPATH=	${LOTUSXSL_CLASSPATH}
XSLT_CLASS=	com.lotus.xsl.Process
else
XSLT_CLASSPATH=	${XT_CLASSPATH}
XSLT_OPTS+=	-Dcom.jclark.xsl.sax.parser=com.ibm.xml.parsers.SAXParser
XSLT_CLASS=	com.jclark.xsl.sax.Driver
endif

CLASSPATH=	${XSLT_CLASSPATH}:${XML4J_CLASSPATH}:${JDK_CLASSPATH}
XSLT_PROC=	${JAVA} -classpath ${CLASSPATH} ${XSLT_OPTS} ${XSLT_CLASS}

UTF2ASCII=	hutrans
ASCII2EUC=	tcs -f utf -t ujis
EUC2JIS=	nkf
HTML_FORMAT=	tidy -i -n -iso2022
SYNC_TOOL=	rsync -au

CP=		cp
ENV?=		env
PERL?=		/usr/bin/perl

RELPATH!=	.
INSTTOPDIR=	${LOCALBASE}/www/data/chorusRoom/

STYLEDIR=	${SRCTOPDIR}/style
SCRIPTDIR=	${SRCTOPDIR}/scripts

XHTML10_XSL=	${SRCTOPDIR}/xhtml10.xsl
XHTML10_XSL_UTF8=	${SRCTOPDIR}/xhtml10-utf8.xsl
XHTML10_XSL_ASCII=	${SRCTOPDIR}/xhtml10-ascii.xsl
DEFAULT_XSL=	${XHTML10_XSL}
DEFAULT_XSL_UTF8=	${XHTML10_XSL_UTF8}

XML2UTFXML=	${SCRIPTDIR}/gen-utfxml.sed
