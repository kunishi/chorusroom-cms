# Makefile for 	-*-Makefile-*-
# Copyright (C) 2000 KUNISHIMA Takeo kunishi@c.oka-pu.ac.jp
# $Id: Makefile,v 1.40 2000/10/03 11:34:59 kunishi Exp $

INSTFILES_HTML+=	index.html
INSTFILES_HTML+=	aichi.html
INSTFILES_HTML+=	chiba.html chiba-saiten.html
INSTFILES_HTML+=	chubu.html chubu-saiten.html
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
INSTFILES_HTML+=	${INSTFILES_HTML_KANSAI}
INSTFILES_HTML+=	kanto.html
INSTFILES_HTML+=	kumamoto.html kumamoto2.html
INSTFILES_HTML+=	${INSTFILES_HTML_KYUSHU}
INSTFILES_HTML+=	mie.html mie-saiten.html
INSTFILES_HTML+=	miyagi.html
INSTFILES_HTML+=	okayama.html
INSTFILES_HTML+=	saga.html
INSTFILES_HTML+=	${INSTFILES_HTML_SHIKOKU}
INSTFILES_HTML+=	shimane.html
INSTFILES_HTML+=	tokyo.html
INSTFILES_HTML+=	yamagata.html
INSTFILES_HTML+=	yamaguchi.html

INSTFILES_HTML_KANSAI=	kansai-highschool.html
INSTFILES_HTML_KYUSHU=	kyushu-2000-09-10.html
INSTFILES_HTML_SHIKOKU=	shikoku-2000-09-02.html shikoku-2000-09-03.html

INSTFILES_NOBUILD+=	hyogo.xml

INSTFILES+=	${INSTFILES_HTML} ${INSTFILES_HTML:%.html=%.utfhtml}

GENFILES+=	${INSTFILES_HTML:%.html=%.jhtml}
GENFILES+=	${INSTFILES_HTML:%.html=%.uhtml}

include ${SRCTOPDIR}/config.mk

ifdef USE_XALAN
RESULT_XSL=		result-eucjp-xalan.xsl
RESULT_XSL_UTF8=	result-utf8-xalan.xsl
else
RESULT_XSL=		result-eucjp.xsl
RESULT_XSL_UTF8=	result-utf8.xsl
endif
RESULT_XSL_COMMON=	result-common.xsl
DEFAULT_XSL=		${RESULT_XSL}
DEFAULT_XSL_UTF8=	${RESULT_XSL_UTF8}

SPECIAL_RULES=		yes

include ${SRCTOPDIR}/rule.mk

ifdef USE_XALAN
%.html: %.xml ${RESULT_XSL_COMMON} ${DEFAULT_XSL}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL}
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -iso2022 $@

%.utfhtml: %.utfxml ${RESULT_XSL_COMMON} ${DEFAULT_XSL_UTF8}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL_UTF8}
	${HTML_FORMAT} -m -utf8 $@
	${PATH_CONFIGURE} $@
else
%.jhtml: %.xml ${RESULT_XSL_COMMON} ${DEFAULT_XSL}
	${JAVA_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL}

%.html: %.jhtml
	${ASCII2EUC} $< | ${EUC2JIS} > $@
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -iso2022 $@

%.uhtml: %.utfxml ${RESULT_XSL_COMMON} ${DEFAULT_XSL_UTF8}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL_UTF8}
	${JAVA_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8}

%.utfhtml: %.uhtml
	${CP} $< $@
	${HTML_FORMAT} -m -utf8 $@
	${PATH_CONFIGURE} $@
endif

###

index.html:	%.html : %.xml ${XHTML10_XSL}
ifdef USE_XALAN
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${XHTML10_XSL} -OUT $@
else
	${JAVA_ENV} ${XSLT_PROC} $< ${XHTML10_XSL} | ${ASCII2EUC} | ${EUC2JIS} > $@
endif
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -iso2022 $@

index.utfhtml:	%.utfhtml : %.utfxml ${XHTML10_XSL_UTF8}
ifdef USE_XALAN
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${XHTML10_XSL_UTF8} -OUT $@
else
	${JAVA_ENV} ${XSLT_PROC} $< ${XHTML10_XSL_UTF8} > $@
