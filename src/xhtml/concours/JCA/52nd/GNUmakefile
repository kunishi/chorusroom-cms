# Makefile for 
# Copyright (C) 1999 KUNISHIMA Takeo <kunishi@c.oka-pu.ac.jp>
#
# $Id: GNUmakefile,v 1.59 2000/10/04 15:44:21 kunishi Exp $

NATIONAL_HTML=	highschool-1999-10-30.html \
		highschool-1999-10-31.html \
		national-1999-11-20.html \
		national-1999-11-21.html
CHUBU_HTML=	chubu-09-25.html chubu-09-26.html
HOKKAIDO_HTML=	hokkaido.html hokkaido-1999-09-12.html
KANSAI_HTML=	kansai-09-23.html kansai-10-17.html kansai-10-24.html
SHIMANE_HTML=	shimane-junior.html shimane-senior.html

INSTFILES_HTML+=	index.html
INSTFILES_HTML+=	aichi.html
INSTFILES_HTML+=	chiba.html
INSTFILES_HTML+=	${CHUBU_HTML}
INSTFILES_HTML+=	chugoku.html
INSTFILES_HTML+=	fukuoka.html
INSTFILES_HTML+=	fukushima.html
INSTFILES_HTML+=	${HOKKAIDO_HTML}
INSTFILES_HTML+=	hyogo.html
INSTFILES_HTML+=	kagoshima.html
INSTFILES_HTML+=	kanagawa.html
INSTFILES_HTML+=	${KANSAI_HTML}
INSTFILES_HTML+=	kanto.html
INSTFILES_HTML+=	kyushu.html
INSTFILES_HTML+=	mie.html
INSTFILES_HTML+=	miyagi.html
INSTFILES_HTML+=	nagano.html
INSTFILES_HTML+=	${SHIMANE_HTML}
INSTFILES_HTML+=	shizuoka.html
INSTFILES_HTML+=	tohoku.html
INSTFILES_HTML+=	yamagata.html
INSTFILES_HTML+=	${NATIONAL_HTML}

INSTFILES_HTML_SAITEN+=	chubu-09-25-saiten.html
INSTFILES_HTML_SAITEN+=	chubu-09-26-saiten.html
INSTFILES_HTML_SAITEN+=	kansai-09-23-saiten.html
INSTFILES_HTML_SAITEN+=	kansai-10-17-saiten.html
INSTFILES_HTML_SAITEN+=	hokkaido-saiten.html
INSTFILES_HTML_SAITEN+=	kanto-saiten.html
INSTFILES_HTML_SAITEN+=	nagano-saiten.html

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

%.html: %.xml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -in $< -xsl ${DEFAULT_XSL} \
	  -param "output-base" "'$(basename $@)'"
	${HTML_FORMAT} -m -iso2022 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

%.utfhtml: %.utfxml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -in $< -xsl ${DEFAULT_XSL_UTF8} \
	  -param "output-base" "'$(basename $@)'"
	${HTML_FORMAT} -m -utf8 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

%-saiten.html: %.html
	${HTML_FORMAT} -m -iso2022 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

%-saiten.utfhtml: %.utfhtml
	${HTML_FORMAT} -m -utf8 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

###

index.html: %.html : %.xml ${XHTML10_XSL}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${XHTML10_XSL} -OUT $@
	${HTML_FORMAT} -m -iso2022 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

index.utfhtml: %.utfhtml : %.utfxml ${XHTML10_XSL_UTF8}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${XHTML10_XSL_UTF8} -OUT $@
	${HTML_FORMAT} -m -utf8 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

${CHUBU_HTML}:	chubu.xml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL} \
	   -param "output-base" "'$(basename $@)'"
	${HTML_FORMAT} -m -iso2022 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

${CHUBU_HTML:%.html=%.utfhtml}:	chubu.utfxml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL_UTF8} \
	   -param "output-base" "'$(basename $@)'"
	${HTML_FORMAT} -m -utf8 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

${KANSAI_HTML}: kansai.xml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL} \
	   -param "output-base" "'$(basename $@)'"
	${HTML_FORMAT} -m -iso2022 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

${KANSAI_HTML:%.html=%.utfhtml}: kansai.utfxml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL_UTF8} \
	   -param "output-base" "'$(basename $@)'"
	${HTML_FORMAT} -m -utf8 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

${NATIONAL_HTML}: national.xml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL} \
	   -param "output-base" "'$(basename $@)'"
	${HTML_FORMAT} -m -iso2022 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

${NATIONAL_HTML:%.html=%.utfhtml}: national.utfxml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL_UTF8} \
	   -param "output-base" "'$(basename $@)'"
	${HTML_FORMAT} -m -utf8 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

${HOKKAIDO_HTML}: hokkaido.xml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL} \
	   -param "output-base" "'$(basename $@)'"
	${HTML_FORMAT} -m -iso2022 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

${HOKKAIDO_HTML:%.html=%.utfhtml}: hokkaido.utfxml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL_UTF8} \
	   -param "output-base" "'$(basename $@)'"
	${HTML_FORMAT} -m -utf8 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@
