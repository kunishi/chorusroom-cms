# Makefile for 	-*-Makefile-*-
# Copyright (C) 2000 KUNISHIMA Takeo kunishi@c.oka-pu.ac.jp
# $Id: GNUmakefile,v 1.18 2000/08/31 03:55:26 kunishi Exp $

INSTFILES_HTML+=	index.html
INSTFILES_HTML+=	aichi.html
INSTFILES_HTML+=	ehime.html
INSTFILES_HTML+=	fukuoka.html
INSTFILES_HTML+=	fukushima.html
INSTFILES_HTML+=	gunma.html
INSTFILES_HTML+=	hyogo.html
INSTFILES_HTML+=	ishikawa.html ishikawa-saiten.html
INSTFILES_HTML+=	kagawa.html
INSTFILES_HTML+=	kumamoto.html kumamoto2.html
INSTFILES_HTML+=	okayama.html
INSTFILES_HTML+=	saga.html
INSTFILES_HTML+=	yamagata.html
INSTFILES_HTML+=	yamaguchi.html

INSTFILES+=	${INSTFILES_HTML} ${INSTFILES_HTML:%.html=%.utfhtml}

include ${SRCTOPDIR}/config.mk

RESULT_XSL=		result-eucjp.xsl
RESULT_XSL_UTF8=	result-utf8.xsl
RESULT_XSL_COMMON=	result-common.xsl
RESULT_XSL_COMMON_IN=	result-common.xsl.in
DEFAULT_XSL=		${RESULT_XSL}
DEFAULT_XSL_UTF8=	${RESULT_XSL_UTF8}

SPECIAL_RULES=		yes

include ${SRCTOPDIR}/rule.mk

%.jhtml: %.xml ${RESULT_XSL_COMMON}
	${XSLT_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL}

%.html: %.jhtml
	${ASCII2EUC} $< | ${EUC2JIS} > $@
	${HTML_FORMAT} -m -iso2022 $@

%.uhtml: %.utfxml ${RESULT_XSL_COMMON}
	${XSLT_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8}

%.utfhtml: %.uhtml
	${HTML_FORMAT} -utf8 < $< > $@

###

${RESULT_XSL_COMMON}: ${RESULT_XSL_COMMON_IN}
	${CP} ${RESULT_XSL_COMMON_IN} ${RESULT_XSL_COMMON}
	${PATH_CONFIGURE} ${RESULT_XSL_COMMON}

index.html:	%.html : %.xml ${XHTML10_XSL}
	${XSLT_ENV} ${XSLT_PROC} $< ${XHTML10_XSL} | ${ASCII2EUC} | ${EUC2JIS} > $@
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -iso2022 $@

index.utfhtml:	%.utfhtml : %.utfxml ${XHTML10_XSL_UTF8}
	${XSLT_ENV} ${XSLT_PROC} $< ${XHTML10_XSL_UTF8} > $@
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -utf8 $@

###
ishikawa-saiten.jhtml: ishikawa.xml
ishikawa-saiten.uhtml: ishikawa.utfxml
kumamoto2.jhtml: kumamoto.xml
kumamoto2.uhtml: kumamoto.utfxml
