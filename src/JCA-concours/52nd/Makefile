# Makefile for 
# Copyright (C) 1999 KUNISHIMA Takeo <kunishi@c.oka-pu.ac.jp>
#
# $Id: Makefile,v 1.11 1999/08/30 02:09:27 kunishi Exp $

RELPATH=	JCA-concours/52nd
SRCTOPDIR=	../../
UTFTOEUC=	hutrans | tcs -f utf -t ujis
EUCTOJIS=	nkf

RESULT_XSL=	result-1999.xsl

INSTFILES+=	index.html
INSTFILES+=	fukuoka.html
INSTFILES+=	hyogo.html
INSTFILES+=	kagoshima.html

include ${SRCTOPDIR}/config.mk
include ${SRCTOPDIR}/rule.mk

fukuoka.html: %.html : %.xml ${RESULT_XSL}
	${XSLT_PROC} $< ${RESULT_XSL} | ${UTFTOEUC} | ${EUCTOJIS} > $@

hyogo.html: %.html : %.xml ${RESULT_XSL}
	${XSLT_PROC} $< ${RESULT_XSL} | ${UTFTOEUC} | ${EUCTOJIS} > $@

kagoshima.html: %.html : %.xml ${RESULT_XSL}
	${XSLT_PROC} $< ${RESULT_XSL} | ${UTFTOEUC} | ${EUCTOJIS} > $@

