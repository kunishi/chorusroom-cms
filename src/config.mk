# Common macro definitions.
# $Id: config.mk,v 1.37 2000/10/03 11:34:57 kunishi Exp $
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
XERCES_CLASSPATH= ${JAVA_CLASSES_DIR}/xerces.jar
XALAN_CLASSPATH= ${JAVA_CLASSES_DIR}/xalan.jar:${JAVA_CLASSES_DIR}/bsf.jar:${JAVA_CLASSES_DIR}/bsfengines.jar

ifdef USE_KAFFE
JAVA=		${LOCALBASE}/bin/kaffe
JDK_CLASSPATH=	${LOCALBASE}/share/kaffe/kjc.jar:${LOCALBASE}/share/kaffe/Klasses.jar
else
JAVA=		${JDK_TOPDIR}/bin/java
ifdef USE_JDK11
JDK_CLASSPATH=	${JDK_LIBDIR}/classes.zip
endif
endif

JAVA_COMPILER?=	tya

ifdef JAVA_COMPILER
JAVA_OPTS+=	-Djava.compiler=${JAVA_COMPILER}
ifeq (${JAVA_COMPILER},tya)
JAVA_ENV+=	LD_LIBRARY_PATH=/usr/local/lib/tya
endif
ifeq (${JAVA_COMPILER},shujit)
JAVA_ENV+=	LD_LIBRARY_PATH=/usr/local/lib/shujit
endif
endif

ifdef USE_XALAN
XSLT_CLASSPATH=	${XALAN_CLASSPATH}
XSLT_CLASS=	org.apache.xalan.xslt.Process
XSLT_OPTS+=	-XML
else
JAVA_OPTS+=	-Dcom.jclark.xsl.sax.parser=org.apache.xerces.parsers.SAXParser
XSLT_CLASSPATH=	${XT_CLASSPATH}
XSLT_CLASS=	com.jclark.xsl.sax.Driver
endif

ifdef JDK_CLASSPATH
CLASSPATH=	${XSLT_CLASSPATH}:${XERCES_CLASSPATH}:${JDK_CLASSPATH}
else
CLASSPATH=	${XSLT_CLASSPATH}:${XERCES_CLASSPATH}
endif

XSLT_PROC=	${JAVA} -classpath ${CLASSPATH} ${JAVA_OPTS} ${XSLT_CLASS} ${XSLT_OPTS}
ifdef USE_XALAN
XSLT_COMPILER=	${JAVA} -classpath ${CLASSPATH} ${JAVA_OPTS} ${XSLT_CLASS}
endif

UTF2ASCII=	hutrans
ASCII2EUC=	iconv -f utf-8 -t euc-jp
EUC2JIS=	nkf
HTML_FORMAT=	tidy -q -xml -asxml
SYNC_TOOL=	rsync -au

CP=		cp
ENV?=		env
PERL?=		perl
RELPATH!=	./
INSTTOPDIR=	${LOCALBASE}/www/data/

#IMAGEDIR=	${SRCTOPDIR}image
IMAGEDIR=	/image
#STYLEDIR=	${SRCTOPDIR}style
STYLEDIR=	/style
SCRIPTDIR=	${SRCTOPDIR}scripts

XHTML10_XSL=	${SRCTOPDIR}xhtml10.xsl
XHTML10_XSL_UTF8=	${SRCTOPDIR}xhtml10-utf8.xsl
XHTML10_XSL_ASCII=	${SRCTOPDIR}xhtml10-ascii.xsl
DEFAULT_XSL=	${XHTML10_XSL}
DEFAULT_XSL_UTF8=	${XHTML10_XSL_UTF8}

XML2UTFXML=	${SCRIPTDIR}/gen-utfxml.sed
PATH_CONFIGURE=	${PERL} -pi -e " \
			s@%%TOPDIR%%@${SRCTOPDIR}@g; \
			s@%%STYLEDIR%%@${STYLEDIR}@g; \
			s@%%IMAGEDIR%%@${IMAGEDIR}@g; \
			"
