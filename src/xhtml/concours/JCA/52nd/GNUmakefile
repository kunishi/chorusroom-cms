# Makefile for 
# Copyright (C) 1999 KUNISHIMA Takeo <kunishi@c.oka-pu.ac.jp>
#
# $Id: GNUmakefile,v 1.66 2001/02/06 02:29:59 kunishi Exp $

USE_NEW_SCHEME=	yes

INSTFILES+=	index.html

INSTFILES_TRADITIONAL+=	aichi.html
INSTFILES_TRADITIONAL+=	chiba.html
INSTFILES_TRADITIONAL+=	${CHUBU_HTML}
INSTFILES_TRADITIONAL+=	chugoku.html
INSTFILES_TRADITIONAL+=	fukuoka.html
INSTFILES_TRADITIONAL+=	fukushima.html
INSTFILES_TRADITIONAL+=	${HOKKAIDO_HTML}
INSTFILES_TRADITIONAL+=	hyogo.html
INSTFILES_TRADITIONAL+=	kagoshima.html
INSTFILES_TRADITIONAL+=	kanagawa.html
INSTFILES_TRADITIONAL+=	${KANSAI_HTML}
INSTFILES_TRADITIONAL+=	kanto.html
INSTFILES_TRADITIONAL+=	kyushu.html
INSTFILES_TRADITIONAL+=	mie.html
INSTFILES_TRADITIONAL+=	miyagi.html
INSTFILES_TRADITIONAL+=	nagano.html
INSTFILES_TRADITIONAL+=	shimane-junior.html shimane-senior.html
INSTFILES_TRADITIONAL+=	shizuoka.html
INSTFILES_TRADITIONAL+=	tohoku.html
INSTFILES_TRADITIONAL+=	yamagata.html
INSTFILES_TRADITIONAL+=	${NATIONAL_HTML}

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

INSTFILES_TRADITIONAL_SAITEN+=	chubu-09-25-saiten.html
INSTFILES_TRADITIONAL_SAITEN+=	chubu-09-26-saiten.html
INSTFILES_TRADITIONAL_SAITEN+=	kansai-09-23-saiten.html
INSTFILES_TRADITIONAL_SAITEN+=	kansai-10-17-saiten.html
INSTFILES_TRADITIONAL_SAITEN+=	hokkaido-1999-10-10-saiten.html
INSTFILES_TRADITIONAL_SAITEN+=	kanto-saiten.html
INSTFILES_TRADITIONAL_SAITEN+=	nagano-saiten.html
INSTFILES_TRADITIONAL+=	${INSTFILES_TRADITIONAL_SAITEN}

INSTFILES_UTF8=	${INSTFILES_TRADITIONAL:%.html=%.utfhtml}

INSTFILES+=	${INSTFILES_TRADITIONAL} \
		${INSTFILES_UTF8}

${INSTFILES_TRADITIONAL}: DEFAULT_XSL=${XSLDIR}/jca-comp-result.traditional.xsl
${INSTFILES_TRADITIONAL}: XSLT_PARAMS+=-param "output-base" "$(basename $@)"
${INSTFILES_TRADITIONAL}: XSLT_OUT=-out /dev/null

${INSTFILES_UTF8}: DEFAULT_XSL=${XSLDIR}/jca-comp-result.utf8.xsl
${INSTFILES_UTF8}: XSLT_PARAMS+=-param "output-base" "$(basename $@)"
${INSTFILES_UTF8}: XSLT_OUT=-out /dev/null

include ${SRCTOPDIR}/config.mk
include ${SRCTOPDIR}/rule.mk

.INTERMEDIATE:	chubu.utfxml hokkaido.utfxml kansai.utfxml national.utfxml
.INTERMEDIATE:	${REDIRECT_HTML:%.html=%.xml}
.INTERMEDIATE:	${REDIRECT_HTML:%.html=%.utfxml}

###

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
