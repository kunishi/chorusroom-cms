# Makefile for 
# Copyright (C) 1999 KUNISHIMA Takeo <kunishi@c.oka-pu.ac.jp>
#
# $Id: GNUmakefile,v 1.29 1999/09/27 09:48:11 kunishi Exp $

RELPATH=	JCA-concours/52nd
SRCTOPDIR=	../../
UTFTOEUC=	hutrans | tcs -f utf -t ujis
EUCTOJIS=	nkf

INSTFILES+=	index.html index.utfhtml
INSTFILES+=	aichi.html aichi.utfhtml
INSTFILES+=	chiba.html chiba.utfhtml
INSTFILES+=	chubu.html chubu.utfhtml
INSTFILES+=	chugoku.html chugoku.utfhtml
INSTFILES+=	fukuoka.html fukuoka.utfhtml
INSTFILES+=	fukushima.html fukushima.utfhtml
INSTFILES+=	hyogo.html hyogo.utfhtml
INSTFILES+=	kagoshima.html kagoshima.utfhtml
INSTFILES+=	kanagawa.html kanagawa.utfhtml
INSTFILES+=	kansai-09-23.html kansai-09-23.utfhtml
INSTFILES+=	kyushu.html kyushu.utfhtml
INSTFILES+=	mie.html mie.utfhtml
INSTFILES+=	miyagi.html miyagi.utfhtml
INSTFILES+=	shizuoka.html shizuoka.utfhtml
INSTFILES+=	tohoku.html tohoku.utfhtml
INSTFILES+=	yamagata.html yamagata.utfhtml

include ${SRCTOPDIR}/config.mk

RESULT_XSL=		result-iso2022jp.xsl
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

kansai-09-23.html:	kansai.xml
	${MAKE_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL}

kansai-09-23.utfhtml:	kansai.utfxml
	${MAKE_ENV} ${XSLT_PROC} $< ${DEFAULT_XSL_UTF8}
