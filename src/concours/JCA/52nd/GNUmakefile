# Makefile for 
# Copyright (C) 1999 KUNISHIMA Takeo <kunishi@c.oka-pu.ac.jp>
#
# $Id: GNUmakefile,v 1.12 1999/08/30 06:47:08 kunishi Exp $

RELPATH=	JCA-concours/52nd
SRCTOPDIR=	../../
UTFTOEUC=	hutrans | tcs -f utf -t ujis
EUCTOJIS=	nkf

RESULT_XSL=	result-1999.xsl

INSTFILES+=	index.html
INSTFILES+=	aichi.html
INSTFILES+=	fukuoka.html
INSTFILES+=	hyogo.html
INSTFILES+=	kagoshima.html

include ${SRCTOPDIR}/config.mk
include ${SRCTOPDIR}/rule.mk

aichi.html: %.html : %.xml ${RESULT_XSL}
	${XSLT_PROC} $< ${RESULT_XSL} | ${UTFTOEUC} | ${EUCTOJIS} > $@

fukuoka.html: %.html : %.xml ${RESULT_XSL}
	${XSLT_PROC} $< ${RESULT_XSL} | ${UTFTOEUC} | ${EUCTOJIS} > $@

hyogo.html: %.html : %.xml ${RESULT_XSL}
	${XSLT_PROC} $< ${RESULT_XSL} | ${UTFTOEUC} | ${EUCTOJIS} > $@

kagoshima.html: %.html : %.xml ${RESULT_XSL}
	${XSLT_PROC} $< ${RESULT_XSL} | ${UTFTOEUC} | ${EUCTOJIS} > $@

