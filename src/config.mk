# Common macro definitions.
# $Id: config.mk,v 1.46 2001/01/09 16:36:39 kunishi Exp $
#

PUBLIC_SERVER=	psi.c.oka-pu.ac.jp
PUBLIC_DIR=	/usr/home/www/data/
TOP_URL=	http://psi.c.oka-pu.ac.jp/chorusRoom/

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
XALAN_CLASSPATH= ${JAVA_CLASSES_DIR}/xalan.jar:${JAVA_CLASSES_DIR}/bsf.jar

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
JAVA_OPTS+=	-Djava.compiler=${JAVA_COMPILER}

ifdef USE_JDK11
ifeq (${JAVA_COMPILER},tya)
JAVA_ENV+=	LD_LIBRARY_PATH=/usr/local/lib/tya
endif
ifeq (${JAVA_COMPILER},shujit)
JAVA_ENV+=	LD_LIBRARY_PATH=/usr/local/lib/shujit
endif
endif

ifdef JDK_CLASSPATH
CLASSPATH=	${XSLT_CLASSPATH}:${XERCES_CLASSPATH}:${JDK_CLASSPATH}
else
CLASSPATH=	${XSLT_CLASSPATH}:${XERCES_CLASSPATH}
endif

ifeq (${USE_NAMAZU1},yes)
NAMAZU_SRC=	/usr/local/namazu/bin/namazu
NAMAZU_INSTDIR=	${INSTTOPDIR}
GCNMZ=		/usr/local/namazu/bin/gcnmz
else
NAMAZU_SRC=	/usr/local/libexec/namazu.cgi
NAMAZU_INSTDIR=	/usr/local/www/cgi-bin/
GCNMZ=		/usr/local/bin/gcnmz
endif
NAMAZU_INDEX_DIR=	/usr/local/var/namazu/index/

DEFAULT_CSS=	default.css
DEFAULT_BGIMG=	background.png

BGIMG?=		${DEFAULT_BGIMG}
CSSFILE?=	${DEFAULT_CSS}

XSLT_PROC=	${JAVA} -classpath ${CLASSPATH} ${JAVA_OPTS} ${XSLT_CLASS} ${XSLT_OPTS}
XSLT_COMPILER=	${JAVA} -classpath ${CLASSPATH} ${JAVA_OPTS} ${XSLT_CLASS}

XSLT_CLASSPATH=	${XALAN_CLASSPATH}
XSLT_CLASS=	org.apache.xalan.xslt.Process
XSLT_OPTS+=	-XML
XSLT_PARAMS+=	-param "imagedir" "'${IMAGEDIR}'" \
		-param "bgimage" "'${BGIMG}'" \
		-param "styledir" "'${STYLEDIR}'" \
		-param "stylesheet" "'${CSSFILE}'" \
		-param "docBaseURI" "'../${RELPATH}'"
XSLT_OUT?=	-out $@

UTF2ASCII=	hutrans
ASCII2EUC=	iconv -f utf-8 -t euc-jp
EUC2JIS=	nkf
HTML_FORMAT=	tidy -q -xml -asxml
TIDY_ENCODING?=	-iso2022
SYNC_TOOL=	rsync -au

BASENAME=	basename
CP=		cp
ECHO=		echo
ENV?=		env
LN_S=		ln -s
MV=		mv
PERL?=		perl
SED=		sed
SLEEP=		sleep
TOUCH=		touch

RELPATH!=	./
INSTTOPDIR=	${LOCALBASE}/www/data/
IMAGEDIR=	/image
STYLEDIR=	/style

SCRIPTDIR=	${SRCTOPDIR}scripts
XSLDIR=		${SRCTOPDIR}xsl

XML2UTFXML=	${SCRIPTDIR}/gen-utfxml.sed
XMLDECL_FIX=	${SCRIPTDIR}/fix-xmldecl-duplication.rb
PATH_CONFIGURE=	${PERL} -pi -e " \
			s@%%TOPDIR%%@${SRCTOPDIR}@g; \
			s@%%STYLEDIR%%@${STYLEDIR}@g; \
			s@%%IMAGEDIR%%@${IMAGEDIR}@g; \
			"

XHTML10_XSL=	${XSLDIR}/xhtml10-eucjp.xsl
XHTML10_XSL_UTF8=	${XSLDIR}/xhtml10-utf8.xsl
XHTML10_XSL_ASCII=	${XSLDIR}/xhtml10-ascii.xsl
DEFAULT_XSL?=	${XHTML10_XSL}
DEFAULT_XSL_UTF8?=	${XHTML10_XSL_UTF8}

TOCFILE=	${SRCTOPDIR}toc.xml
