# Makefile for 
# Copyright (C) 1999 KUNISHIMA Takeo <kunishi@c.oka-pu.ac.jp>
#
# $Id: GNUmakefile,v 1.58 2000/10/04 06:44:36 kunishi Exp $

NATIONAL_HTML=	highschool-1999-10-30.html \
		highschool-1999-10-31.html \
		national-1999-11-20.html \
		national-1999-11-21.html

CHUBU_HTML=	chubu-09-25.html chubu-09-25-saiten.html \
		chubu-09-26.html chubu-09-26-saiten.html

KANSAI_HTML=	kansai-09-23.html kansai-09-23-saiten.html \
		kansai-10-17.html kansai-10-17-saiten.html \
		kansai-10-24.html

INSTFILES_HTML+=	index.html
INSTFILES_HTML+=	aichi.html
INSTFILES_HTML+=	chiba.html
INSTFILES_HTML+=	${CHUBU_HTML}
INSTFILES_HTML+=	chugoku.html
INSTFILES_HTML+=	fukuoka.html
INSTFILES_HTML+=	fukushima.html
INSTFILES_HTML+=	hokkaido.html hokkaido-saiten.html hokkaido-1999-09-12.html
INSTFILES_HTML+=	hyogo.html
INSTFILES_HTML+=	kagoshima.html
INSTFILES_HTML+=	kanagawa.html
INSTFILES_HTML+=	${KANSAI_HTML}
INSTFILES_HTML+=	kanto.html kanto-saiten.html
INSTFILES_HTML+=	kyushu.html
INSTFILES_HTML+=	mie.html
INSTFILES_HTML+=	miyagi.html
INSTFILES_HTML+=	nagano.html nagano-saiten.html
INSTFILES_HTML+=	shimane-junior.html shimane-senior.html
INSTFILES_HTML+=	shizuoka.html
INSTFILES_HTML+=	tohoku.html
INSTFILES_HTML+=	yamagata.html
INSTFILES_HTML+=	${NATIONAL_HTML}

INSTFILES+=	${INSTFILES_HTML} ${INSTFILES_HTML:%.html=%.utfhtml}

GENFILES+=	${INSTFILES_HTML:%.html=%.jhtml}
GENFILES+=	${INSTFILES_HTML:%.html=%.uhtml}

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
	  -out $@
	${HTML_FORMAT} -m -iso2022 $@
	${PATH_CONFIGURE} $@
	${XMLDECL_FIX} $@

%.utfhtml: %.utfxml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -in $< -xsl ${DEFAULT_XSL_UTF8} \
	  -out $@
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
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL}
	${HTML_FORMAT} -m -iso2022 ${CHUBU_HTML}
	${PATH_CONFIGURE} ${CHUBU_HTML}
	${XMLDECL_FIX} ${CHUBU_HTML}

${CHUBU_HTML:%.html=%.utfhtml}:	chubu.utfxml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL_UTF8}
	${HTML_FORMAT} -m -utf8 ${CHUBU_HTML:%.html=%.utfhtml}
	${PATH_CONFIGURE} ${CHUBU_HTML:%.html=%.utfhtml}
	${XMLDECL_FIX} ${CHUBU_HTML:%.html=%.utfhtml}

${KANSAI_HTML}: kansai.xml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL}
	${HTML_FORMAT} -m -iso2022 ${KANSAI_HTML}
	${PATH_CONFIGURE} ${KANSAI_HTML}
	${XMLDECL_FIX} ${KANSAI_HTML}

${KANSAI_HTML:%.html=%.utfhtml}: kansai.utfxml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL_UTF8}
	${HTML_FORMAT} -m -utf8 ${KANSAI_HTML:%.html=%.utfhtml}
	${PATH_CONFIGURE} ${KANSAI_HTML:%.html=%.utfhtml}
	${XMLDECL_FIX} ${KANSAI_HTML:%.html=%.utfhtml}

${NATIONAL_HTML}: national.xml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL}
	${HTML_FORMAT} -m -iso2022 ${NATIONAL_HTML}
	${PATH_CONFIGURE} ${NATIONAL_HTML}
	${XMLDECL_FIX} ${NATIONAL_HTML}

${NATIONAL_HTML:%.html=%.utfhtml}: national.utfxml ${RESULT_XSL_COMMON}
	${ENV} ${JAVA_ENV} ${XSLT_PROC} -IN $< -XSL ${DEFAULT_XSL_UTF8}
	${HTML_FORMAT} -m -utf8 ${NATIONAL_HTML:%.html=%.utfhtml}
	${PATH_CONFIGURE} ${NATIONAL_HTML:%.html=%.utfhtml}
	${XMLDECL_FIX} ${NATIONAL_HTML:%.html=%.utfhtml}
