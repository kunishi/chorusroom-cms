# Common macro definitions.
# $Id: config.mk,v 1.6 1999/08/29 03:16:55 kunishi Exp $
#

XSLT_PROC=	java \
		-Dcom.jclark.xsl.sax.parser=com.ibm.xml.parsers.SAXParser \
		com.jclark.xsl.sax.Driver
UTF2ASCII=	hutrans
ASCII2EUC=	tcs -f utf -t ujis
EUC2JIS=	nkf
HTML_FORMAT=	tidy -iso2022
SYNC_TOOL=	rsync -avuz

CP=		cp

RELPATH!=	.
INSTTOPDIR=	/usr/home/kunishi/www/chorusRoom/

DEFAULT_XSL=	${SRCTOPDIR}xhtml10.xsl