endif
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -utf8 $@

ifdef USE_XALAN
${INSTFILES_HTML_KANSAI}: kansai.xml ${RESULT_XSL_COMMON} ${DEFAULT_XSL}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL}
	${PATH_CONFIGURE} ${INSTFILES_HTML_KANSAI}
	${HTML_FORMAT} -m -iso2022 ${INSTFILES_HTML_KANSAI}

${INSTFILES_HTML_KANSAI:%.html=%.utfhtml}: kansai.utfxml ${RESULT_XSL_COMMON} ${DEFAULT_XSL_UTF8}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL_UTF8}
	${PATH_CONFIGURE} ${INSTFILES_HTML_KANSAI:%.html=%.utfhtml}
	${HTML_FORMAT} -m -utf8 ${INSTFILES_HTML_KANSAI:%.html=%.utfhtml}
else
${INSTFILES_HTML_KANSAI:%.html=%.jhtml}: kansai.xml
	${JAVA_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL}

${INSTFILES_HTML_KANSAI:%.html=%.uhtml}: kansai.utfxml
	${JAVA_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8}
endif

ifdef USE_XALAN
${INSTFILES_HTML_KYUSHU}: kyushu.xml ${RESULT_XSL_COMMON} ${DEFAULT_XSL}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL}
	${PATH_CONFIGURE} ${INSTFILES_HTML_KYUSHU}
	${HTML_FORMAT} -m -iso2022 ${INSTFILES_HTML_KYUSHU}

${INSTFILES_HTML_KYUSHU:%.html=%.utfhtml}: kyushu.utfxml ${RESULT_XSL_COMMON} ${DEFAULT_XSL_UTF8}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL_UTF8}
	${PATH_CONFIGURE} ${INSTFILES_HTML_KYUSHU:%.html=%.utfhtml}
	${HTML_FORMAT} -m -utf8 ${INSTFILES_HTML_KYUSHU:%.html=%.utfhtml}
else
${INSTFILES_HTML_KYUSHU:%.html=%.jhtml}: kyushu.xml
	${JAVA_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL}

${INSTFILES_HTML_KYUSHU:%.html=%.uhtml}: kyushu.utfxml
	${JAVA_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8}
endif

ifdef USE_XALAN
${INSTFILES_HTML_SHIKOKU}: shikoku.xml ${RESULT_XSL_COMMON} ${DEFAULT_XSL}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL}
	${PATH_CONFIGURE} ${INSTFILES_HTML_SHIKOKU}
	${HTML_FORMAT} -m -iso2022 ${INSTFILES_HTML_SHIKOKU}

${INSTFILES_HTML_SHIKOKU:%.html=%.utfhtml}: shikoku.xml ${RESULT_XSL_COMMON} ${DEFAULT_XSL_UTF8}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL_UTF8}
	${PATH_CONFIGURE} ${INSTFILES_HTML_SHIKOKU:%.html=%.utfhtml}
	${HTML_FORMAT} -m -utf8 ${INSTFILES_HTML_SHIKOKU:%.html=%.utfhtml}
else
${INSTFILES_HTML_SHIKOKU:%.html=%.jhtml}: shikoku.xml
	${JAVA_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL}

${INSTFILES_HTML_SHIKOKU:%.html=%.uhtml}: shikoku.utfxml
	${JAVA_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8}
endif

###
chiba-saiten.jhtml: chiba.xml
chiba-saiten.uhtml: chiba.utfxml
chubu-saiten.jhtml: chubu.xml
chubu-saiten.uhtml: chubu.utfxml
chugoku-saiten.jhtml: chugoku.xml
chugoku-saiten.uhtml: chugoku.utfxml
ishikawa-saiten.jhtml: ishikawa.xml
ishikawa-saiten.uhtml: ishikawa.utfxml
kumamoto2.jhtml: kumamoto.xml
kumamoto2.uhtml: kumamoto.utfxml
mie-saiten.jhtml: mie.xml
mie-saiten.uhtml: mie.utfxml
