# Makefile for 	-*-Makefile-*-
# Copyright (C) 2000 KUNISHIMA Takeo kunishi@c.oka-pu.ac.jp
# $Id: Makefile,v 1.47 2000/10/08 23:37:54 kunishi Exp $

INSTFILES_HTML+=	index.html
INSTFILES_HTML+=	aichi.html
INSTFILES_HTML+=	chiba.html
INSTFILES_HTML+=	chubu.html
INSTFILES_HTML+=	chugoku.html
INSTFILES_HTML+=	ehime.html
INSTFILES_HTML+=	fukuoka.html
INSTFILES_HTML+=	fukushima.html
INSTFILES_HTML+=	gunma.html
INSTFILES_HTML+=	hiroshima.html
INSTFILES_HTML+=	${HOKKAIDO_HTML}
INSTFILES_HTML+=	hyogo.html
INSTFILES_HTML+=	ishikawa.html
INSTFILES_HTML+=	iwate.html
INSTFILES_HTML+=	kagawa.html
INSTFILES_HTML+=	${INSTFILES_HTML_KANSAI}
INSTFILES_HTML+=	kanto.html
INSTFILES_HTML+=	${INSTFILES_HTML_KUMAMOTO}
INSTFILES_HTML+=	${INSTFILES_HTML_KYUSHU}
INSTFILES_HTML+=	mie.html
INSTFILES_HTML+=	miyagi.html
INSTFILES_HTML+=	okayama.html
INSTFILES_HTML+=	saga.html
INSTFILES_HTML+=	${INSTFILES_HTML_SHIKOKU}
INSTFILES_HTML+=	shimane.html
INSTFILES_HTML+=	tokyo.html
INSTFILES_HTML+=	${TOHOKU_HTML}
INSTFILES_HTML+=	yamagata.html
INSTFILES_HTML+=	yamaguchi.html

INSTFILES_HTML_KANSAI=	kansai-highschool.html
INSTFILES_HTML_KUMAMOTO= kumamoto.html kumamoto2.html
INSTFILES_HTML_KYUSHU=	kyushu-2000-09-10.html
INSTFILES_HTML_SHIKOKU=	shikoku-2000-09-02.html shikoku-2000-09-03.html
HOKKAIDO_HTML=		hokkaido-2000-09-24.html
TOHOKU_HTML=		tohoku-2000-09-29.html \
			tohoku-2000-09-30.html \
			tohoku-2000-10-01.html

INSTFILES_HTML_SAITEN+=	chiba-saiten.html
INSTFILES_HTML_SAITEN+=	chubu-saiten.html
INSTFILES_HTML_SAITEN+=	chugoku-saiten.html
INSTFILES_HTML_SAITEN+=	ishikawa-saiten.html
INSTFILES_HTML_SAITEN+=	mie-saiten.html

INSTFILES_NOBUILD+=	hyogo.xml

INSTFILES+=	${INSTFILES_HTML} \
		${INSTFILES_HTML:%.html=%.utfhtml} \
		${INSTFILES_HTML_SAITEN} \
		${INSTFILES_HTML_SAITEN:%.html=%.utfhtml}

RESULT_XSL=		${XSLDIR}/jca-result-2000-eucjp-xalan.xsl
RESULT_XSL_UTF8=	${XSLDIR}/jca-result-2000-utf8-xalan.xsl
RESULT_XSL_COMMON=	${XSLDIR}/jca-result-2000-common.xsl
DEFAULT_XSL=		${RESULT_XSL}
DEFAULT_XSL_UTF8=	${RESULT_XSL_UTF8}

CSSFILE=		jca-concour.css
XSLT_PARAMS+=		-param "output-base" "'$(basename $@)'"

include ${SRCTOPDIR}/config.mk
include ${SRCTOPDIR}/rule.mk

%-saiten.html:	%.html
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -iso2022 $@
	${XMLDECL_FIX} $@

%-saiten.utfhtml:	%.utfhtml
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -utf8 $@
	${XMLDECL_FIX} $@

###

index.html:	DEFAULT_XSL=${XHTML10_XSL}
index.html:	CSSFILE=default.css

index.utfhtml:	DEFAULT_XSL_UTF8=${XHTML10_XSL_UTF8}
index.utfhtml:	CSSFILE=default.css

