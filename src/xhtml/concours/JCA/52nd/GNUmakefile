# Makefile for 
# Copyright (C) 1999 KUNISHIMA Takeo <kunishi@c.oka-pu.ac.jp>
#
# $Id: GNUmakefile,v 1.63 2000/10/10 00:40:02 kunishi Exp $

NATIONAL_HTML=	highschool-1999-10-30.html \
		highschool-1999-10-31.html \
		national-1999-11-20.html \
		national-1999-11-21.html
CHUBU_HTML=	chubu-09-25.html chubu-09-26.html
HOKKAIDO_HTML=	hokkaido-1999-10-10.html hokkaido-1999-09-12.html
KANSAI_HTML=	kansai-09-23.html kansai-10-17.html kansai-10-24.html

REDIRECT_HTML=	${NATIONAL_HTML} \
		${CHUBU_HTML} \
		${HOKKAIDO_HTML} \
		${KANSAI_HTML}

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
INSTFILES_HTML+=	shimane-junior.html shimane-senior.html
INSTFILES_HTML+=	shizuoka.html
INSTFILES_HTML+=	tohoku.html
INSTFILES_HTML+=	yamagata.html
INSTFILES_HTML+=	${NATIONAL_HTML}

INSTFILES_HTML_SAITEN+=	chubu-09-25-saiten.html
INSTFILES_HTML_SAITEN+=	chubu-09-26-saiten.html
INSTFILES_HTML_SAITEN+=	kansai-09-23-saiten.html
INSTFILES_HTML_SAITEN+=	kansai-10-17-saiten.html
INSTFILES_HTML_SAITEN+=	hokkaido-1999-10-10-saiten.html
INSTFILES_HTML_SAITEN+=	kanto-saiten.html
INSTFILES_HTML_SAITEN+=	nagano-saiten.html

INSTFILES+=	${INSTFILES_HTML} \
		${INSTFILES_HTML:%.html=%.utfhtml} \
		${INSTFILES_HTML_SAITEN} \
		${INSTFILES_HTML_SAITEN:%.html=%.utfhtml}

RESULT_XSL=		${XSLDIR}/jca-result-1999-eucjp-xalan.xsl
RESULT_XSL_UTF8=	${XSLDIR}/jca-result-1999-utf8-xalan.xsl
RESULT_XSL_COMMON=	${XSLDIR}/jca-result-1999-common.xsl
DEFAULT_XSL=		${RESULT_XSL}
DEFAULT_XSL_UTF8=	${RESULT_XSL_UTF8}

CSSFILE=	jca-concour.css

include ${SRCTOPDIR}/config.mk
include ${SRCTOPDIR}/rule.mk

.INTERMEDIATE:	chubu.utfxml hokkaido.utfxml kansai.utfxml national.utfxml
.INTERMEDIATE:	${REDIRECT_HTML:%.html=%.xml}
.INTERMEDIATE:	${REDIRECT_HTML:%.html=%.utfxml}

%-saiten.html: %.html
	$(fixhtml)

%-saiten.utfhtml: TIDY_ENCODING=-utf8
%-saiten.utfhtml: %.utfhtml
	$(fixhtml)

###

index.html:	DEFAULT_XSL=${XHTML10_XSL}
index.html:	CSSFILE=${DEFAULT_CSS}

index.utfhtml:	DEFAULT_XSL=${XHTML10_XSL_UTF8}
index.utfhtml:	CSSFILE=${DEFAULT_CSS}

${REDIRECT_HTML}:	XSLT_OUT=-param "output-base" "'$(basename $@)'"
${REDIRECT_HTML:%.html=%.utfhtml}: XSLT_OUT=-param "output-base" "'$(basename $@)'"

${CHUBU_HTML:%.html=%.xml}:	chubu.xml
	${LN_S} $< $@
${CHUBU_HTML:%.html=%.utfxml}:	chubu.utfxml
	${LN_S} $< $@
${HOKKAIDO_HTML:%.html=%.xml}:	hokkaido.xml
	${LN_S} $< $@
${HOKKAIDO_HTML:%.html=%.utfxml}:	hokkaido.utfxml
	${LN_S} $< $@
${KANSAI_HTML:%.html=%.xml}:	kansai.xml
	${LN_S} $< $@
${KANSAI_HTML:%.html=%.utfxml}:	kansai.utfxml
	${LN_S} $< $@
${NATIONAL_HTML:%.html=%.xml}:	national.xml
	${LN_S} $< $@
${NATIONAL_HTML:%.html=%.utfxml}:	national.utfxml
	${LN_S} $< $@
