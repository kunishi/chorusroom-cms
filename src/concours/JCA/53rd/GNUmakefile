# Makefile for 	-*-Makefile-*-
# Copyright (C) 2000 KUNISHIMA Takeo kunishi@c.oka-pu.ac.jp
# $Id: GNUmakefile,v 1.34 2000/09/25 10:41:24 kunishi Exp $

INSTFILES_HTML+=	index.html
INSTFILES_HTML+=	aichi.html
INSTFILES_HTML+=	chiba.html chiba-saiten.html
INSTFILES_HTML+=	chugoku.html chugoku-saiten.html
INSTFILES_HTML+=	ehime.html
INSTFILES_HTML+=	fukuoka.html
INSTFILES_HTML+=	fukushima.html
INSTFILES_HTML+=	gunma.html
INSTFILES_HTML+=	hiroshima.html
INSTFILES_HTML+=	hyogo.html
INSTFILES_HTML+=	ishikawa.html ishikawa-saiten.html
INSTFILES_HTML+=	iwate.html
INSTFILES_HTML+=	kagawa.html
INSTFILES_HTML+=	kumamoto.html kumamoto2.html
INSTFILES_HTML+=	${INSTFILES_HTML_KYUSHU}
INSTFILES_HTML+=	mie.html mie-saiten.html
INSTFILES_HTML+=	miyagi.html
INSTFILES_HTML+=	okayama.html
INSTFILES_HTML+=	saga.html
INSTFILES_HTML+=	${INSTFILES_HTML_SHIKOKU}
INSTFILES_HTML+=	shimane.html
INSTFILES_HTML+=	yamagata.html
INSTFILES_HTML+=	yamaguchi.html

INSTFILES_HTML_SHIKOKU=	shikoku-2000-09-02.html shikoku-2000-09-03.html
INSTFILES_HTML_KYUSHU=	kyushu-2000-09-10.html

INSTFILES_NOBUILD+=	hyogo.xml

INSTFILES+=	${INSTFILES_HTML} ${INSTFILES_HTML:%.html=%.utfhtml}

GENFILES+=	${INSTFILES_HTML:%.html=%.jhtml}
GENFILES+=	${INSTFILES_HTML:%.html=%.uhtml}

include ${SRCTOPDIR}/config.mk

RESULT_XSL=		result-eucjp.xsl
RESULT_XSL_UTF8=	result-utf8.xsl
RESULT_XSL_COMMON=	result-common.xsl
DEFAULT_XSL=		${RESULT_XSL}
DEFAULT_XSL_UTF8=	${RESULT_XSL_UTF8}

SPECIAL_RULES=		yes

include ${SRCTOPDIR}/rule.mk

%.jhtml: %.xml ${RESULT_XSL_COMMON} ${DEFAULT_XSL}
	${XSLT_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL}

%.html: %.jhtml
	${ASCII2EUC} $< | ${EUC2JIS} > $@
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -iso2022 $@

%.uhtml: %.utfxml ${RESULT_XSL_COMMON} ${DEFAULT_XSL_UTF8}
	${XSLT_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8}

%.utfhtml: %.uhtml
	${CP} $< $@
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -utf8 $@

###

index.html:	%.html : %.xml ${XHTML10_XSL}
	${XSLT_ENV} ${XSLT_PROC} $< ${XHTML10_XSL} | ${ASCII2EUC} | ${EUC2JIS} > $@
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -iso2022 $@

index.utfhtml:	%.utfhtml : %.utfxml ${XHTML10_XSL_UTF8}
	${XSLT_ENV} ${XSLT_PROC} $< ${XHTML10_XSL_UTF8} > $@
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -utf8 $@

${INSTFILES_HTML_KYUSHU:%.html=%.jhtml}: kyushu.xml
	${XSLT_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL}

${INSTFILES_HTML_KYUSHU:%.html=%.uhtml}: kyushu.utfxml
	${XSLT_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8}

${INSTFILES_HTML_SHIKOKU:%.html=%.jhtml}: shikoku.xml
	${XSLT_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL}

${INSTFILES_HTML_SHIKOKU:%.html=%.uhtml}: shikoku.utfxml
	${XSLT_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8}

###
chiba-saiten.jhtml: chiba.xml
chiba-saiten.uhtml: chiba.utfxml
chugoku-saiten.jhtml: chugoku.xml
chugoku-saiten.uhtml: chugoku.utfxml
ishikawa-saiten.jhtml: ishikawa.xml
ishikawa-saiten.uhtml: ishikawa.utfxml
kumamoto2.jhtml: kumamoto.xml
kumamoto2.uhtml: kumamoto.utfxml
mie-saiten.jhtml: mie.xml
mie-saiten.uhtml: mie.utfxml
