# Makefile for 
# Copyright (C) 1999 KUNISHIMA Takeo <kunishi@c.oka-pu.ac.jp>
#
# $Id: GNUmakefile,v 1.38 1999/10/30 13:19:31 kunishi Exp $

RELPATH=	JCA-concours/52nd
SRCTOPDIR=	../../
UTFTOEUC=	hutrans | tcs -f utf -t ujis
EUCTOJIS=	nkf

INSTFILES+=	index.html index.utfhtml
INSTFILES+=	aichi.html aichi.utfhtml
INSTFILES+=	chiba.html chiba.utfhtml
INSTFILES+=	chubu-09-25.html chubu-09-25.utfhtml \
		chubu-09-25-saiten.html chubu-09-25-saiten.utfhtml \
		chubu-09-26.html chubu-09-26.utfhtml \
		chubu-09-26-saiten.html chubu-09-26-saiten.utfhtml
INSTFILES+=	chugoku.html chugoku.utfhtml
INSTFILES+=	fukuoka.html fukuoka.utfhtml
INSTFILES+=	fukushima.html fukushima.utfhtml
INSTFILES+=	hokkaido.html hokkaido.utfhtml \
		hokkaido-saiten.html hokkaido-saiten.utfhtml
INSTFILES+=	hyogo.html hyogo.utfhtml
INSTFILES+=	kagoshima.html kagoshima.utfhtml
INSTFILES+=	kanagawa.html kanagawa.utfhtml
INSTFILES+=	kansai-09-23.html kansai-09-23.utfhtml
INSTFILES+=	kansai-09-23-saiten.html kansai-09-23-saiten.utfhtml
INSTFILES+=	kansai-10-17.html kansai-10-17.utfhtml \
		kansai-10-17-saiten.html kansai-10-17-saiten.utfhtml
INSTFILES+=	kansai-10-24.html kansai-10-24.utfhtml
INSTFILES+=	kanto.html kanto.utfhtml \
		kanto-saiten.html kanto-saiten.utfhtml
INSTFILES+=	kyushu.html kyushu.utfhtml
INSTFILES+=	mie.html mie.utfhtml
INSTFILES+=	miyagi.html miyagi.utfhtml
INSTFILES+=	shizuoka.html shizuoka.utfhtml
INSTFILES+=	tohoku.html tohoku.utfhtml
INSTFILES+=	yamagata.html yamagata.utfhtml
INSTFILES+=	highschool-1999-10-30.html highschool-1999-10-30.utfhtml

include ${SRCTOPDIR}/config.mk

RESULT_XSL=		result-eucjp.xsl
RESULT_XSL_UTF8=	result-utf8.xsl
DEFAULT_XSL=		${RESULT_XSL}
DEFAULT_XSL_UTF8=	${RESULT_XSL_UTF8}

SPECIAL_RULES=		yes

include ${SRCTOPDIR}/rule.mk

%.html:	%.xml
	${MAKE_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL}

%.utfhtml: %.utfxml
	${MAKE_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8}

###

index.html: %.html : %.xml ${XHTML10_XSL}
	${MAKE_ENV} ${XSLT_PROC} $< ${XHTML10_XSL} > $@

index.utfhtml: %.utfhtml : %.utfxml ${XHTML10_XSL_UTF8}
	${MAKE_ENV} ${XSLT_PROC} $< ${XHTML10_XSL_UTF8} > $@

chubu-09-25.html chubu-09-26.html:	chubu.xml
	${MAKE_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL}

chubu-09-25.utfhtml chubu-09-26.utfhtml:	chubu.utfxml
	${MAKE_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8}

kansai-09-23.html kansai-10-17.html kansai-10-24.html:	kansai.xml
	${MAKE_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL}

kansai-09-23.utfhtml kansai-10-17.utfhtml kansai-10-24.utfhtml:	kansai.utfxml
	${MAKE_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8}

highschool-1999-10-30.html: highschool.xml
	${MAKE_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL}

highschool-1999-10-30.utfhtml: highschool.xml
	${MAKE_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8}

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
