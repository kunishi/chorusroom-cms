# Common macro definitions.
# $Id: config.mk,v 1.12 1999/09/17 01:01:36 kunishi Exp $
#

XSLT_PROC=	java \
		-Dcom.jclark.xsl.sax.parser=com.ibm.xml.parsers.SAXParser \
		com.jclark.xsl.sax.Driver
JAVA_COMPILER?=	tya
MAKE_ENV+=	JAVA_COMPILER=${JAVA_COMPILER}

UTF2ASCII=	hutrans
ASCII2EUC=	tcs -f utf -t ujis
EUC2JIS=	nkf
HTML_FORMAT=	tidy -iso2022
SYNC_TOOL=	rsync -avuz

CP=		cp
ENV=		env

RELPATH!=	.
INSTTOPDIR=	/usr/local/www/data/chorusRoom/

XHTML10_XSL=	${SRCTOPDIR}xhtml10.xsl
DEFAULT_XSL=	${XHTML10_XSL}
