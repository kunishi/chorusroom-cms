# Makefile for 
# Copyright (C) 1999 KUNISHIMA Takeo <kunishi@c.oka-pu.ac.jp>
#
# $Id: GNUmakefile,v 1.4 1999/08/06 01:31:58 kunishi Exp $

XSLT_PROC=	java \
		-Dcom.jclark.xsl.sax.parser=com.ibm.xml.parsers.SAXParser \
		com.jclark.xsl.sax.Driver
UTF2ASCII=	hutrans
ASCII2EUC=	tcs -f utf -t ujis
EUC2JIS=	nkf
HTML_FORMAT=	tidy -iso2022
SYNC_TOOL=	rsync -avuz

RELPATH=	JCA-concours/52nd
SRCTOPDIR=	../../
INSTTOPDIR=	/usr/home/kunishi/cvs/html/hobby-root/chorusRoom/

DEFAULT_XSL=	${SRCTOPDIR}xhtml10.xsl
RESULT_XSL=	result-1999.xsl

INSTFILES+=	index.html
INSTFILES+=	fukuoka.html

.SUFFIXES:	.xml .utfhtml .html

.xml.utfhtml:
	${XSLT_PROC} $< ${DEFAULT_XSL} > $@

.utfhtml.html:
	${UTF2ASCII} < $< | ${ASCII2EUC} | ${EUC2JIS} | ${HTML_FORMAT} > $@

all:	${INSTFILES}

fukuoka.utfhtml:	fukuoka.xml ${RESULT_XSL_FILE}
	${XSLT_PROC} fukuoka.xml ${RESULT_XSL_FILE} > fukuoka.utfhtml

install:
	${SYNC_TOOL} ${INSTFILES} ${INSTTOPDIR}${RELPATH}

clean:
	rm -rf *.utfhtml *.html
