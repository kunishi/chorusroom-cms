# Common macro definitions.
# $Id: config.mk,v 1.10 1999/09/14 11:34:38 kunishi Exp $
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
INSTTOPDIR=	/usr/home/kunishi/www/chorusRoom/

XHTML10_XSL=	${SRCTOPDIR}xhtml10.xsl
DEFAULT_XSL?=	${XHTML10_XSL}
