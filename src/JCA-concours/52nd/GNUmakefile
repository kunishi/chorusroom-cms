# Makefile for 
# Copyright (C) 1999 KUNISHIMA Takeo <kunishi@c.oka-pu.ac.jp>
#
# $Id: GNUmakefile,v 1.9 1999/08/29 03:17:47 kunishi Exp $

RELPATH=	JCA-concours/52nd
SRCTOPDIR=	../../
UTFTOEUC=	hutrans | tcs -f utf -t ujis
EUCTOJIS=	nkf

RESULT_XSL=	result-1999.xsl

INSTFILES+=	index.html
INSTFILES+=	fukuoka.html
INSTFILES+=	hyogo.html
INSTFILES+=	kagoshima.html

INSTFILES+=	template-taikai.txt template-dantai.txt

include ${SRCTOPDIR}/config.mk
include ${SRCTOPDIR}/rule.mk

fukuoka.html: %.html : %.xml ${RESULT_XSL}
	${XSLT_PROC} $< ${RESULT_XSL} | ${UTFTOEUC} | ${EUCTOJIS} > $@

hyogo.html: %.html : %.xml ${RESULT_XSL}
	${XSLT_PROC} $< ${RESULT_XSL} | ${UTFTOEUC} | ${EUCTOJIS} > $@

kagoshima.html: %.html : %.xml ${RESULT_XSL}
	${XSLT_PROC} $< ${RESULT_XSL} | ${UTFTOEUC} | ${EUCTOJIS} > $@

# template
template-taikai.txt: %.xml
	${CP} $< $@

template-dantai.txt: %.xml
	${CP} $< $@