${INSTFILES_HTML_KANSAI}: kansai.xml ${RESULT_XSL_COMMON} ${DEFAULT_XSL}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} \
		-IN $< -XSL ${DEFAULT_XSL} ${XSLT_PARAMS}
	${SLEEP} 1
	${HTML_FORMAT} -m -iso2022 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

${INSTFILES_HTML_KANSAI:%.html=%.utfhtml}: kansai.utfxml ${RESULT_XSL_COMMON} ${DEFAULT_XSL_UTF8}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} \
		-IN $< -XSL ${DEFAULT_XSL_UTF8} ${XSLT_PARAMS}
	${SLEEP} 1
	${HTML_FORMAT} -m -utf8 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

${INSTFILES_HTML_KUMAMOTO}: kumamoto.xml ${RESULT_XSL_COMMON} ${DEFAULT_XSL}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} \
		-IN $< -XSL ${DEFAULT_XSL} ${XSLT_PARAMS}
	${SLEEP} 1
	${HTML_FORMAT} -m -iso2022 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

${INSTFILES_HTML_KUMAMOTO:%.html=%.utfhtml}: kumamoto.utfxml ${RESULT_XSL_COMMON} ${DEFAULT_XSL_UTF8}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} \
		-IN $< -XSL ${DEFAULT_XSL_UTF8} ${XSLT_PARAMS}
	${SLEEP} 1
	${HTML_FORMAT} -m -utf8 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

${INSTFILES_HTML_KYUSHU}: kyushu.xml ${RESULT_XSL_COMMON} ${DEFAULT_XSL}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} \
		-IN $< -XSL ${DEFAULT_XSL} ${XSLT_PARAMS}
	${SLEEP} 1
	${HTML_FORMAT} -m -iso2022 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

${INSTFILES_HTML_KYUSHU:%.html=%.utfhtml}: kyushu.utfxml ${RESULT_XSL_COMMON} ${DEFAULT_XSL_UTF8}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} \
		-IN $< -XSL ${DEFAULT_XSL_UTF8} ${XSLT_PARAMS}
	${SLEEP} 1
	${HTML_FORMAT} -m -utf8 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

${INSTFILES_HTML_SHIKOKU}: shikoku.xml ${RESULT_XSL_COMMON} ${DEFAULT_XSL}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} \
		-IN $< -XSL ${DEFAULT_XSL} ${XSLT_PARAMS}
	${SLEEP} 1
	${HTML_FORMAT} -m -iso2022 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

${INSTFILES_HTML_SHIKOKU:%.html=%.utfhtml}: shikoku.utfxml ${RESULT_XSL_COMMON} ${DEFAULT_XSL_UTF8}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} \
		-IN $< -XSL ${DEFAULT_XSL_UTF8} ${XSLT_PARAMS}
	${SLEEP} 1
	${HTML_FORMAT} -m -utf8 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

${HOKKAIDO_HTML}: hokkaido.xml ${RESULT_XSL_COMMON} ${DEFAULT_XSL}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} \
		-IN $< -XSL ${DEFAULT_XSL} ${XSLT_PARAMS}
	${SLEEP} 1
	${HTML_FORMAT} -m -iso2022 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

${HOKKAIDO_HTML:%.html=%.utfhtml}: hokkaido.utfxml ${RESULT_XSL_COMMON} ${DEFAULT_XSL_UTF8}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} \
		-IN $< -XSL ${DEFAULT_XSL_UTF8} ${XSLT_PARAMS}
	${SLEEP} 1
	${HTML_FORMAT} -m -utf8 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

${TOHOKU_HTML}: tohoku.xml ${RESULT_XSL_COMMON} ${DEFAULT_XSL}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} \
		-IN $< -XSL ${DEFAULT_XSL} ${XSLT_PARAMS}
	${SLEEP} 1
	${HTML_FORMAT} -m -iso2022 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

${TOHOKU_HTML:%.html=%.utfhtml}: tohoku.utfxml ${RESULT_XSL_COMMON} ${DEFAULT_XSL_UTF8}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} \
		-IN $< -XSL ${DEFAULT_XSL_UTF8} ${XSLT_PARAMS}
	${SLEEP} 1
	${HTML_FORMAT} -m -utf8 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@
