# Makefile for 	-*-Makefile-*-
# Copyright (C) 2000 KUNISHIMA Takeo kunishi@c.oka-pu.ac.jp
# $Id: Makefile,v 1.3 2000/08/03 06:10:04 kunishi Exp $

UTFTOEUC=	hutrans | tcs -f utf -t ujis
EUCTOJIS=	nkf

INSTFILES_HTML+=	index.html
INSTFILES_HTML+=	saga.html
INSTFILES_HTML+=	gunma.html
INSTFILES_HTML+=	kagawa.html

INSTFILES+=	${INSTFILES_HTML} ${INSTFILES_HTML:%.html=%.utfhtml}

include ${SRCTOPDIR}/config.mk

RESULT_XSL=		result-eucjp.xsl
RESULT_XSL_UTF8=	result-utf8.xsl
DEFAULT_XSL=		${RESULT_XSL}
DEFAULT_XSL_UTF8=	${RESULT_XSL_UTF8}

SPECIAL_RULES=		yes

include ${SRCTOPDIR}/rule.mk

%.html:	%.xml
	${XSLT_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL}

%.utfhtml:	%.utfxml
	${XSLT_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8}

###

index.html:	%.html : %.xml ${XHTML10_XSL}
	${XSLT_ENV} ${XSLT_PROC} $< ${XHTML10_XSL} > $@

index.utfhtml:	%.utfhtml : %.utfxml ${XHTML10_XSL_UTF8}
	${XSLT_ENV} ${XSLT_PROC} $< ${XHTML10_XSL_UTF8} > $@
