# Makefile for 
# Copyright (C) 1999 KUNISHIMA Takeo <kunishi@c.oka-pu.ac.jp>
#
# $Id: GNUmakefile,v 1.20 1999/09/14 11:32:13 kunishi Exp $

RELPATH=	JCA-concours/52nd
SRCTOPDIR=	../../
UTFTOEUC=	hutrans | tcs -f utf -t ujis
EUCTOJIS=	nkf

RESULT_XSL=	result-1999.xsl
DEFAULT_XSL=	${RESULT_XSL}

INSTFILES+=	index.html
INSTFILES+=	aichi.html
INSTFILES+=	chiba.html
INSTFILES+=	chugoku.html
INSTFILES+=	fukuoka.html
INSTFILES+=	fukushima.html
INSTFILES+=	hyogo.html
INSTFILES+=	kagoshima.html
INSTFILES+=	mie.html
INSTFILES+=	miyagi.html
INSTFILES+=	shizuoka.html
INSTFILES+=	yamagata.html

include ${SRCTOPDIR}/config.mk
include ${SRCTOPDIR}/rule.mk

index.html: %.html : %.xml ${XHTML10_XSL}
	${ENV} ${MAKE_ENV} ${XSLT_PROC} $< ${XHTML10_XSL} | \
	  ${UTF2ASCII} | ${ASCII2EUC} | ${EUC2JIS} > $@
