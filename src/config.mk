# Common macro definitions.
# $Id: config.mk,v 1.3 1999/08/06 02:43:58 kunishi Exp $
#

XSLT_PROC=	java \
		-Dcom.jclark.xsl.sax.parser=com.ibm.xml.parsers.SAXParser \
		com.jclark.xsl.sax.Driver
UTF2ASCII=	hutrans
ASCII2EUC=	tcs -f utf -t ujis
EUC2JIS=	nkf
HTML_FORMAT=	tidy -iso2022
SYNC_TOOL=	rsync -avuz

RELPATH=	.
INSTTOPDIR=	/usr/home/kunishi/cvs/html/hobby-root/chorusRoom/

DEFAULT_XSL=	${SRCTOPDIR}xhtml10.xsl
