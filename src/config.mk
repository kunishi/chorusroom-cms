# Common macro definitions.
# $Id: config.mk,v 1.7 1999/09/09 10:02:37 kunishi Exp $
#

XSLT_PROC=	java \
		-Djava.compiler=tya \
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
