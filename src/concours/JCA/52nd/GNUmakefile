# Makefile for 
# Copyright (C) 1999 KUNISHIMA Takeo <kunishi@c.oka-pu.ac.jp>
#
# $Id: GNUmakefile,v 1.43 1999/12/18 14:24:44 kunishi Exp $

UTFTOEUC=	hutrans | tcs -f utf -t ujis
EUCTOJIS=	nkf

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
INSTFILES_HTML+=	hokkaido.html hokkaido-saiten.html
INSTFILES_HTML+=	hyogo.html
INSTFILES_HTML+=	kagoshima.html
INSTFILES_HTML+=	kanagawa.html
INSTFILES_HTML+=	${KANSAI_HTML}
INSTFILES_HTML+=	kanto.html kanto-saiten.html
INSTFILES_HTML+=	kyushu.html
INSTFILES_HTML+=	mie.html
INSTFILES_HTML+=	miyagi.html
INSTFILES_HTML+=	shizuoka.html
INSTFILES_HTML+=	tohoku.html
INSTFILES_HTML+=	yamagata.html
INSTFILES_HTML+=	${NATIONAL_HTML}

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

%.utfhtml: %.utfxml
	${XSLT_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8}

###

index.html: %.html : %.xml ${XHTML10_XSL}
	${XSLT_ENV} ${XSLT_PROC} $< ${XHTML10_XSL} > $@

index.utfhtml: %.utfhtml : %.utfxml ${XHTML10_XSL_UTF8}
	${XSLT_ENV} ${XSLT_PROC} $< ${XHTML10_XSL_UTF8} > $@

${CHUBU_HTML}:	chubu.xml
	${XSLT_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL}

${CHUBU_HTML:%.html=%.utfhtml}:	chubu.utfxml
	${XSLT_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8}

${KANSAI_HTML}:	kansai.xml
	${XSLT_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL}

${KANSAI_HTML:%.html=%.utfhtml}:	kansai.utfxml
	${XSLT_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8}

${NATIONAL_HTML}: national.xml
	${XSLT_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL}

${NATIONAL_HTML:%.html=%.utfhtml}: national.utfxml
	${XSLT_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8}

## dummy target.
## *-saiten.{html,utfhtml} is actually generated from *.xml.
chubu-09-25.utfhtml:
chubu-09-25-saiten.utfhtml:
chubu-09-26.utfhtml:
chubu-09-26-saiten.utfhtml:
hokkaido-saiten.utfhtml:
kansai-09-23-saiten.utfhtml:
kansai-10-17-saiten.utfhtml:
kanto-saiten.utfhtml:
