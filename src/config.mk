# Common macro definitions.
# $Id: config.mk,v 1.19 1999/12/12 02:28:34 kunishi Exp $
#

JDK_LIBDIR=	/usr/local/jdk1.1.8/lib
JDK_CLASSPATH=	${JDK_LIBDIR}/classes.zip:${JDK_LIBDIR}
JAVA_CLASSES_DIR=	/usr/local/share/java/classes
XT_CLASSPATH=	${JAVA_CLASSES_DIR}/xt.jar:${JAVA_CLASSES_DIR}/sax.jar
XML4J_CLASSPATH= ${JAVA_CLASSES_DIR}/xml4j.jar:${JAVA_CLASSES_DIR}/xml4jSamples.jar
LOTUSXSL_CLASSPATH=	${JAVA_CLASSES_DIR}/lotusxsl.jar:${JAVA_CLASSES_DIR}/lotusxslbsf.jar:${JAVA_CLASSES_DIR}/js.jar

ifdef USE_LOTUSXSL
XSLT_CLASSPATH=	${LOTUSXSL_CLASSPATH}
XSLT_OPTS=	
XSLT_CLASS=	com.lotus.xsl.Process
else
XSLT_CLASSPATH=	${XT_CLASSPATH}
XSLT_OPTS=	-Dcom.jclark.xsl.sax.parser=com.ibm.xml.parsers.SAXParser
XSLT_CLASS=	com.jclark.xsl.sax.Driver
endif

CLASSPATH=	${XSLT_CLASSPATH}:${XML4J_CLASSPATH}:${JDK_CLASSPATH}
XSLT_PROC=	java -classpath ${CLASSPATH} ${XSLT_OPTS} ${XSLT_CLASS}
JAVA_COMPILER?=	tya
MAKE_ENV+=	JAVA_COMPILER=${JAVA_COMPILER}

UTF2ASCII=	hutrans
ASCII2EUC=	tcs -f utf -t ujis
EUC2JIS=	nkf
HTML_FORMAT=	tidy -iso2022
SYNC_TOOL=	rsync -au

CP=		cp
ENV=		env

RELPATH!=	.
INSTTOPDIR=	/usr/local/www/data/chorusRoom/

XHTML10_XSL=	${SRCTOPDIR}xhtml10.xsl
XHTML10_XSL_UTF8=	${SRCTOPDIR}xhtml10-utf8.xsl
XHTML10_XSL_ASCII=	${SRCTOPDIR}xhtml10-ascii.xsl
DEFAULT_XSL=	${XHTML10_XSL}
DEFAULT_XSL_UTF8=	${XHTML10_XSL_UTF8}

XML2UTFXML=	${SRCTOPDIR}gen-utfxml.sed
