# Makefile for 
# Copyright (C) 1999 KUNISHIMA Takeo <kunishi@c.oka-pu.ac.jp>
# $Header: /home/cvs/chorusRoom/src/concours/JCA/52nd/Attic/Makefile,v 1.1 1999/08/05 08:33:32 kunishi Exp $

XSLT_PROC=	java \
		-Dcom.jclark.xsl.sax.parser=com.ibm.xml.parsers.SAXParser \
		com.jclark.xsl.sax.Driver
UTF2ASCII=	hutrans
ASCII2EUC=	tcs -f utf -t ujis
EUC2JIS=	nkf
HTML_FORMAT=	tidy -iso2022

RESULT_XSL_FILE=	result-1999.xsl

.SUFFIXES:	.xml .utfhtml .html

.xml.utfhtml:
	${XSLT_PROC} $< ${RESULT_XSL_FILE} > $@

.utfhtml.html:
	${UTF2ASCII} < $< | ${ASCII2EUC} | ${EUC2JIS} | ${HTML_FORMAT} > $@
