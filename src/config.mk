# Common macro definitions.
# $Id: config.mk,v 1.57 2002/04/03 11:23:03 kunishi Exp $
#

PUBLIC_SERVER=	chorusroom.c.oka-pu.ac.jp
PUBLIC_DIR=	/home/www/data/chorusRoom/
TOP_URL=	http://www.chorusroom.org/

LOCALBASE=	/usr/local
JDK_TOPDIR=	${LOCALBASE}/jdk1.2.2
JDK_LIBDIR=	${JDK_TOPDIR}/lib

JAVALIBDIR=	${LOCALBASE}/share/java
XALANLIBDIR=	${JAVALIBDIR}/xalan-j-2.2.0/bin
XERCES_CLASSPATH= ${XALANLIBDIR}/xerces.jar
XALAN_CLASSPATH= ${XALANLIBDIR}xalan.jar:${XALANLIBDIR}/bsf.jar

JAVA=		javavm
#JAVA=		${JDK_TOPDIR}/bin/java

ifdef USE_JIT
JAVA_COMPILER?=	tya
JAVA_OPTS+=	-Djava.compiler=${JAVA_COMPILER}
ifeq (${JAVA_COMPILER},tya)
JAVA_ENV+=	LD_LIBRARY_PATH=/usr/local/lib/tya
endif
ifeq (${JAVA_COMPILER},shujit)
JAVA_ENV+=	LD_LIBRARY_PATH=/usr/local/lib/shujit
endif
endif

CLASSPATH=	${XSLT_CLASSPATH}:${XERCES_CLASSPATH}

ifeq (${USE_NAMAZU1},yes)
NAMAZU_SRC=	/usr/local/namazu/bin/namazu
NAMAZU_INSTDIR=	${INSTTOPDIR}
GCNMZ=		/usr/local/namazu/bin/gcnmz
else
NAMAZU_SRC=	/usr/local/libexec/namazu.cgi
NAMAZU_INSTDIR=	/usr/local/www/cgi-bin/
GCNMZ=		/usr/local/bin/gcnmz
endif
NAMAZU_INDEX_DIR=	/home/www/namazu/index/

DEFAULT_CSS=	default.css
DEFAULT_BGIMG=	background.png

BGIMG?=		${DEFAULT_BGIMG}
CSSFILE?=	${DEFAULT_CSS}

XSLT_PROC=	${JAVA} -classpath ${CLASSPATH} ${JAVA_OPTS} ${XSLT_CLASS} ${XSLT_OPTS}
XSLT_COMPILER=	${JAVA} -classpath ${CLASSPATH} ${JAVA_OPTS} ${XSLT_CLASS}

XSLT_CLASSPATH=	${XALAN_CLASSPATH}
XSLT_CLASS=	org.apache.xalan.xslt.Process
XSLT_OPTS+=	-XML
XSLT_PARAMS+=	-param "topdir" "${SRCTOPDIR}" \
		-param "imagedir" "${IMAGEDIR}" \
		-param "bgimage" "${BGIMG}" \
		-param "styledir" "${STYLEDIR}" \
		-param "stylesheet" "${CSSFILE}" \
		-param "docBaseURI" "../${RELPATH}"
XSLT_OUT?=	-out $@

UTF2ASCII=	hutrans
ASCII2EUC=	biconv -f utf-8 -t euc-jp
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
INSTTOPDIR=	/home/www/data/
IMAGEDIR=	/image
STYLEDIR=	/style

SCRIPTDIR=	${SRCTOPDIR}scripts
XSLDIR=		${SRCTOPDIR}xsl

XML2UTFXML=	${SCRIPTDIR}/gen-utfxml.sed
XMLDECL_FIX=	${SCRIPTDIR}/fix-xmldecl-duplication.rb
PATH_CONFIGURE=	${PERL} -pi -e "s@%%TOPDIR%%@${SRCTOPDIR}@g;" \
			    -e "s@%%IMAGEDIR%%@${IMAGEDIR}@g;"

XHTML10_XSL=	${XSLDIR}/xhtml1-chorusroom.traditional.xsl
XHTML10_XSL_UTF8=	${XSLDIR}/xhtml1-chorusroom.utf8.xsl
DEFAULT_XSL?=	${XHTML10_XSL}
DEFAULT_XSL_UTF8?=	${XHTML10_XSL_UTF8}

TOCFILE=	${SRCTOPDIR}toc.xml
