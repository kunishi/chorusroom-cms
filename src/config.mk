# Common macro definitions.
# $Id: config.mk,v 1.15 1999/09/27 01:50:15 kunishi Exp $
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
XHTML10_XSL_UTF8=	${SRCTOPDIR}xhtml10-utf8.xsl
XHTML10_XSL_ISO8859_1=	${SRCTOPDIR}xhtml10-iso8859-1.xsl
DEFAULT_XSL=	${XHTML10_XSL}
DEFAULT_XSL_UTF8=	${XHTML10_XSL_UTF8}

XML2UTFXML=	${SRCTOPDIR}gen-utfxml.sed
