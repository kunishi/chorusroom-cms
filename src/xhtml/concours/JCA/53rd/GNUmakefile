# Makefile for 	-*-Makefile-*-
# Copyright (C) 2000 KUNISHIMA Takeo kunishi@c.oka-pu.ac.jp
# $Id: GNUmakefile,v 1.43 2000/10/05 14:29:04 kunishi Exp $

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
INSTFILES_HTML+=	yamagata.html
INSTFILES_HTML+=	yamaguchi.html

INSTFILES_HTML_KANSAI=	kansai-highschool.html
INSTFILES_HTML_KUMAMOTO= kumamoto.html kumamoto2.html
INSTFILES_HTML_KYUSHU=	kyushu-2000-09-10.html
INSTFILES_HTML_SHIKOKU=	shikoku-2000-09-02.html shikoku-2000-09-03.html

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

include ${SRCTOPDIR}/config.mk

RESULT_XSL=		result-eucjp-xalan.xsl
RESULT_XSL_UTF8=	result-utf8-xalan.xsl
RESULT_XSL_COMMON=	result-common.xsl
DEFAULT_XSL=		${RESULT_XSL}
DEFAULT_XSL_UTF8=	${RESULT_XSL_UTF8}

SPECIAL_RULES=		yes

include ${SRCTOPDIR}/rule.mk

%.html: %.xml ${RESULT_XSL_COMMON} ${DEFAULT_XSL}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL} \
	  -param "output-base" "'$(basename $@)'"
	${SLEEP} 1
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -iso2022 $@
	${XMLDECL_FIX} $@

%.utfhtml: %.utfxml ${RESULT_XSL_COMMON} ${DEFAULT_XSL_UTF8}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL_UTF8} \
	  -param "output-base" "'$(basename $@)'"
	${SLEEP} 1
	${HTML_FORMAT} -m -utf8 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

%-saiten.html:	%.html
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -iso2022 $@
	${XMLDECL_FIX} $@

%-saiten.utfhtml:	%.utfhtml
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -utf8 $@
	${XMLDECL_FIX} $@

###

index.html:	%.html : %.xml ${XHTML10_XSL}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${XHTML10_XSL} -OUT $@
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -iso2022 $@
	${XMLDECL_FIX} $@

index.utfhtml:	%.utfhtml : %.utfxml ${XHTML10_XSL_UTF8}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${XHTML10_XSL_UTF8} -OUT $@
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -utf8 $@
	${XMLDECL_FIX} $@

${INSTFILES_HTML_KANSAI}: kansai.xml ${RESULT_XSL_COMMON} ${DEFAULT_XSL}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL} \
	  -param "output-base" "'$(basename $@)'"
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -iso2022 $@
	${XMLDECL_FIX} $@
	${SLEEP} 1 && ${TOUCH} $@

${INSTFILES_HTML_KANSAI:%.html=%.utfhtml}: kansai.utfxml ${RESULT_XSL_COMMON} ${DEFAULT_XSL_UTF8}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL_UTF8} \
	  -param "output-base" "'$(basename $@)'"
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -utf8 $@
	${XMLDECL_FIX} $@
	${SLEEP} 1 && ${TOUCH} $@

${INSTFILES_HTML_KUMAMOTO}: kumamoto.xml ${RESULT_XSL_COMMON} ${DEFAULT_XSL}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL} \
	  -param "output-base" "'$(basename $@)'"
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -iso2022 $@
	${XMLDECL_FIX} $@
	${SLEEP} 1 && ${TOUCH} $@

${INSTFILES_HTML_KUMAMOTO:%.html=%.utfhtml}: kumamoto.utfxml ${RESULT_XSL_COMMON} ${DEFAULT_XSL_UTF8}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL_UTF8} \
	  -param "output-base" "'$(basename $@)'"
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -utf8 $@
	${XMLDECL_FIX} $@
	${SLEEP} 1 && ${TOUCH} $@

${INSTFILES_HTML_KYUSHU}: kyushu.xml ${RESULT_XSL_COMMON} ${DEFAULT_XSL}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL} \
	  -param "output-base" "'$(basename $@)'"
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -iso2022 $@
	${XMLDECL_FIX} $@
	${SLEEP} 1 && ${TOUCH} $@

${INSTFILES_HTML_KYUSHU:%.html=%.utfhtml}: kyushu.utfxml ${RESULT_XSL_COMMON} ${DEFAULT_XSL_UTF8}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL_UTF8} \
	  -param "output-base" "'$(basename $@)'"
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -utf8 $@
	${XMLDECL_FIX} $@
	${SLEEP} 1 && ${TOUCH} $@

${INSTFILES_HTML_SHIKOKU}: shikoku.xml ${RESULT_XSL_COMMON} ${DEFAULT_XSL}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL} \
	  -param "output-base" "'$(basename $@)'"
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -iso2022 $@
	${XMLDECL_FIX} $@
	${SLEEP} 1 && ${TOUCH} $@

${INSTFILES_HTML_SHIKOKU:%.html=%.utfhtml}: shikoku.xml ${RESULT_XSL_COMMON} ${DEFAULT_XSL_UTF8}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL_UTF8} \
	  -param "output-base" "'$(basename $@)'"
	${PATH_CONFIGURE} $@
	${HTML_FORMAT} -m -utf8 $@
	${XMLDECL_FIX} $@
	${SLEEP} 1 && ${TOUCH} $@
